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
			String entity = request.getParameter("State");
			String entity2 = request.getParameter("Year");
			String entity3 = request.getParameter("Party");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String str ="Select *from Banks where ClosingYear>2000&&ClosingYear<2005"; 
			String str1 ="Select *from Banks where ClosingYear>2004&&ClosingYear<2009";      
			String str2 ="Select *from Banks where ClosingYear>2008&&ClosingYear<2013";      
			String str3 ="Select *from Banks where ClosingYear>2012&&ClosingYear<2017";      
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("After 2000 election");
			out.print("	<head><style>table, th, td {border: 1px solid black;}</style></head><table style= 'width:100'>");
			out.print("<table>");		
			out.print("<tr>");
			out.print("<td>");
			out.print("Bank Name");
			out.print("</td>");
			out.print("<td>");
			out.print("City");
			out.print("</td>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Acquiring Institution");
			out.print("</td>");
			out.print("<td>");
			out.print("Closing Date");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("BankName"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("City"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ST"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("AcquiringInstitution"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ClosingDate"));
			out.print("</td>");
			out.print("</tr>");

			}
			out.print("</table>");
			result = stmt.executeQuery(str1);
			out.print("After 2004 election");
			out.print("<table>");		
			out.print("<tr>");
			out.print("<td>");
			out.print("Bank Name");
			out.print("</td>");
			out.print("<td>");
			out.print("City");
			out.print("</td>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Acquiring Institution");
			out.print("</td>");
			out.print("<td>");
			out.print("Closing Date");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("BankName"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("City"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ST"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("AcquiringInstitution"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ClosingDate"));
			out.print("</td>");
			out.print("</tr>");

			}
			out.print("</table>");
			result = stmt.executeQuery(str2);
			out.print("After 2008 election");
			out.print("<table>");		
			out.print("<tr>");
			out.print("<td>");
			out.print("Bank Name");
			out.print("</td>");
			out.print("<td>");
			out.print("City");
			out.print("</td>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Acquiring Institution");
			out.print("</td>");
			out.print("<td>");
			out.print("Closing Date");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("BankName"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("City"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ST"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("AcquiringInstitution"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ClosingDate"));
			out.print("</td>");
			out.print("</tr>");

			}
			out.print("</table>");
			//close the connection.
			result = stmt.executeQuery(str3);
			out.print("After 2012 election");
			out.print("<table>");		
			out.print("<tr>");
			out.print("<td>");
			out.print("Bank Name");
			out.print("</td>");
			out.print("<td>");
			out.print("City");
			out.print("</td>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Acquiring Institution");
			out.print("</td>");
			out.print("<td>");
			out.print("Closing Date");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row

			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("BankName"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("City"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ST"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("AcquiringInstitution"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("ClosingDate"));
			out.print("</td>");
			out.print("</tr>");

			}
			out.print("</table>");
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>