<%@page import = "java.sql.*,util.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}

	h1{
		margin-top: 40px;
    }

	h2{
		margin-top: 5%;
		margin-bottom: 40px;
		font-family: Arial, Helvetica, sans-serif;
		font-size: 36px;
	}

	a{
		text-decoration: none;
		width: 95%;
        /* height: 10%; */
        background-color: lavender;
        font-size: 14px;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        padding: 14px 30px;
        color: #333;
        letter-spacing: 1px;
        margin-bottom: 50px;
		border: 1px solid black;

	}
	a:hover{
		background-color: #333;
		color: white;
	}
</style>
</head>

<body background="../images/portal_bg.jpg">
	<%
	   String uid,pass;
	   
	   uid = request.getParameter("userName");
	   pass = request.getParameter("userPassword");

	   

	   session.setAttribute("user", uid); 
	   session.setAttribute("pass", pass);
	   
	   
	   try
		 {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aitportal3","root","");

		 PreparedStatement pst = con.prepareStatement("SELECT * FROM students WHERE UserName = ? AND Password = ? ");
		 pst.setString(1,uid);
	   	 pst.setString(2,pass);
		 ResultSet rs = pst.executeQuery();
			 if (rs.next())
			 {
	  		
				response.sendRedirect("dashboard.jsp");

			 }
			 else{
			 out.println("<center>");
			 out.println("<h1>"+"<img src='../images/logo.png'  alt='ait_logo' width='160px'>"+"</h1>");
			 out.print(" <h2 style='color:red'> Record is not found </h2>");
			 out.println("<a href='../htmlFiles/signIn.html'>Click here to go Back</a>");
			 out.println("</center>");
			 }
	   }
	   
		 catch(Exception e)
		 {
			out.println("<h3 style='çolor:red'> Error: "+e+"<h3>");
			out.println("<a href='../htmlFiles/signIn.html'>Click here to go Back</a>");
		 } 
	   
	   %>
</body>
</html>
