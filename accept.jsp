<%@page import="java.util.Properties"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%
String s= request.getParameter("id");
FileWriter fstream = new FileWriter(com.connect.access.user,true);
BufferedWriter out2 = new BufferedWriter(fstream);
Properties p = new Properties();
p.setProperty(s+"app","true");               
                p.store(out2, null);
                response.sendRedirect("home.jsp");
%>
