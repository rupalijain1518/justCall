
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>

<jsp:include page="Header.jsp"/>

    <header>
        <h2>Search<i class="fa fa-search" style="margin-left: 20px;"></i></h2>
    </header>
    <center>
        <div class="box">


    <form action="Search.jsp" method="GET">
        
        
        <div class="row uniform 50%">
					
            <div class="6u 12u(mobilep)" style="width:60%;">
                    <input type="text" name="srch" style="width:500px;" value='<% if(request.getParameter("srch")!=null) out.print(request.getParameter("srch").toString());  %>'/>
            </div>

            <div class="6u 12u(mobilep)" style="width:20%;">
                    <input type="submit" value="Search" name='submit' />
            </div>

            
            <div class="6u 12u(mobilep)" style="width:20%;">
                    
                                <select name="cat">
                                                    

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
                                            </select>

            </div>
            
</div>	


<% 
    
    if((request.getParameter("srch")==null || request.getParameter("srch").toString().trim().length()==0) && request.getParameter("submit")!=null)
        out.print("<p style='padding-top:30px;'>No keyword found.</p>");
    
        
    else if(request.getParameter("srch")!=null && request.getParameter("srch").toString().trim().length()!=0)
    {

                String cat="";
                String srch = request.getParameter("srch");                
           /*     srch = srch.trim().replaceAll("\\s+", " ");
                
                srch = srch.replaceAll(" ", "%' or business like '%");                
                srch = " (business like '%"+srch+"%')";                

                if(request.getParameter("cat")==null || request.getParameter("cat").toString().equals("Select Category")== true)
                    cat="%";                    
                 else
                    cat = request.getParameter("cat");
             */    
                char found='n';

                        
                
                String qry = "select * from businesstb where Business='"+srch+"' and status='Unblock'";
                
              
                Connection Con=ConnectionInfo.Db.getConnection();
                Statement Smt = Con.createStatement();

                ResultSet Rs = Smt.executeQuery(qry);
               
               
                out.print("<table width='100%'  style='margin-bottom:150px;margin-top:30px;'>");
                out.print("<tr align=center><td>Business</td><td>Open Time</td><td>Close Time</td><td>Mobile</td><td>ContactPerson</td><td>City</td><td>More Info.</td></tr>");
                while(Rs.next())
                {
                    String bid = Rs.getString("BussID");
                    
                    %>

                    <tr align=center>
                            <td> <% out.print(Rs.getString("Business"));  %> </td>
                            <td> <% out.print(Rs.getString("OpenTime"));  %> </td>
                            <td> <% out.print(Rs.getString("CloseTime"));  %> </td>
                            <td> <% out.print(Rs.getString("Mobile"));  %> </td>
                            <td> <% out.print(Rs.getString("ContactPerson"));  %> </td>
                            <td> <% out.print(Rs.getString("City"));  %> </td>
                            <td><a href='MoreInfo.jsp?bid=<% out.print(bid);  %>'>Show</a></td>                              
                    </tr>
                    
<%
                found='y';
                }
                
                
                if(found=='n')    
                out.print("<tr><td colspan=7 style='text-align:center;padding:20px;' >No result found.</td></tr>");
                
          out.print("</table>");      

    }


          
    
%>



</form>    
    
        </div>

    </center>


<jsp:include page="Footer.jsp"/>