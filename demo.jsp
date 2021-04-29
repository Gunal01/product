<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/botprediction","root","");  
//here sonoo is database name, root is username and password  
Statement stmt=con.createStatement(); 
ResultSet rs=stmt.executeQuery("select * from photos");  
while(rs.next())  
    out.print("1");
out.print(rs.getString("Email")+"  "+rs.getString("photo"));  
con.close();  
}catch(Exception e){ System.out.println(e);}  

%>