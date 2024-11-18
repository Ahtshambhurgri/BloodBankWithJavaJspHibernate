package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.Entity.BloodAvailability;
import com.Entity.Receiver;
import com.HibernateHelper.HibernateUtil;

public class CheckReceiver extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckReceiver() {
        super();
    }

    // Blood compatibility map
    private static final Map<String, Set<String>> COMPATIBILITY_MAP = new HashMap<>();
    static {
        COMPATIBILITY_MAP.put("a+", Set.of("a+", "a-", "o+", "o-"));
        COMPATIBILITY_MAP.put("a-", Set.of("a-", "o-"));
        COMPATIBILITY_MAP.put("b+", Set.of("b+", "b-", "o+", "o-"));
        COMPATIBILITY_MAP.put("b-", Set.of("b-", "o-"));
        COMPATIBILITY_MAP.put("ab+", Set.of("a+", "a-", "b+", "b-", "ab+", "ab-", "o+", "o-"));
        COMPATIBILITY_MAP.put("ab-", Set.of("a-", "b-", "ab-", "o-"));
        COMPATIBILITY_MAP.put("o+", Set.of("o+", "o-"));
        COMPATIBILITY_MAP.put("o-", Set.of("o-"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("checkifalreadyreceived.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cnic = request.getParameter("cnic");
        String bloodType = request.getParameter("bloodtype").toLowerCase();
        int unitsWant = Integer.parseInt(request.getParameter("units"));

        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            // Check if receiver exists in the database
            SelectionQuery<Receiver> query = session.createSelectionQuery("from Receiver where cnic = :cnic", Receiver.class);
            query.setParameter("cnic", cnic);
            List<Receiver> receivers = query.list();

            Receiver receiver;
            int previousUnits = 0; // Track previous units received
            if (!receivers.isEmpty()) {
                // Receiver found
                receiver = receivers.get(0);
                previousUnits = receiver.getUnitsreceived();
                receiver.setUnits(unitsWant + receiver.getUnits()); // Update current requested units
            } else {
                // Receiver not found
                response.sendRedirect("Receiver.jsp");
                return;
            }

            // Check compatible blood types
            Set<String> compatibleBloodTypes = COMPATIBILITY_MAP.get(bloodType);
            if (compatibleBloodTypes == null || compatibleBloodTypes.isEmpty()) {
                throw new Exception("Invalid blood type or no compatibility found.");
            }

            // Fetch all blood availability records
            SelectionQuery<BloodAvailability> sq = session.createSelectionQuery("from BloodAvailability", BloodAvailability.class);
            List<BloodAvailability> availableBloodList = sq.list();

            int totalRequiredUnits = unitsWant;
            int totalAvailableUnits = 0;

            // Calculate total compatible stock available
            for (BloodAvailability bad : availableBloodList) {
                if (compatibleBloodTypes.contains(bad.getBloodtype()) && bad.getUnits() != null) {
                    totalAvailableUnits += bad.getUnits();
                }
            }

            int unitsReceived = 0;

            // Fulfill blood request dynamically
            for (BloodAvailability bad : availableBloodList) {
                if (totalRequiredUnits == 0) break; // Stop if requirement is fulfilled

                if (compatibleBloodTypes.contains(bad.getBloodtype()) && bad.getUnits() != null && bad.getUnits() > 0) {
                    int stockUnits = bad.getUnits();
                    int toDeduct = Math.min(stockUnits, totalRequiredUnits); // Deduct what is possible

                    bad.setUnits(stockUnits - toDeduct); // Update stock
                    session.merge(bad); // Save updated stock to database
                    totalRequiredUnits -= toDeduct; // Decrease remaining required units
                    unitsReceived += toDeduct; // Track total received units
                }
            }

            // Update receiver's total received units
            receiver.setUnitsreceived(previousUnits + unitsReceived);
            session.merge(receiver);

            // Commit transaction and respond to user
            tx.commit();

            if (unitsReceived > 0) {
                String message = totalAvailableUnits >= unitsWant
                        ? "Blood transfusion completed successfully for " + unitsWant + " units."
                        : "Only " + unitsReceived + " units were available. Partial transfusion completed.";
                request.setAttribute("success", true);
                request.setAttribute("message", message);
            } else {
                request.setAttribute("success", false);
                request.setAttribute("message", "No compatible blood units are available.");
            }

            request.getRequestDispatcher("BloodAvailability.jsp").forward(request, response);
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("success", false);
            request.setAttribute("message", "Receive blood failed due to an error.");
            request.getRequestDispatcher("Receiver.jsp").forward(request, response);
        } finally {
            session.close();
        }

    }
}
