<%@page language="java" import = "java.sql.*,util.*" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Dashboard</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	body{
		background-color: #D2D2D2;
	}

	header{
		background-color: #B4B4B4;
		width: 100%;
		height: 10%;
	}

	.img1{
		display: block;
		position: relative;
		float: left;
		width: 70px;
		height: 70px;
		margin-top: 50px;
		margin-left: 40px;
	}

	
	h3{
		display: inline-block;
		font-family: Arial, Helvetica, sans-serif;
		font-weight: 600;
		font-size: 28px;
		margin-top: 50px;
	}

	h2{
		display: block;
		font-family: Arial, Helvetica, sans-serif;
		font-weight: 600;
		font-size: 30px;
	}

	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color: white;
	}
	
	p{
		display: inline-block;
		/* float: right; */
		font-family: Arial, Helvetica, sans-serif;
		position: absolute;
		right: 0;
		margin-right: 50px;
	}

	nav{
		
		margin-top: 40px;
		border:1px solid ;
		width: 95%;
		height: 30px;
		border-radius: 5px;
		border-end-end-radius: 10px;
		border-end-start-radius: 10px;
		border-bottom-width: 8px;
		border-bottom-color: white;
		background-color: #003871;
	}

	button{
		position: relative;
		margin-top: 5px;
		margin-left: 10px;
		border-radius: 5px;
		border: transparent;
		width: 8%;
		height: 25px;
		background-color: #326799;
		color: white;
	}

	button:hover{
		background-color: rgb(53, 64, 223);
		color: rgb(238, 186, 138);
	}

	section{
		border: 1px solid black;
		width: 70%;
		/* padding: 10px; */
		margin-top: 20px;
		border-radius: 5px;
		background-color: white;
	}

	.coltitle{
		border-bottom: 1px solid black;
		position: relative;
		width: 100%;
		background-color: #376EA6;
		padding: 2px;

	}
	label{
		display: block;
		font-size: 24px;
		font-family: Arial, Helvetica, sans-serif ;
		color: white;
		text-align: left;
		padding-left: 20px;
		
	}

	table{
		width: 95%;
		margin: 10px;

	}

	table,td{
		border: 1px solid black;
		border-collapse: collapse;
		background-color: #EEEEEE;
	}

	
	td{
		height: 50px;
		font-family: Arial, Helvetica, sans-serif;
		font:20px bolder;
		font-weight: 400;
		padding: 5px;
		padding-left: 10px;
	}

	tr,td{
		transition: all .2s ease-in-out;
	}
	
	tr:hover{
		transform: scale(1.2);
	}

	.error{
		background-image: url("../images/portal_bg.jpg");
		height: 782px;
	}

	.error img{
		margin-top: 60px;
	}

	.error h2{
		margin-top: 10%;
		margin-bottom: 50px;
	}

	.error a{
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
	.error a:hover{
		background-color: #333;
		color: white;
	}

</style>


</head>

<body>

	<%
		String name;
		name=(String)session.getAttribute("user"); 
		String pass=(String)session.getAttribute("pass");


		try{

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aitportal3","root","");
   
			PreparedStatement pst = con.prepareStatement("SELECT * FROM students WHERE UserName = ?");
			pst.setString(1,name);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
			{
				int id;
				String gender, type,dob,pic;
				id = rs.getInt("UserId");
				gender= rs.getString("userGender");
				type = rs.getString("userType");
				dob = rs.getString("DOB");
				pic = rs.getString("UserPicture");




				// header
				out.println("<center>");
				out.println("<header>");
				out.println("<img class='img1' src='../images/logo.png'>");		//AIT_Image
				out.println("<h3> Aligarh Institute of Technology , Karachi </h3>");
				out.println("<h2> Dashboard"+"</h2>");
				out.println("<a href='logout.jsp' title='Logout'> "+ "<p>"+ name +"</p>"+"</a>");
				

				//nav
				out.println("<nav>");
				out.println("<button>Dashboard</button>");
				out.println("<button>Attendance</button>");
				out.println("<button>My Courses</button>");
				out.println("<button>Fee Challan</button>");
				out.println("</nav>");
			
			out.println("</header>");
			
			
			out.println("<section>");
				
				out.println("<div class='coltitle'>");
				out.println("<label style='text-align: left;'>Profile Information</label>");
				out.println("</div>");
				out.println("<table>");
				out.println("<tr>");
				out.println("<td>Name</td>");
				out.println("<td>"+name+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Gr No.</td>");
				out.println("<td>"+id+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>Gender</td>");
				out.println("<td>"+gender+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td> Type </td>");
				out.println("<td>"+type+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td> Date of Birth </td>");
				out.println("<td>"+dob+"</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td> Picture </td>");
				out.println("<td>"+pic+"</td>");
				out.println("</tr>");
				out.println("</table>");
			
			out.println("</section>");
			
			out.println("</center>");


			 }
			 else{
				out.println("<center>");
				out.println("<div class='error'>");
					out.println("<img src='../images/logo.png' alt='ait_logo' width='160px'>");
					out.print(" <h2 style='color:red;'> Record is not found </h2>");
					out.println("<a href='../htmlFiles/signIn.html'>Click here to go Back</a>");		
				out.println("<div>");
				out.println("</center>");
			 }
		
			
		}
		catch(Exception e)
		 {
			
			out.println("<h2 style='çolor:red'> Error: "+e+"<h2>");
			out.println("<br>");
		 } 
	%>
</body>
</html>
