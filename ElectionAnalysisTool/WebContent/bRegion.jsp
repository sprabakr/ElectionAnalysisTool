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
	int[] perVoted;
	perVoted = new int[6];
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
			String year = request.getParameter("Year");
			String str;
			if(year.equals("2000"))
			str ="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2000&&ClosingYear<2005 GROUP BY region";
			else if(year.equals("2004"))
			str ="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2004&&ClosingYear<2009 GROUP BY region";
			else if(year.equals("2008"))
			str ="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2008&&ClosingYear<2013 GROUP BY region";
			else if(year.equals("2012"))
			str ="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2012&&ClosingYear<2017 GROUP BY region";
			else if(year.equals("obama"))
			str="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2008&&ClosingYear<2017 GROUP BY region";
			else
			str ="Select region,count(region) as closedBanks from Banks INNER JOIN State ON State.name=Banks.ST where ClosingYear>2000&&ClosingYear<2009 GROUP BY region";
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
				perVoted[i]=Integer.parseInt(result.getString("closedBanks"));
				i++;

			}
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([
        ['Region', 'Number of Closed Banks',],
        ['Middle Atlantic',parseInt(<%out.print(Integer.toString(perVoted[0])); %>)],
        ['Midwest', parseInt(<%out.print(Integer.toString(perVoted[1])); %>)],
        ['New England', parseInt(<%out.print(Integer.toString(perVoted[2])); %>)],
        ['South', parseInt(<%out.print(Integer.toString(perVoted[3])); %>)],
        ['Southwest', parseInt(<%out.print(Integer.toString(perVoted[4])); %>)],
        ['West', parseInt(<%out.print(Integer.toString(perVoted[5])); %>)]
      ]);

      var options = {
        title: 'Number of Closed Banks per Region',
        chartArea: {width: '50%'},
        hAxis: {
          title: 'Number of Closed Banks',
          minValue: 0
        },
        vAxis: {
          title: 'Region'
        }
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 900px; height: 500px"></div>
  </body>

</body>
</html>