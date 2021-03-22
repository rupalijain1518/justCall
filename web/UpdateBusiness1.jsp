
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

    
    if(request.getParameter("Update") != null)
    {            
        bid = Integer.parseInt(request.getParameter("bid"));        
        
    if(request.getParameter("buss_title")==null || request.getParameter("buss_title").toString().length()==0)
        out.print("Must input business title");

    else if(request.getParameter("cat")==null || request.getParameter("cat").toString().equals("Select Category"))
        out.print("Product category not selected");

    else if(request.getParameter("optime")==null || request.getParameter("optime").toString().length()==0)
        out.print("Must input open time of business");

    else if(request.getParameter("cltime")==null || request.getParameter("cltime").toString().length()==0)
    out.print("Must input close time of business");

    else if(request.getParameter("state")==null || request.getParameter("state").toString().equals("Select State"))
        out.print("State not selected");
    
    else if(request.getParameter("city")==null || request.getParameter("city").toString().equals("Select city"))
        out.print("City not selected");

    else
    {

                Con=ConnectionInfo.Db.getConnection();    
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
                String img = "Not Available";

                String qry = "Update businesstb Set Business='"+buss_title+"',Category='"+category+"',OpenTime='"+optime+"',CloseTime='"+cltime+"',Description='"+desc+"',Mobile='"+mobile+"',ContactPerson='"+contact+"',State='"+state+"',City='"+city+"' where BussId="+bid;

               // out.print(qry);
                
                Smt.executeUpdate(qry);
                
               
                out.print("Data update successfully.....");
    }            

    }

       /*====================================================================*/ 
    
    if(request.getParameter("bid")!=null)
    {
        bid = Integer.parseInt(request.getParameter("bid"));

        Rs = Smt.executeQuery("Select * from businesstb where BussId="+bid);

        
        if(Rs.next())
        {
        
        %>
        
        <form action="UpdateBusiness1.jsp" method="get">
        
            <input type="hidden" name="bid" value="<%out.print(Rs.getString("BussID")); %>" hidden />
            
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
                                                                <option>Education</option>
                                                        
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
            <td colspan=2 align=center><input type="submit" value="Update" name="Update"/></td>
            </tr>


                </table>

       </form>
        
        
        <%
        
        }   
    }
    
         

%>



<jsp:include page="Footer.jsp"/>