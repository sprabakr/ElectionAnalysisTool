<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.swing.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
	float[] perVoted;
	perVoted = new float[4];
	String state="";
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
			state = request.getParameter("State");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the HelloWorld.jsp
			String str ="SELECT year, IF(year=2000,total_votes/2000pop,IF(year=2004,total_votes/2004pop,IF(year=2008,total_votes/2008pop,IF(year=2012,total_votes/2012pop,0))))*100 as percentVoted FROM (SELECT * from ConsistedState WHERE state='"+state+"')pop INNER JOIN Population ON pop.state=Population.state ORDER BY year";
			//Run the query against the database.

			ResultSet result = stmt.executeQuery(str);
			//Make an HTML table to show the results in:
			int i=0;
			//parse out the results
			while (result.next()) {
				//make a row
				//Print out current beer name:
				//String a=result.getString("percentVoted");			
				//perVoted[i]=Integer.parseInt(a);
				//out.print(a);
				perVoted[i]=Float.valueOf(result.getString("percentVoted"));

				i++;

			}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
	<%out.print(state); %>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBackgroundColor);

    function drawBackgroundColor() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Year');
          data.addColumn('number', 'Percentage');

          data.addRows([
            ["2000", <%out.print(Float.toString(perVoted[0])); %>],   ["2004", <%out.print(Float.toString(perVoted[1])); %>],  ["2008", <%out.print(Float.toString(perVoted[2])); %>],  ["2012", <%out.print(Float.toString(perVoted[3])); %>]
      
          ]);

          var options = {
            hAxis: {
              title: 'Year'
            },
            vAxis: {
              title: 'Percentage of Population that voted'
            },
            backgroundColor: '#f1f8e9'
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
          chart.draw(data, options);
        }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 900px; height: 500px"></div>
  </body>

</body>
</html>