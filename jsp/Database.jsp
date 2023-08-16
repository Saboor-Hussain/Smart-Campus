<%@page import = "java.sql.*,util.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Database Connectivity</title>
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
	p{
		margin-top: 150px;
		margin-left: 50px;
		color: rgb(158, 2, 2);
		font-size: 20px;
		font-weight: 800;
	}
</style>
</head>

<body background="../images/portal_bg.jpg">

	<%
	   String name , password, gender, type,userpic;
	   int id;
	   String date; 
	    
	   id = Integer.parseInt(request.getParameter("userID"));
	   name = request.getParameter("userName");
	   password = request.getParameter("userPassowrd");
	   gender = request.getParameter("userGender");
	   type = request.getParameter("userType");
	   userpic = request.getParameter("userPic");
	   
	   date = request.getParameter("userDOB");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aitportal3","root","");
			out.println("<center>");
				out.println("<h1>"+"<img src='../images/logo.png'  alt='ait_logo' width='170px'>"+"</h1>");
				out.println("<h2 style='color:green;'>Record Have Been Saved</h2>");
				out.println("<a href='../htmlFiles/signIn.html' >Click here to Login </a>");
			out.println("</center>");
				out.println("<br>");
			PreparedStatement ps = con.prepareStatement("insert into Students(UserId ,UserName,Password,userType,userGender,DOB,userPicture) values ( ?,?,?,?,?,?,?) ");
			ps.setInt(1,id);
			ps.setString(2,name);
			ps.setString(3,password);
			ps.setString(4,type);
			ps.setString(5,gender);
			ps.setString(6,date);
			ps.setString(7,userpic);
				

			int x = ps.executeUpdate();
				
			con.close();
		}
		catch(Exception e)
		{
		out.println("<p>"+"MySQL Database Not Connected Error: "+e+"</p>");
		}
%>
</body>
</html>
