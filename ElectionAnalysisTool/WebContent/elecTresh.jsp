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
			String entity = request.getParameter("Year");
			String entity2 = request.getParameter("Elec");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String str ="SELECT * FROM ConsistedState WHERE State IN (SELECT name FROM State where electoralVotes>"+entity2+")&& year="+entity;      
			//Run the query against the database.
			String str1 ="SELECT sum(democratic) as total_Democrats,sum(republican) as total_Republicans,sum(total_votes) as total FROM ConsistedState WHERE State IN (SELECT name FROM State where electoralVotes>"+entity2+")&& year= "+entity;      
			ResultSet result = stmt.executeQuery(str);
			//ResultSet result1 = stmt.executeQuery(str1);
			

			//Make an HTML table to show the results in:
			out.print("<table>");
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current beer name:
			out.print("democratic");
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print("republican");
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print("state");
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print("total_votes");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("democratic"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("republican"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("state"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("total_votes"));
				out.print("</td>");
				out.print("</tr>");

			}
			
			out.print("</table>");
			Statement stmt1 = con.createStatement();
			ResultSet result1 = stmt1.executeQuery(str1);
			result1.next();
			out.print("<br>");
			out.print("Democrats have a total vote of: "+result1.getString("total_Democrats"));
			out.print("</br>");
			out.print("<br>");
			out.print("Republicans have a total vote of: "+result1.getString("total_Republicans"));
			out.print("</br>");
			out.print("<br>");
			out.print("There is a total vote of: "+result1.getString("total"));
			out.print("</br>");
			con.close();
			//close the connection.

		} catch (Exception e) {
		}
		
	%>

</body>
</html>