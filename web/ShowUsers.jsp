
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>

<jsp:include page="Header.jsp"/>

    <header>
            <h2>Users<i class="fa fa-users" style="margin-left: 20px;"></i></h2>
            <p>List of All Users</p>
    </header>
    <center>
					<div class="box" style="width:100%;">

<%
    
                String qry = "select * from register";
                
                Connection Con=ConnectionInfo.Db.getConnection();
                Statement Smt = Con.createStatement();

                ResultSet Rs = Smt.executeQuery(qry);
                
                out.print("<table>");
                                out.print("<tr><td>Username</td><td>Password</td><td>Name</td><td>Gender</td><td>DOB</td><td>Address</td><td>State</td><td>City</td><td>PinCode</td><td>Mobile</td><td>Role</td></tr>");
                while(Rs.next())
                {
                    %>

                    <tr align=center>

                            <td> <% out.print(Rs.getString("Username"));  %> </td>
                            <td> <% out.print(Rs.getString("Password"));  %> </td>
                            <td> <% out.print(Rs.getString("Name"));  %> </td>
                            <td> <% out.print(Rs.getString("Gender"));  %> </td>
                            <td> <% out.print(Rs.getString("DOB"));  %> </td>
                            <td> <% out.print(Rs.getString("Address"));  %> </td>
                            <td> <% out.print(Rs.getString("State"));  %> </td>
                            <td> <% out.print(Rs.getString("City"));  %> </td>
                            <td> <% out.print(Rs.getString("PinCode"));  %> </td>
                            <td> <% out.print(Rs.getString("Mobile"));  %> </td>
                            <td> <% out.print(Rs.getString("Role"));  %> </td>

                    </tr>
                    
<%
                  }        
                
                out.print("</table");
    
%>



                                        </div>
    </center>

<jsp:include page="Footer.jsp"/>