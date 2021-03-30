package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AgendaImpl;
import model.IAgendaLocal;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Serv")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IAgendaLocal agenda;
	
    /**
     * Default constructor. 
     */
    public Servlet() {
        super();
        this.agenda = new AgendaImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");	
		if (op.equals("AddPerson")) {
			System.out.println("Add person started...");
			this.agenda.AddPerson(request.getParameter("firstName"), request.getParameter("lastName"));
			System.out.println("Add person done with success");
			request.getRequestDispatcher("index.html").forward(request, response);
		} else if (op.equals("AddAddress")) {
			this.agenda.AddAddress(request.getParameter("street"), request.getParameter("city"));
			request.getRequestDispatcher("index.html").forward(request, response);
		} else if (op.equals("Associate")) {
			System.out.println("Associate started...");
			request.setAttribute("PersonList", this.agenda.personList());
			request.setAttribute("AddressList",this.agenda.addressList());
			request.getRequestDispatcher("Associate.jsp").forward(request, response);
			System.out.println("List done with success");
		} else if (op.equals("List")) {
			System.out.println("List started...");
			request.setAttribute("PersonList", this.agenda.personList());
			request.setAttribute("AddressList",this.agenda.addressList());
			request.getRequestDispatcher("List.jsp").forward(request, response);
			System.out.println("List done with success");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
