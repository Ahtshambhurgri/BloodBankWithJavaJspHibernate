package com.servlets;


import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.Entity.BloodAvailability;
import com.Entity.DonorEntity;
import com.HibernateHelper.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@MultipartConfig
public class Donor extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Donor() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
    	response.sendRedirect("Donor.jsp");
    }
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
				Session session= sessionFactory.openSession();
				Transaction tx = session.beginTransaction();
				DonorEntity de = new DonorEntity();
				String name = request.getParameter("name");
				String contact  = request.getParameter("contact");
				String cnic = request.getParameter("cnic");
				String dob = request.getParameter("dob");
				String gender = request.getParameter("gender");
				String bloodGroup = request.getParameter("blood_group");
				int unitsdonated= Integer.parseInt(request.getParameter("unitsdonated"));
				
				boolean success = false;
				try {
					
				
					
					BloodAvailability bad = session.get(BloodAvailability.class, bloodGroup);
					
					if(bad.getUnits() == null) {
						bad.setUnits(unitsdonated + 0);
					}
					else {
						int total = bad.getUnits() + unitsdonated;
	 					bad.setUnits(total);
					}
					de.setUnits(unitsdonated);
					de.setName(name);
					de.setCnic(cnic);
					de.setContactnumber(contact);
					de.setDateOfBirth(dob);
					de.setBloodtype(bloodGroup);
					de.setGender(gender);
					session.persist(de);
					session.merge(bad);
					tx.commit();
					success = true;
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					session.close();
					
				}
				if(success) {
					request.setAttribute("success", true);
					request.setAttribute("message", "Thank you for donating!");
					request.getRequestDispatcher("BloodAvailability.jsp").forward(request, response);

				}
				else {
					request.setAttribute("success", false);
					request.setAttribute("message", "Error occurred. Please try again.");
					request.getRequestDispatcher("Donor.jsp").forward(request, response);

				}
					
					


	}

}
