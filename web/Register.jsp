<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>

<jsp:include page="Header.jsp"/>
    <header>

            <h2>Register New User<i class="fa fa-user" style="margin-left: 20px;"></i></h2>

    </header>

    <center>
        <div class="box">
            

<form action="Register.jsp" id="f1" method="Post">
 <table>

<tr><td><h3>Username </h3></td><td>         <input type="text" name="unm" /></td></tr>
<tr><td><h3>Password </h3></td><td>          <input type="password" name="pwd" /></td></tr>
<tr><td><h3>Confirm Password </h3></td><td> <input type="password" name="cpwd" /></td></tr>
<tr><td><h3>Name </h3></td><td>              <input type="text" name="nam" /></td></tr>
<tr><td><h3>Gender </h3></td><td>            <input type="radio" name="gen" value="Male" />Male
																<input type="radio" name="gen" value="Female" />Female</td></tr>
<tr><td><h3>Date of Birth </h3></td><td>     <input type="date" name="dob" /></td></tr>
<tr><td><h3>Address </h3></td><td>            <input type="text" name="add" /></td></tr>
<tr><td><h3>State </h3></td><td>             <select name="state">
                                                 <option>UP</option>
						<option>Patna</option>
                                                <option>Harayana</option>
						<option>Rajasthan</option>                 </select></td></tr>

<tr><td><h3>City </h3></td><td>              <select name="city">
					<option>delhi</option>
						<option>jaipur</option>
                                                <option>jind</option>
						<option>Raipur</option>
                                    </select></td></tr>

<tr><td><h3>Pincode </h3></td><td>            <input type="text" name="pin" /></td></tr>
<tr><td><h3>Mobile </h3></td><td>            <input type="text" name="mob" /></td></tr>

<tr><td colspan=2 align=center>		<input type="Submit" value="Register" /></td></tr>

</table>

</form>


<% 
    
    Statement Smt;

    if(request.getParameter("unm") != null)
    {
    
            String unm = request.getParameter("unm");


            Connection Con=ConnectionInfo.Db.getConnection();

            Smt = Con.createStatement();
            
            ResultSet Rs = Smt.executeQuery("Select * from register where Username='"+unm+"'");

            if(Rs.next())        
                out.println("Username Already Exists.");
            
            else if(request.getParameter("unm").toString().trim().equals(""))
    out.print("Must input username");
        
    else if(!Pattern.matches("[a-zA-Z0-9]{5,31}", request.getParameter("unm").toString()))
    out.print("Incorrect format in username, only alphanumeric values allowed with minimum 5 digits.");

    else if(request.getParameter("pwd").toString().trim().equals(""))
    out.print("Must input password");
    
    else if(!Pattern.matches("[a-zA-Z0-9]{8,31}", request.getParameter("pwd")))
    out.print("Incorrect format in password, only alphanumeric values allowed with minimum 8 digits.");
    
    else if(request.getParameter("cpwd").toString().trim().equals(""))
    out.print("Must input confirm password");

    else if(!Pattern.matches("[a-zA-Z0-9]{5,31}", request.getParameter("cpwd")))
    out.print("Incorrect format in confirm password, only alphanumeric values allowed with minimum 8 digits.");

    else if(request.getParameter("pwd").toString().equals(request.getParameter("cpwd").toString())==false)
    out.print("Password Mismatch");
    
    else if(request.getParameter("nam").toString().trim().equals(""))
    out.print("Must input name");
    
    else if(!Pattern.matches("[a-zA-Z\\s]*", request.getParameter("nam")))
    out.print("Incorrect format in name, only alphabets and spaces.");

    else if(request.getParameter("gen")==null)
    out.print("Must select gender");

    else if(request.getParameter("dob")==null)
    out.print("Must input date of birth");

    else if(request.getParameter("add").toString().trim().equals(""))
    out.print("Must input address");
    
    else if(request.getParameter("pin").toString().trim().equals(""))
    out.print("Must input pincode");

    else if(!Pattern.matches("[0-9]{6}", request.getParameter("pin")))
    out.print("Incorrect format in pincode, only 6 digits numeric value.");

    else if(request.getParameter("mob").toString().trim().equals(""))
    out.print("Must input mobile number");

    else if(!Pattern.matches("[0-9]{10}", request.getParameter("mob")))
    out.print("Incorrect format in mobile, only 10 digits numeric value.");
            
            
            else
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

                
                String qry = "insert into register values('"+unm+"','"+pwd+"','"+nam+"','"+gen+"','"+dob+"','"+add+"','"+state+"','"+city+"','"+pin+"','"+mob+"','"+role+"','Unblock')";

                Smt.executeUpdate(qry);
                
                    session.setAttribute("unm",unm);
                    
                    out.print("Registration Successfull...");

            }
    }
    
    
%>

        </div>
    </center>

<jsp:include page="Footer.jsp"/>

