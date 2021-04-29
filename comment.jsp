<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "medical";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Medical</title>
<link rel="icon" type="image/png" href="images/medical.jpg"/>
  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark" style="font-family:serif">
<% String i="";String s="";
    
           s="Please Enter the Comment";
          i="Color:#007bff;";    
             
          %>
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Medical Comments</div>
      <br>
      <center><h6 style="<%=i%>"><%=s%></h6></center>
      <div class="card-body">
        <form action="comment" method="post">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="inputEmail" class="form-control" name="username" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Docter name</label>
            </div>
          </div>
            <div class="form-group">
            <div class="form-label-group">
                <select name="hosp" class="form-control" style="height:50px;" required="">
          <%
        
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sq1 ="select * from data";
resultSet = statement.executeQuery(sq1);
while(resultSet.next()){
                    %>
 <option value="<%=resultSet.getString("hospital")%>"><%=resultSet.getString("hospital")%></option><%}%>
</select>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
               
                <textarea rows="4" cols="50" name="comment" class="form-control" id="inputPassword" required="required" autofocus="autofocus"></textarea>
              <label for="inputPassword">Comments</label>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              
            </div>
          </div>
          <input type="submit" value="Submit" class="btn btn-primary btn-block">
        </form>
        <div class="text-center">
          
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>