<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<head>
	<style>
	table, th, td {
	    border: 1px solid black;
	}
	</style>
	</head>
	<table style= "width:100">
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Create a connection string
			String url = "jdbc:mysql://election.ccfraztmywd7.us-east-1.rds.amazonaws.com:3306/election";
			//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
			Class.forName("com.mysql.jdbc.Driver");

			//Create a connection to your DB
			Connection con = DriverManager.getConnection(url, "sprabakr", "10190118922a");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the HelloWorld.jsp
			String entity = request.getParameter("Congress");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String str;
			if(entity.equals("reps")){
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			str ="SELECT * FROM Congress ORDER BY repsH +repsS DESC LIMIT 1";     

			
			}else if(entity.equals("dems")){
				
				str ="SELECT * FROM Congress ORDER BY demsH+demsS DESC LIMIT 1";     

			}else if(entity.equals("others")){
				str ="SELECT * FROM Congress ORDER BY othersH+othersS DESC LIMIT 1";     
			}else{
				 str ="SELECT * FROM Congress ORDER BY "+ entity+ " DESC LIMIT 1";     
				
			}			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//out.print("<table style= width:100>");
			out.print("<tr>");
			out.print("<td>");
			out.print("Congress");
			out.print("</td>");
			out.print("<td>");
			out.print("Democratic House Of Representatives");
			out.print("</td>");
			out.print("<td>");
			out.print("Democratic Senate");
			out.print("</td>");
			out.print("<td>");
			out.print("Other House Of Representatives");
			out.print("</td>");
			out.print("<td>");
			out.print("Other Senate");
			out.print("</td>");
			out.print("<td>");
			out.print("Republican House of Representatives");
			out.print("</td>");
			out.print("<td>");
			out.print("Republican Senate");
			out.print("</td>");
			out.print("<td>");
			out.print("Year");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(result.getString("congress"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("demsH"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("demsS"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("othersH"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("othersS"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("repsH"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("repsS"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("years"));
				out.print("</td>");
				out.print("</tr>");

			}
			//out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
	</table>

</body>
</html>