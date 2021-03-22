
<%
if(session.getAttribute("unm")!=null)    
session.invalidate();

%>


<jsp:include page="Header.jsp"/>


    <header>
            <h2>Logout<i class="fa fa-lock" style="margin-left: 20px;"></i></h2>
            <p>Thank you for visiting our website.</p>
    </header>
    <center>
					<div class="box" style="width:60%;">

                                            <h1>LogOut Sucessfull.........</h1>
                                        </div>
    </center>


<jsp:include page="Footer.jsp"/>