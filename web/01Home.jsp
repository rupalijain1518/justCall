

<jsp:include page="Header.jsp"/>


    <header>
						<h2>Search</h2>

					</header>
    <center>
        <div class="box">


    <form action="Search.jsp" method="GET">

        
	<div class="row uniform 50%">
					
            <div class="6u 12u(mobilep)" style="width:80%;">
                    <input type="text" name="srch" placeholder="Search business here..."  />
            </div>

            <div class="6u 12u(mobilep)" style="width:20%;">
                    <input type="submit" value="Search" />
            </div>
										
	</div>
        
	<div class="row uniform 50%">
					
            <div class="6u 12u(mobilep)" style="width:100%;">
                    <select name="cat" style="width:250px;" >
                                                    
                <%if(request.getParameter("cat")!=null) 
                    out.print("<option>"+request.getParameter("cat") + "</option>"); 
                else
                    out.print("<option>Select Category</option>"); 
                %>

                                                    <option>Crockery</option>
                                                    <option>Education</option>
                                                    <option>Electronics</option>
                                                    <option>Furniture</option>
                                                    <option>Mobile & Tablet</option>
                                                    <option>Computer & Laptop</option>
                                                    <option>Printing Press</option>
                                                    <option>Medicine & Drug</option>
                                                    <option>Health & Fitness</option>
</select>

            </div>
									
	</div>
        

                
    </form>    
    
</div>
        
</center>
    
    
<jsp:include page="Footer.jsp"/>