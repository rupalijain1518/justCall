
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>



<jsp:include page="Header.jsp"/>

<div style="padding-top:40px;">

<%
    
    
    
    Statement Smt;
    ResultSet Rs;
    Connection Con;
    String unm="";
    char found='n';

    if(session.getAttribute("unm")==null)
        response.sendRedirect("Login.jsp");        
    else   
    unm = session.getAttribute("unm").toString();
    

    
                String qry = "select * from businesstb where Status='Blocked'";
                
                Con=ConnectionInfo.Db.getConnection();
                Smt = Con.createStatement();

                Rs = Smt.executeQuery(qry);
                
                
                out.print("<table width='100%' class='CssTable' >");
                out.print("<tr><td style='padding:20px;'>Edit</td><td>Product</td><td>Category</td><td>Open Time</td><td>Close Time</td><td>Mobile</td><td>ContactPerson</td><td>State</td><td>City</td><td>Detele</td></tr>");
                while(Rs.next())
                {
                    %>

                    <tr align=center >
                        <td style="padding:15px;"> <a href="UnBlockBusiness1.jsp?bid=<% out.print(Rs.getString("BussId"));  %>" style="color:Black;" >Edit</a> </td>
                            <td> <% out.print(Rs.getString("Business"));  %>
                            <td> <% out.print(Rs.getString("Category"));  %>
                            <td> <% out.print(Rs.getString("OpenTime"));  %>
                            <td> <% out.print(Rs.getString("CloseTime"));  %> </td>
                            <td> <% out.print(Rs.getString("Mobile"));  %> </td>
                            <td> <% out.print(Rs.getString("ContactPerson"));  %> </td>
                            <td> <% out.print(Rs.getString("State"));  %> </td>
                            <td> <% out.print(Rs.getString("City"));  %> </td>
                        <td style="padding:15px;"> <a href="DeleteBusiness.jsp?bid=<% out.print(Rs.getString("BussId"));  %>" style="color:Black;" >Delete</a> </td>                            
                    </tr>
                    
<%
                found='y';
                }
                out.print("</table>");
                
                if(found=='n')    
                out.print("No result found.");
%>


</div>

<jsp:include page="Footer.jsp"/>