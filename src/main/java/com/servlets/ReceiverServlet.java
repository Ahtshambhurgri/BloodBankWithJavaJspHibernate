package com.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

import com.Entity.BloodAvailability;
import com.Entity.Receiver;
import com.HibernateHelper.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class ReceiverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReceiverServlet() {
        super();
    }

    // Blood compatibility map (all in lowercase)
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
        response.sendRedirect("Receiver.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        // Create a new receiver object and populate fields
        Receiver rc = new Receiver();
        rc.setName(request.getParameter("name"));
        rc.setCnic(request.getParameter("cnic"));
        rc.setContact(request.getParameter("contact"));
        rc.setUnits(Integer.parseInt(request.getParameter("units")));
        rc.setDate(request.getParameter("dob"));
        rc.setGender(request.getParameter("gender"));
        String bloodType = request.getParameter("blood_group").toLowerCase(); // Ensure lowercase for compatibility
        rc.setBloodgroup(bloodType);

        boolean statuscheck = false;

        try {
            // Check compatible blood types
            Set<String> compatibleBloodTypes = COMPATIBILITY_MAP.get(bloodType);
            if (compatibleBloodTypes == null || compatibleBloodTypes.isEmpty()) {
                throw new Exception("Invalid blood type or no compatibility found.");
            }

            // Fetch all blood availability records
            SelectionQuery<BloodAvailability> sq = session.createSelectionQuery("from BloodAvailability", BloodAvailability.class);
            List<BloodAvailability> availableBloodList = sq.list();

            int totalRequiredUnits = rc.getUnits();
            int totalAvailableUnits = 0;

            // Check total units available from compatible types
            for (BloodAvailability bad : availableBloodList) {
                if (compatibleBloodTypes.contains(bad.getBloodtype()) && bad.getUnits() != null) {
                    totalAvailableUnits += bad.getUnits();
                }
            }

            int unitsReceived = 0; // New field to track received units

            // Fulfill blood request
            if (totalAvailableUnits >= totalRequiredUnits) {
                int remainingUnits = totalRequiredUnits;

                for (BloodAvailability bad : availableBloodList) {
                    if (remainingUnits == 0) break;

                    if (compatibleBloodTypes.contains(bad.getBloodtype()) && bad.getUnits() != null && bad.getUnits() > 0) {
                        int stockUnits = bad.getUnits();
                        int toDeduct = Math.min(stockUnits, remainingUnits);

                        bad.setUnits(stockUnits - toDeduct);
                        session.merge(bad);
                        remainingUnits -= toDeduct;
                        unitsReceived += toDeduct;
                    }
                }

                rc.setUnitsreceived(unitsReceived); // Set received units
                session.persist(rc);
                tx.commit();
                statuscheck = true;
                request.setAttribute("message", "Blood transfusion completed successfully for " + totalRequiredUnits + " units.");
            } else if (totalAvailableUnits > 0) {
                int remainingUnits = totalAvailableUnits;

                for (BloodAvailability bad : availableBloodList) {
                    if (remainingUnits == 0) break;

                    if (compatibleBloodTypes.contains(bad.getBloodtype()) && bad.getUnits() != null && bad.getUnits() > 0) {
                        int stockUnits = bad.getUnits();
                        int toDeduct = Math.min(stockUnits, remainingUnits);

                        bad.setUnits(stockUnits - toDeduct);
                        session.merge(bad);
                        remainingUnits -= toDeduct;
                        unitsReceived += toDeduct;
                    }
                }

                rc.setUnitsreceived(unitsReceived); // Set received units
                session.persist(rc);
                tx.commit();
                statuscheck = true;
                request.setAttribute("message", "Only " + totalAvailableUnits + " units were available. Partial transfusion completed.");
            } else {
                rc.setUnitsreceived(unitsReceived); // No units received
                session.persist(rc);
                tx.commit();
                request.setAttribute("message", "No compatible blood units are available.");
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while processing the blood transfusion.");
        } finally {
            session.close();
        }

        if (statuscheck) {
        	request.setAttribute("success", true);
        	request.setAttribute("message", "You received blood. Thank you!");
        	request.getRequestDispatcher("BloodAvailability.jsp").forward(request, response);

        } else {
        	request.setAttribute("success", false);
        	request.setAttribute("message", "Error occurred. Please try again.");
        	request.getRequestDispatcher("Receiver.jsp").forward(request, response);

        }
    }
}
