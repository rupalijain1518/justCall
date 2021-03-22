
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>



    <jsp:include page="Header.jsp" />

    <header>
            <h2>Login<i class="fa fa-key" style="margin-left: 20px;"></i></h2>
            <p>Welcome to JustCall.com</p>
    </header>
    <center>
					<div class="box" style="width:60%;">

    
    <div style="margin: 45px 0px 85px 0px;">


<form action="Login.jsp" method="Post">

    <br><input type="text" name="unm" value="" placeholder="Username" />
    <br></br> <input type="password" name="pwd" value="" placeholder="Password" />
    <br></br> <input type="submit" name="submit" value="Login" /> </td>
    


<% 
    

    if( (request.getParameter("unm") != null)  && (request.getParameter("pwd") != null))
    {
    
String unm = request.getParameter("unm");
String pwd = request.getParameter("pwd");

Connection Con=ConnectionInfo.Db.getConnection();

Statement Smt = Con.createStatement();
ResultSet Rs = Smt.executeQuery("Select * from register where Username='"+unm+"' and Password='"+pwd+"'");

if(Rs.next())
{
    session.setAttribute("unm",unm);
    session.setAttribute("role",Rs.getString("Role"));
    response.sendRedirect("Home.jsp");
}   
    //out.println("Registration Succesfull <br>Name : "+Rs.getString(3)+" <br>Role : "+Rs.getString(10)+"");

        
                
                

else    
    out.println("<br></br> Invalid username password.");
    
    }
%>
                              
<br></br> <a href="Register.jsp">Register new user</a>            


</form>

    </div>

<center>
</div>
				</section>
<jsp:include page="Footer.jsp"/>

