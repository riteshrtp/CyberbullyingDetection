<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Cyberbulling</title>

<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<script language="JavaScript">
function validation()
{
var a = document.form.fname.value;
var b = document.form.sname.value;
var c = document.form.userid.value;
var d = document.form.remail.value;
var e = document.form.pass.value;
var f = document.form.gender.value;
var g = document.form.date.value;
var h = document.form.month.value;
var i = document.form.year.value;
//var j = document.form.type.value;


if(a=="")
{
alert("Enter your  FirstName");
document.form.fname.focus();
return false;
}
if(b=="")
{
alert("Enter your  SurName");
document.form.sname.focus();
return false;
}
if(c=="")
{
alert("Enter Your valid emailId");
document.form.userid.focus();
return false;
 }
	if (c.indexOf("@", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.userid.focus();
return false;
}
if (c.indexOf(".", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.userid.focus();
return false;
}	

if(d=="")
{
alert("ReEnter Your valid emailId");
document.form.remail.focus();
return false;
 }
	if (d.indexOf("@", 0) < 0)
{
alert("Please Reenter a valid e-mail address.");
document.form.remail.focus();
return false;
}

if (d.indexOf(".", 0) < 0)
{
alert("Please Reenter a valid e-mail address.");
document.form.remail.focus();
return false;
}
if(c!=d)
    {
        alert("e-mail address Not Matched");
document.form.remail.focus();
return false;
    }
if(e=="")
{
alert("Enter your password");
document.form.pass.focus();
return false;
}
if(document.form.gender.selectedIndex==0)
{ 
alert("Please select Gender");
document.form.gender.focus();
return false;
}
if(document.form.date.selectedIndex==0)
{ 
alert("Please select date ");
document.form.date.focus();
return false;
}
if(document.form.month.selectedIndex==0)
{ 
alert("Please select month ");
document.form.month.focus();
return false;
}
if(document.form.year.selectedIndex==0)
{
 alert("Please select year ");
document.form.year.focus();
return false;
}
/*if(document.form.type.selectedIndex==0)
{ 
alert("Please select UserType");
document.form.type.focus();
return false;
}*/



}
</script>
</head>
<body>
<!-- start header -->
<div id="header">
	<div id="logo">
		
    <h1 align="center"><font size="+3">Cyberbulling
      </font></h1>
		
	</div>
	
</div>
<!-- end header -->
<!-- start page -->
<div id="page">

	<div style="position:absolute; right:60px; top:145px; left: 760px; width: 325px; height: 421px;">
	<p><font color="blue" size="5"><strong>SignUp:</strong></font></p>
	<img src="images/nnn.jpg" width="350" height="5">
<table bgcolor="#ffffff" width="326" height="364">
<form name="form" action="newuserinsert.jsp" method="post" onSubmit="return validation();">
<%
 int n=0,s=0;
 Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select max(id) from reg ";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		if(rs.next())
		{
		if(rs.getInt(1)==0)
		n=1;
		else
		n=rs.getInt(1)+1;
		session.setAttribute( "id", n );
		
		}
                
	//out.print(n);
	
	%>

	<tr  >
            <td width="122" height="37"><font color="Blue">FirstName</font></td>
	<td width="150"><input type="text" name="fname" id="s" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="36"><font color="Blue">SurName</td>
	<td><input type="text" name="sname" id="s" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="37"><font color="Blue">Your Email</td>
	<td><input type="text" name="userid" id="s" size="25" value=""  oncopy="return false"/></td>
	</tr>
	<tr  >
	    <td height="38"><font color="Blue">Re-enter Email</td>
	<td><input type="text" name="remail" id="s" size="25" value="" onpaste="return false" /></td>
	</tr>
	<tr  >
	    <td height="37"><font color="Blue">New Password</td>
	<td><input type="password" name="pass" size="25" value="" /></td>
	</tr>
	<tr  >
	    <td height="38"><font color="Blue">I am</td>
	<td><select name="gender"  style="background-color:#A4E4F5;">
            <option>----------SelectGender--------</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
			 </select></td>

	</tr>
	<tr  >
	<td height="39" class="paragraping1"><font color="Blue">Date Of Birth:</td>
<td class="fielditem"><select name="date" style="background-color:#A4E4F5;">

	<option value="">Day</option>

							

								<option value="1">1</option>

							

								<option value="2">2</option>

							

								<option value="3">3</option>

							

								<option value="4">4</option>

							

								<option value="5">5</option>

							

								<option value="6">6</option>

							

								<option value="7">7</option>

							

								<option value="8">8</option>

							

								<option value="9">9</option>

							

								<option value="10">10</option>

							

								<option value="11">11</option>

							

								<option value="12">12</option>

							

								<option value="13">13</option>

							

								<option value="14">14</option>

							

								<option value="15">15</option>

							

								<option value="16">16</option>

							

								<option value="17">17</option>

							

								<option value="18">18</option>

							

								<option value="19">19</option>

							

								<option value="20">20</option>

							

								<option value="21">21</option>

							

								<option value="22">22</option>

							

								<option value="23">23</option>

							

								<option value="24">24</option>

							

								<option value="25">25</option>

							

								<option value="26">26</option>

							

								<option value="27">27</option>

							

								<option value="28">28</option>

							

								<option value="29">29</option>

							

								<option value="30">30</option>

							

								<option value="31">31</option>

							

							</select>

							<select name="month" style="background-color:#A4E4F5;">

							<option value="">Month</option>

							

								<option value="1">Jan</option>

							

								<option value="2">Feb</option>

							

								<option value="3">Mar</option>

							

								<option value="4">Apr</option>

							

								<option value="5">May</option>

							

								<option value="6">Jun</option>

							

								<option value="7">Jul</option>

							

								<option value="8">Aug</option>

							

								<option value="9">Sep</option>

							

								<option value="10">Oct</option>

							

								<option value="11">Nov</option>

							

								<option value="12">Dec</option>

							

							</select>

							<select name="year" style="background-color:#A4E4F5;">

							<option value="">Year</option>

							

								<option value="1900">1900</option>

							

								<option value="1901">1901</option>

							

								<option value="1902">1902</option>

							

								<option value="1903">1903</option>

							

								<option value="1904">1904</option>

							

								<option value="1905">1905</option>


							

								<option value="1906">1906</option>

							

								<option value="1907">1907</option>

							

								<option value="1908">1908</option>

							

								<option value="1909">1909</option>

							

								<option value="1910">1910</option>

							

								<option value="1911">1911</option>

							

								<option value="1912">1912</option>

							

								<option value="1913">1913</option>

							

								<option value="1914">1914</option>

							

								<option value="1915">1915</option>

							

								<option value="1916">1916</option>

							

								<option value="1917">1917</option>

							

								<option value="1918">1918</option>

							

								<option value="1919">1919</option>

							

								<option value="1920">1920</option>

							

								<option value="1921">1921</option>

							

								<option value="1922">1922</option>

							

								<option value="1923">1923</option>

							

								<option value="1924">1924</option>

							

								<option value="1925">1925</option>

							

								<option value="1926">1926</option>

							

								<option value="1927">1927</option>

							

								<option value="1928">1928</option>

							

								<option value="1929">1929</option>

							

								<option value="1930">1930</option>

							

								<option value="1931">1931</option>

							

								<option value="1932">1932</option>

							

								<option value="1933">1933</option>

							

								<option value="1934">1934</option>

							

								<option value="1935">1935</option>

							

								<option value="1936">1936</option>

							

								<option value="1937">1937</option>

							

								<option value="1938">1938</option>

							

								<option value="1939">1939</option>

							

								<option value="1940">1940</option>

							

								<option value="1941">1941</option>

							

								<option value="1942">1942</option>

							

								<option value="1943">1943</option>

							

								<option value="1944">1944</option>

							

								<option value="1945">1945</option>

							

								<option value="1946">1946</option>

							

								<option value="1947">1947</option>

							

								<option value="1948">1948</option>

							

								<option value="1949">1949</option>

							

								<option value="1950">1950</option>

							

								<option value="1951">1951</option>

							

								<option value="1952">1952</option>

							

								<option value="1953">1953</option>

							

								<option value="1954">1954</option>

							

								<option value="1955">1955</option>

							

								<option value="1956">1956</option>

							

								<option value="1957">1957</option>

							

								<option value="1958">1958</option>

							

								<option value="1959">1959</option>

							

								<option value="1960">1960</option>

							

								<option value="1961">1961</option>

							

								<option value="1962">1962</option>

							

								<option value="1963">1963</option>

							

								<option value="1964">1964</option>

							

								<option value="1965">1965</option>

							

								<option value="1966">1966</option>

							

								<option value="1967">1967</option>

							

								<option value="1968">1968</option>

							

								<option value="1969">1969</option>

							

								<option value="1970">1970</option>

							

								<option value="1971">1971</option>

							

								<option value="1972">1972</option>

							

								<option value="1973">1973</option>

							

								<option value="1974">1974</option>

							

								<option value="1975">1975</option>

							

								<option value="1976">1976</option>

							

								<option value="1977">1977</option>

							

								<option value="1978">1978</option>

							

								<option value="1979">1979</option>

							

								<option value="1980">1980</option>

							

								<option value="1981">1981</option>

							

								<option value="1982">1982</option>

							

								<option value="1983">1983</option>

							

								<option value="1984">1984</option>

							

								<option value="1985">1985</option>

							

								<option value="1986">1986</option>

							

								<option value="1987">1987</option>

							

								<option value="1988">1988</option>

							

								<option value="1989">1989</option>

							

								<option value="1990">1990</option>

							

								<option value="1991">1991</option>

							

								<option value="1992">1992</option>

							

								<option value="1993">1993</option>

							

								<option value="1994">1994</option>

							

								<option value="1995">1995</option>

							

								<option value="1996">1996</option>

							

								<option value="1997">1997</option>

							

								<option value="1998">1998</option>

							

								<option value="1999">1999</option>

							

								<option value="2000">2000</option>

							

								<option value="2001">2001</option>

							

								<option value="2002">2002</option>

							

								<option value="2003">2003</option>

							

								<option value="2004">2004</option>

							

								<option value="2005">2005</option>

							

								<option value="2006">2006</option>

							

								<option value="2007">2007</option>

							

								<option value="2008">2008</option>

							

								<option value="2009">2009</option>

							

								<option value="2010">2010</option>

							

								<option value="2011">2011</option>
								
								
								
								<option value="2012">2012</option>

							

							</select>

						</td>
</tr>
	<!--<tr> 

        <td height="38">UserType</td>
<td><select name="type"  style="background-color:#A4E4F5;">
            <option>-------SelectUserType-------</option>
            <option value="Owner">Owner</option>
            <option value="Contributor">Contributor</option>
			     <option value="Stakeholder">Stakeholder</option>
				 <option value="Disseminator">Disseminator</option>
          </select></td>
  </tr>

  <tr>-->
<td height="42"></td>
<td><input name="submit" type="submit" class="button2" value="SignUp"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="reset" type="reset" class="button2" value="Clear"/>
</td>
</tr>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con.close();
		st.close();
	}
 
  %>

</form>
	</table>
				
			
	
	</div>

<br><br>
	<div id="content1" align="left">
		<div class="post">
		
      <p align="left"><strong><font color="#000000">MPAC:OSN Network</font></strong></p>
	  
			<img src="images/dd.jpg" width="530">
		</div>

	</div>
	<!-- end content -->
	<!-- start rightbar -->
	
	<!-- end rightbar -->
	<div style="clear: both;">&nbsp;</div>
</div>
<!-- end page -->
<br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer">
	

  <p align="right"><font color="#FFFFFF" size="2"><strong>Online Social Network</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon3.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon1.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon4.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/icon5.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/Icon7.png" width="30" height="30"></p>
</div>
</body>
</html>
