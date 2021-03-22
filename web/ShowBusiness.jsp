
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>

<jsp:include page="Header.jsp"/>

    <header>
            <h2>Business<i class="fa fa-btc" style="margin-left: 20px;"></i></h2>
            <p>List of All Businesses</p>
    </header>
    <center>
					<div class="box" style="width:100%;">

<%
    
                String qry = "select * from businesstb";
                
                Connection Con=ConnectionInfo.Db.getConnection();
                Statement Smt = Con.createStatement();

                ResultSet Rs = Smt.executeQuery(qry);
        
                
                //out.print("<table width='100%' cellspacing=10px cellpadding=20px >");
                out.print("<table>");
                out.print("<tr><td>Business</td><td>OpenTime</td><td>CloseTime</td><td>Mobile</td><td>ContactPerson</td><td>City</td></tr>");
                while(Rs.next())
                {
                    %>

                    <tr align=center>

                        <td> <% out.print(Rs.getString("Business"));  %> </td>
                        <td> <% out.print(Rs.getString("OpenTime"));  %> </td>
                        <td> <% out.print(Rs.getString("CloseTime"));  %> </td>
                        <td> <% out.print(Rs.getString("Mobile"));  %> </td>
                        <td> <% out.print(Rs.getString("ContactPerson"));  %> </td>
                        <td> <% out.print(Rs.getString("City"));  %> </td>

                    </tr>
                    
<%
                  }        
                
                out.print("</table");
    
%>


</div>

    </center>
<jsp:include page="Footer.jsp"/>