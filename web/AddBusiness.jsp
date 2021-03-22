
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<jsp:include page="Header.jsp"/>


    <header>
        <h2>Add Business<i class="fa fa-cubes" style="margin-left: 20px;"></i></h2>

    </header>
    <center>
        <div class="box">


<%
  String unm="";
 
    if(session.getAttribute("unm")==null)
        response.sendRedirect("Login.jsp");        
    else   
    unm = session.getAttribute("unm").toString();

%>


<form action="AddBusiness.jsp" method="Post" >

<table align="center" cellpadding="20">


    <tr><td>Business Title</td><td>          <input type="text" name="buss_title" value="<%if(request.getParameter("buss_title")!=null) out.print(request.getParameter("buss_title")); %>" /></td>  <td>Description </td><td>               <input type="text" name="desc" value="<%if(request.getParameter("desc")!=null) out.print(request.getParameter("desc")); %>" /></td>    </tr>
    
    <tr><td>Category </td><td>                    <Select name="cat" style="padding:7px 7px 7px 7px">
                
                <%if(request.getParameter("cat")!=null) 
                    out.print("<option>"+request.getParameter("cat") + "</option>"); 
                else
                    out.print("<option>Select Category</option>"); 
                %>
                                                    <option>Crockery</option>
                                                    <option>Electronics</option>
                                                    <option>Furniture</option>
                                                    <option>Mobile & Tablet</option>
                                                    <option>Computer & Laptop</option>
                                                    <option>Printing Press</option>
                                                    <option>Medicine & Drug</option>
                                                    <option>Health & Fitness</option>
                                                    <option>Education</option>
  <option>Education</option>
            </Select></td> <td>Mobile </td><td>                    <input type="text" name="mob" value="<%if(request.getParameter("mob")!=null) out.print(request.getParameter("mob")); %>" /></td>   </tr>

    <tr><td>Open Time</td><td>                      <input type="time" name="optime" value="<%if(request.getParameter("optime")!=null) out.print(request.getParameter("optime")); %>" /></td>  <td>Contact Person </td><td>            <input type="text" name="con_to" value="<%if(request.getParameter("con_to")!=null) out.print(request.getParameter("con_to")); %>" /></td>    </tr>
    
    <tr><td>Close Time</td><td>          <input type="time" name="cltime" value="<%if(request.getParameter("cltime")!=null) out.print(request.getParameter("cltime")); %>" /></td> <td>State </td><td> 		<select name="state" style="padding:7px 7px 7px 7px">

                <%if(request.getParameter("state")!=null) 
                    out.print("<option>"+request.getParameter("state") + "</option>"); 
                else
                    out.print("<option>Select Category</option>"); 
                %>

                                                <option>UP</option>
						<option>Patna</option>
                                                <option>Harayana</option>
						<option>Rajasthan</option>
					</select></td>
   </tr>
    
    

    <tr><td>City </td><td> 			<select name="city" style="padding:7px 7px 7px 7px">

                <%if(request.getParameter("city")!=null) 
                    out.print("<option>"+request.getParameter("city") + "</option>"); 
                else
                    out.print("<option>Select Category</option>"); 
                %>
                
						<option>delhi</option>
						<option>jaipur</option>
                                                <option>jind</option>
						<option>Raipur</option>
						</select></td>

    <td colspan=2 align=center><input type="submit" value="Add Business" name="submit"/></td>


        </table>

</form>

        </div>
    </center>

<% 
    
    if(request.getParameter("submit")!=null)
    {
    if(request.getParameter("buss_title")==null || request.getParameter("buss_title").toString().length()==0)
        out.print("Must input business title");

    else if(request.getParameter("cat")==null || request.getParameter("cat").toString().equals("Select Category"))
        out.print("Product category not selected");

    else if(request.getParameter("optime")==null || request.getParameter("optime").toString().length()==0)
        out.print("Must input open time of business");

    else if(request.getParameter("cltime")==null || request.getParameter("cltime").toString().length()==0)
        out.print("Must input close time of business");
        
    else if(request.getParameter("desc")==null || request.getParameter("desc").toString().length()==0)
        out.print("Must input description");


        else if(request.getParameter("mob")==null || request.getParameter("mob").toString().length()==0)
        out.print("Must input mobile number");

            else if(request.getParameter("con_to")==null || request.getParameter("con_to").toString().length()==0)
        out.print("Must input contact person name");

    else if(request.getParameter("state")==null || request.getParameter("state").toString().equals("Select State"))
        out.print("State not selected");
    
    else if(request.getParameter("city")==null || request.getParameter("city").toString().equals("Select city"))
        out.print("City not selected");

    else
    {
        
                Statement Smt;
                Connection Con=ConnectionInfo.Db.getConnection();    
                Smt = Con.createStatement();

                String buss_title = request.getParameter("buss_title");                
                String category = request.getParameter("cat");
                String optime = request.getParameter("optime");
                String cltime = request.getParameter("cltime");
                String desc = request.getParameter("desc");
                String mobile = request.getParameter("mob");
                String contact = request.getParameter("con_to");
                String state = request.getParameter("state");
                String city = request.getParameter("city");
                

                String qry = "insert into businesstb(Username,Business,Category,OpenTime,CloseTime,Description,Mobile,ContactPerson,State,City,Closing,Status) values('"+unm+"','"+buss_title+"','"+category+"','"+optime+"','"+cltime+"','"+desc+"','"+mobile+"','"+contact+"','"+state+"','"+city+"','','Unblock')";

                //out.print(qry);
               
                Smt.executeUpdate(qry);

                out.print("Business Added Successfully.");//<br></br><a href='FileUpload1.jsp'>Upload Product Image</a>");
               
                

    }

    }        

    
%>



<jsp:include page="Footer.jsp"/>