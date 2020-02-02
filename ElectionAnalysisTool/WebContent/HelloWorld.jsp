<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Historical Election Analysis</title>
</head>
<body>

<!-- the usual HTML way -->
<% out.println("<h1>Historical Election Analysis from 2000</h1> "); %> 
<p>Population voted in the Presidential Election.</p>
<br>
	<form method="query" action="query.jsp">
		<select name="State" size=1>
				<option value="AL">Alabama </option>
				<option value="AK">Alaska </option>
				<option value="AZ">Arizona </option>
				<option value="AR">Arkansas </option>
				<option value="CA">California </option>
				<option value="CO">Colorado </option>
				<option value="CT">Connecticut </option>
				<option value="DE">Delaware </option>
				<option value="DC">District of Columbia </option>
				<option value="FL">Florida </option>
				<option value="GA">Georgia </option>
				<option value="HI">Hawaii </option>
				<option value="ID">Idaho </option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana </option>
				<option value="IA">Iowa </option>
				<option value="KS">Kansas </option>
				<option value="KY">Kentucky </option>
				<option value="LA">Louisiana </option>
				<option value="ME">Maine </option>
				<option value="MD">Maryland </option>
				<option value="MA">Massachusetts </option>
				<option value="MI">Michigan </option>
				<option value="MN">Minnesota </option>
				<option value="MS">Mississippi </option>
				<option value="MO">Missouri </option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska </option>
				<option value="NV">Nevada </option>
				<option value="NH">New Hampshire </option>
				<option value="NJ">New Jersey </option>
				<option value="NM">New Mexico </option>
				<option value="NY">New York </option>
				<option value="NC">North Carolina </option>
				<option value="ND">North Dakota </option>
				<option value="OH">Ohio </option>
				<option value="OK">Oklahoma </option>
				<option value="OR">Oregon </option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island </option>
				<option value="SC">South Carolina </option>
				<option value="SD">South Dakota </option>
				<option value="TN">Tennessee </option>
				<option value="TX">Texas </option>
				<option value="UT">Utah </option>
				<option value="VT">Vermont </option>
				<option value="VA">Virginia </option>
				<option value="WA">Washington </option>
				<option value="WV">West Virginia </option>
				<option value="WI">Wisconsin </option>
				<option value="WY">Wyoming</option>
		</select>&nbsp;<br> 
		<select name="Year" size=1>
			<option value=2000>2000 </option>
			<option value=2004>2004 </option>
			<option value=2008>2008 </option>
			<option value=2012>2012 </option>
		</select>&nbsp;<br> 
		<select name="Party" size=1>
			<option value="democratic">Democratic </option>
			<option value="republican">Republican </option>
			<option value="total_votes">All Parties</option>
		</select>&nbsp;<br><input type="submit" value="submit">
	</form>
<br>
<p>Which congress had the max amount of: </p>
<br>
	<form method="query" action="congress.jsp">
		<select name="Congress" size=1>
			<option value="demsH">Democratic House of Representatives</option>
			<option value="repsH">Republican House of Representatives</option>
			<option value="othersH">Other House of Representatives</option>
			<option value="demsS">Democratic Senate</option>
			<option value="repsS">Republican Senate</option>
			<option value="othersS">Other Senate</option>
			<option value="dems">All Democrats</option>
			<option value="reps">All Republicans</option>
			<option value="others">All Others</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Votes of states with at least the total amount of electoral votes you specify.
<br>
	year:
	<form method="query" action="elecTresh.jsp">
		<select name="Year" size=1>
			<option value=2000>2000 </option>
			<option value=2004>2004 </option>
			<option value=2008>2008 </option>
			<option value=2012>2012 </option>
		</select>&nbsp;<br> 
	<tr>    
	<td>Electoral Votes</td><td><input type="text" name="Elec"></td>
	</tr>
	 <input type="submit" value="submit">

	</form>
