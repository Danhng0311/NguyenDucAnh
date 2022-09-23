
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.io.IOException;
import java.util.ArrayList;


public class ListPerson extends HttpServlet{

    // Tao 1 thuoc tinh chua cac doi tuong kieu: Person
    ArrayList<Person> list = new ArrayList<>();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Them cac phan tu vao 'list'
        if (list.size()==0) {
            list.add(new Person(1, "Hoang Tung", "male", Date.valueOf("2000-05-15")));
            list.add(new Person(2, "Tuan Nam", "male", Date.valueOf("2002-10-10")));
            list.add(new Person(3, "Ngoc Trinh", "female", Date.valueOf("2004-06-20")));
        }
        
        String out = "";
        out += "<table border='1'>";
        out += "<tr><td>ID</td><td>Name</td><td>Gender</td><td>Dob</td></tr>";
        for (Person p : list) {
            out += "<tr>";
            out += "<td>"+ p.getId() +"</td>";
            out += "<td>"+ p.getName()+"</td>";
            out += "<td>"+ p.getGender()+"</td>";
            out += "<td>"+ p.getDob()+"</td>";
            out += "</tr>";
        }
        out += "</table>";
        out += "<a href='add.html'>Create</a>";
        resp.getWriter().print(out);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("txtId"));
        String name = req.getParameter("txtName");
        String gender = req.getParameter("rbGender");
        Date dob = Date.valueOf(req.getParameter("txtDob"));
        // Add to list
        list.add(new Person(id, name, gender, dob));
        resp.sendRedirect("List");
    }
    
    
}
