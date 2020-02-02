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
			String region = request.getParameter("Region");
			String year = request.getParameter("Year");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String rep ="SELECT democratic,republican,state,total_votes, electoralVotes FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'" +region+"'"+ ")&&year="+year+"&&republican>democratic)consis INNER JOIN State ON State.name=consis.state";
			String dem ="SELECT democratic,republican,state,total_votes, electoralVotes FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'" +region+"'"+ ")&& year="+year+"&&democratic>republican)consis INNER JOIN State ON State.name=consis.state";
			//String win="SELECT IF(rep.RepublicanCount>dem.DemocraticCount,'Republican',IF(dem.DemocraticCount>rep.RepublicanCount,'Democratic','Tied')) as winner,RepublicanCount,DemocraticCount FROM (SELECT IF (sum(electoralVotes)>0,sum(electoralVotes),0) as RepublicanCount FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'" +region+"'"+ ")&& year="+year+"&&republican>democratic)consis INNER JOIN State ON State.name=consis.state)rep,(SELECT IF(sum(electoralVotes)>0,sum(electoralVotes),0) as DemocraticCount FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'" +region+"'"+ "')&& year="+year+"&&democratic>republican)consis INNER JOIN State ON State.name=consis.state)dem";
			//Run the query against the database.
			String win="SELECT IF(rep.RepublicanCount>dem.DemocraticCount,'Republican',IF(dem.DemocraticCount>rep.RepublicanCount,'Democratic','Tied')) as winner,RepublicanCount,DemocraticCount FROM (SELECT IF (sum(electoralVotes)>0,sum(electoralVotes),0) as RepublicanCount FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'"+region+"'"+")&& year="+year+"&&republican>democratic)consis INNER JOIN State ON State.name=consis.state)rep,(SELECT IF(sum(electoralVotes)>0,sum(electoralVotes),0) as DemocraticCount FROM (SELECT * FROM ConsistedState WHERE State IN (SELECT name from State where region="+"'"+region+"'"+")&& year="+year+"&&democratic>republican)consis INNER JOIN State ON State.name=consis.state)dem";
			ResultSet result = stmt.executeQuery(rep);
			//ResultSet result1 = stmt.executeQuery(dem);
			//ResultSet result2 = stmt.executeQuery(win);
			//Make an HTML table to show the results in:
			out.print("breakdown for Republicans");
			out.print("	<head><style>table, th, td {border: 1px solid black;}</style></head><table style= 'width:100'>");
			out.print("<tr>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Democratic Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Republican Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Total Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Electoral Votes");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("state"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("democratic"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("republican"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("total_votes"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("electoralVotes"));
				out.print("</td>");
				out.print("</tr>");

			}
		out.print("</table>");
		ResultSet result1 = stmt.executeQuery(dem);
			out.print("breakdown for Democrats:");

			out.print("<table>");
			out.print("<tr>");
			out.print("<td>");
			out.print("State");
			out.print("</td>");
			out.print("<td>");
			out.print("Democratic Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Republican Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Total Votes");
			out.print("</td>");
			out.print("<td>");
			out.print("Electoral Votes");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result1.next()) {
				//make a row
				out.print("<tr>");
				out.print("<td>");
				out.print(result1.getString("state"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("democratic"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("republican"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("total_votes"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("electoralVotes"));
				out.print("</td>");
				out.print("</tr>");

			}
			
			out.print("</table>");
			//parse out the results
			ResultSet result2 = stmt.executeQuery(win);
			while (result2.next()) {
				//make a row
				out.print("The winner was: "+ result2.getString("winner")+", where Republicans got the total number of electoral votes of: "+result2.getString("RepublicanCount")+" and Democrats got the total number of electoral votes of: "+result2.getString("DemocraticCount"));

			}		

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>