<br>
Votes of states with at most the total amount of electoral votes you specify.
<br>
	year:
	<form method="query" action="elecTreshLo.jsp">
		<select name="Year" size=1>
			<option value=2000>2000 </option>
			<option value=2004>2004 </option>
			<option value=2008>2008 </option>
			<option value=2012>2012 </option>
		</select>&nbsp;<br> 
	<tr>    
	<td>Electoral Votes</td><td><input type="text" name="Elec"></td>
	</tr>
	 <input type="submit" value="submit">

	</form>
<br>
Who won the region of your choice?
<br>
	<form method="query" action="region.jsp">
		<select name="Year" size=1>
			<option value=2000>2000 </option>
			<option value=2004>2004 </option>
			<option value=2008>2008 </option>
			<option value=2012>2012 </option>
		</select>&nbsp;
		<select name="Region" size=1>
			<option value="Middle Atlantic">Middle Atlantic </option>
			<option value="Midwest">Midwest </option>
			<option value="New England">New England </option>
			<option value="South">South </option>
			<option value="Southwest">Southwest </option>
			<option value="West">West </option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>
Select the state you want to analyze the percentage of population voted by year. 
	<form method="query" action="votes.jsp">
		<select name="State" size=1>
				<option value="AL">Alabama </option>
				<option value="AK">Alaska </option>
				<option value="AZ">Arizona </option>
				<option value="AR">Arkansas </option>
				<option value="CA">California </option>
				<option value="CO">Colorado </option>
				<option value="CT">Connecticut </option>
				<option value="DE">Delaware </option>
				<option value="DC">District of Columbia </option>
				<option value="FL">Florida </option>
				<option value="GA">Georgia </option>
				<option value="HI">Hawaii </option>
				<option value="ID">Idaho </option>
				<option value="IL">Illinois</option>
				<option value="IN">Indiana </option>
				<option value="IA">Iowa </option>
				<option value="KS">Kansas </option>
				<option value="KY">Kentucky </option>
				<option value="LA">Louisiana </option>
				<option value="ME">Maine </option>
				<option value="MD">Maryland </option>
				<option value="MA">Massachusetts </option>
				<option value="MI">Michigan </option>
				<option value="MN">Minnesota </option>
				<option value="MS">Mississippi </option>
				<option value="MO">Missouri </option>
				<option value="MT">Montana</option>
				<option value="NE">Nebraska </option>
				<option value="NV">Nevada </option>
				<option value="NH">New Hampshire </option>
				<option value="NJ">New Jersey </option>
				<option value="NM">New Mexico </option>
				<option value="NY">New York </option>
				<option value="NC">North Carolina </option>
				<option value="ND">North Dakota </option>
				<option value="OH">Ohio </option>
				<option value="OK">Oklahoma </option>
				<option value="OR">Oregon </option>
				<option value="PA">Pennsylvania</option>
				<option value="RI">Rhode Island </option>
				<option value="SC">South Carolina </option>
				<option value="SD">South Dakota </option>
				<option value="TN">Tennessee </option>
				<option value="TX">Texas </option>
				<option value="UT">Utah </option>
				<option value="VT">Vermont </option>
				<option value="VA">Virginia </option>
				<option value="WA">Washington </option>
				<option value="WV">West Virginia </option>
				<option value="WI">Wisconsin </option>
				<option value="WY">Wyoming</option>
		</select>&nbsp;<br><input type="submit" value="submit"> </form>		
		Banks that closed after each election:			  
	<form method="query" action="banks.jsp"><input type="submit" value="show banks"> </form>
	<br>
	Banks closed after each election or president graphed by region
	<form method="query" action="bRegion.jsp">
		<select name="Year" size=1>
			<option value="2000">2000 </option>
			<option value="2004">2004 </option>
			<option value="2008">2008 </option>
			<option value="2012">2012 </option>
			<option value="obama">Barack Obama </option>
			<option value="bush">George W. Bush </option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>



</body>
</html>