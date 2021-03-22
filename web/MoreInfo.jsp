<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>



    <jsp:include page="Header.jsp" />

    <header>
            <h2>Details<i class="fa fa-key" style="margin-left: 20px;"></i></h2>

    </header>
    <center>
					<div class="box" style="width:60%;">

    
    <div style="margin: 45px 0px 85px 0px;">

        
        
<%

    String found="n";

                String bid = request.getParameter("bid");
                String unm = "User";

                String qry = "select * from BusinessTB where BussId='"+bid+"'" ;

                out.print("<div style='width:80%;margin-left:auto;margin-right:auto;padding-top:30px;'><table width='100%' class='CssTable' >");


               Connection Con=ConnectionInfo.Db.getConnection();
               Statement Smt = Con.createStatement();
               ResultSet Rs = Smt.executeQuery(qry);

                while(Rs.next())
                {
                     %>
                        <tr><td>Business</td>	<td> <%  out.print(Rs.getString("Business"));   %></td></tr>
                        <tr><td>Description</td>	<td> <%  out.print(Rs.getString("Description"));   %></td></tr>
                        <tr><td>Open Time</td>	<td> <%  out.print(Rs.getString("OpenTime"));   %></td></tr>
                        <tr><td>Close Time</td>	<td> <%  out.print(Rs.getString("CloseTime"));  %></td></tr>
                        <tr><td>Category</td>	<td> <%  out.print(Rs.getString("Category"));   %></td></tr>
                        <tr><td>State</td>		<td> <%  out.print(Rs.getString("State"));   %></td></tr>
                        <tr><td>City</td>		<td> <%  out.print(Rs.getString("City"));   %></td></tr>
                        <tr><td>Contact Person</td>	<td> <%  out.print(Rs.getString("ContactPerson"));   %></td></tr>
                        <tr><td>Mobile</td>		<td> <%  out.print(Rs.getString("Mobile"));     %></td></tr>


<%
                found="y";
                }
                out.print("</table></div>");

                if(found=="n")
                out.print("No result found.");
 %>



    </div>

<center>
</div>
				</section>
<jsp:include page="Footer.jsp"/>

