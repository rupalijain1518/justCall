
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>


<jsp:include page="Header.jsp"/>



<%
    

    Statement Smt;
    ResultSet Rs;
    Connection Con;
    String unm="";

    if(session.getAttribute("unm")==null)
        response.sendRedirect("Login.jsp");        
    else   
    unm = session.getAttribute("unm").toString();
    
    
    
        Con=ConnectionInfo.Db.getConnection();
        Smt = Con.createStatement();

    
    if(request.getParameter("Update") != null)
    {            

                String pwd = request.getParameter("pwd");
                String nam = request.getParameter("nam");
                String gen = request.getParameter("gen");
                String dob = request.getParameter("dob");
                String add = request.getParameter("add");
                String state = request.getParameter("state");
                String city = request.getParameter("cty");
                String pin = request.getParameter("pin");
                String mob = request.getParameter("mob");
                String role = "User";

                
                String qry = "Update register set Password='"+pwd+"',Name='"+nam+"',Gender='"+gen+"',DOB='"+dob+"',Address='"+add+"',State='"+state+"',City='"+city+"',PinCode='"+pin+"',Mobile='"+mob+"' where Username='"+unm+"'";

                Smt.executeUpdate(qry);
                
                out.print("Data update successfully.....");


    }

        
    
    

        Rs = Smt.executeQuery("Select * from Register where Username='"+unm+"'");

        
        if(Rs.next())
        {
        
        %>
        
        <form action="UpdateProfile.jsp" method="get" >
        
        <table cellpadding="20" align="center">
                

        <tr>         <td>Username</td>              <td>    <input type='text' name='unm' value='<% out.print(Rs.getString("Username"));  %>' readonly />   </td>      <td>Address</td>           <td>    <input type='text' name='add' value='<% out.print(Rs.getString("Address"));  %>' />   </td>      </tr>

        <tr>         <td>Name</td>              <td>    <input type='text' name='nam' value='<% out.print(Rs.getString("Name"));  %>' />   </td>   <td>State</td>             <td>    <input type='text' name='state' value='<% out.print(Rs.getString("State"));  %>' />   </td>         </tr>

         <% String gender = Rs.getString(6); %>
        
        <tr>         <td>Password</td>         <td>    <input type='password' name='pwd' value='<% out.print(Rs.getString("Password"));  %>' />   </td>   <td>City</td>              <td>    <input type='text' name='city' value='<% out.print(Rs.getString("City"));  %>' />   </td>         </tr>
         
         <tr>         <td>Gender</td>            <td>    <input type='radio' name='gen' value='<% if(gender.equals("Male")) out.print("Checked");  %>' >Male</input><input type='Radio' name='gen' value='<% if(gender.equals("Female")) out.print("Checked");  %>' >Female</input>   </td>    <td>Pincode</td>           <td>    <input type='text' name='pin' value='<% out.print(Rs.getString("PinCode"));  %>' />   </td>        </tr>


        <tr>         <td>Date of Birth</td>     <td>    <input type='date' name='dob' value='<% out.print(Rs.getString("DOB"));  %>' />   </td>  <td>Mobile</td>            <td>    <input type='text' name='mob' value='<% out.print(Rs.getString("Mobile"));  %>' />   </td>          </tr>
        
        
        <tr>         <td colspan=4 align="center" > <input type="submit" value="Update" name="Update"/>   </td>                          </tr>
        
        
        </table>

       </form>
        
        
        <%
        
        }   
       
         

%>




<jsp:include page="Footer.jsp"/>