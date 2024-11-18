package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import com.Entity.BloodAvailability;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.Entity.DonorEntity;
import com.HibernateHelper.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckDonor
 */
public class CheckDonor extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDonor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("checkifalreadydonated.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pt = response.getWriter();
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		boolean success = false;//this is for sweet alert
		DonorEntity donor=null; 
		boolean isDonor = false;
		
		try {
			 donor = session.get(DonorEntity.class,request.getParameter("cnic"));
			if(donor !=null && donor.getCnic().equals(request.getParameter("cnic"))) {
				isDonor = true;
				BloodAvailability bad = session.get(BloodAvailability.class, request.getParameter("bloodtype"));
				int total = donor.getUnits() +(Integer.parseInt(request.getParameter("units")));
				int totalbad = bad.getUnits() + (Integer.parseInt(request.getParameter("units")));
				bad.setUnits(totalbad);
				pt.print(donor.getCnic());
				donor.setUnits(total);
				session.merge(donor);
				session.merge(bad);
				tx.commit();
				success = true;
			}
			
		}catch(Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}	
		if (!isDonor) {
			request.setAttribute("success", false);
		    request.setAttribute("message", "Please donate!");
		    request.getRequestDispatcher("Donor.jsp").forward(request, response);
		} 
		else if (success) {
			request.setAttribute("success", true);
		    request.setAttribute("message", "Thank you for donating again!");
		    request.getRequestDispatcher("BloodAvailability.jsp").forward(request, response);
		}
		else {
		        // Reload current JSP with an error message
		        request.setAttribute("success", false);
		        request.getRequestDispatcher("checkifalreadydonated.jsp").forward(request, response); // Replace `current.jsp` with your current JSP file name
		 }
	}

}
