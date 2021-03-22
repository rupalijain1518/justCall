
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,java.sql.*"%>

<jsp:include page="Header.jsp"/>


<%
    

    Statement Smt;
    ResultSet Rs;
    Connection Con;
    String unm="";
    int bid;

    if(session.getAttribute("unm")==null)
        response.sendRedirect("Login.jsp");        
    else   
    unm = session.getAttribute("unm").toString();
    
    
    
        Con=ConnectionInfo.Db.getConnection();
        Smt = Con.createStatement();

    
    if(request.getParameter("Block") != null)
    {            
        bid = Integer.parseInt(request.getParameter("bid"));        
                Con=ConnectionInfo.Db.getConnection();    
                Smt = Con.createStatement();
                String qry = "Update BusinessTB Set Status='Blocked'  where BussId="+bid;
                Smt.executeUpdate(qry);              
               out.print("Business blocked successfully.....");
    }

       /*====================================================================*/ 
     if(request.getParameter("bid")!=null)
    {
        bid = Integer.parseInt(request.getParameter("bid"));
        Rs = Smt.executeQuery("Select * from businesstb where BussId="+bid);
        if(Rs.next())
        {
        %>
        
        <form action="BlockBusiness1.jsp" method="get">
        
            <input type="hidden" name="bid" value="<% out.print(Rs.getString("BussID")); %>"  />
            
        <table align="center" cellpadding="20">


            <tr>
                <td>Business Title</td>  <td><input type="text" name="buss_title" value="<%out.print(Rs.getString("Business")); %>" /></td>
                <td>Description </td>   <td><input type="text" name="desc" value="<%out.print(Rs.getString("Description")); %>" /></td>
            </tr>

            <tr>
                <td>Category </td><td><Select name="cat" style="padding:7px 7px 7px 7px">
                        
                                        <option><%out.print(Rs.getString("Category")); %></option>                        
                                                                <option>Crockery</option>
                                                                <option>Electronics</option>
                                                                <option>Furniture</option>
                                                                <option>Mobile & Tablet</option>
                                                                <option>Computer & Laptop</option>
                                                                <option>Printing Press</option>
                                                                <option>Medicine & Drug</option>
                                                                <option>Health & Fitness</option>
                                                        </Select></td> 
                 <td>Mobile </td><td>                    <input type="text" name="mob" value="<%out.print(Rs.getString("Mobile")); %>" /></td>
            </tr>

            <tr>
                <td>Open Time</td><td>                      <input type="time" name="optime" value="<%out.print(Rs.getString("OpenTime")); %>" /></td>
                <td>Contact Person </td><td>            <input type="text" name="con_to" value="<%out.print(Rs.getString("ContactPerson")); %>" /></td>    
            </tr>

            <tr>
                <td>Close Time </td><td>          <input type="time" name="cltime" value="<%out.print(Rs.getString("CloseTime")); %>" /></td>
                <td>State </td><td> 		<select name="state" style="padding:7px 7px 7px 7px">                
                                                <option><%out.print(Rs.getString("State")); %></option>                
                                                        <option>U</option>
                                                        <option>P</option>
                                                        <option>H</option>
                                                        <option>R</option>
                                                </select></td>
           </tr>
            <tr>
                <td>City </td><td> 		<select name="city" style="padding:7px 7px 7px 7px">
                                                <option><%out.print(Rs.getString("City")); %></option>
                                                        <option>B</option>
                                                        <option>S</option>
                                                        <option>H</option>
                                                        <option>R</option>
                                                        </select></td>
            <td colspan=2 align=center><input type="submit" value="Block" name="Block"/></td>
            </tr>


                </table>

       </form>
        
        
        <%
        
        }   
    }
    
         

%>



<jsp:include page="Footer.jsp"/>