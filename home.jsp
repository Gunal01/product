<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileReader"%>
<%  ArrayList <String> email = new ArrayList<String>();
    File file = new File(com.connect.access.user);
               try {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
               String  line = scanner.nextLine();
               if(line.contains("Email")){
                 String[] words=line.split("=");
                 email.add(words[1]);
               }              
            }          
               }catch(Exception e){
                  out.print(e); 
               }
%>

<!DOCTYPE html>
<html lang="en-US" class="no-js">
<head>
<title>Product Finder</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' href='assets/css/bootstrap.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='assets/css/animate.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans%3A300italic%2C400italic%2C700italic%2C300%2C400%2C700%2C800%7CMontserrat%3A300italic%2C400italic%2C700italic%2C300%2C400%2C700%7CDosis%3A400%2C700&#038;ver=4.5' type='text/css' media='all'/>
<link rel='stylesheet' href='icons/elegantline/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='assets/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='assets/css/flexslider.css' type='text/css' media='all'/>

  
</head>
<body class="frontpage">
<div class="page-loader">
	<img src="assets/img/loader.gif" alt="loader">
</div>

<!-- Header
================================================== -->
<header id="header">
<div id="mega-menu" class="header header2 header-sticky primary-menu icons-no default-skin zoomIn align-right">
	<nav class="navbar navbar-default redq">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">
			<img src="assets/img/logo-dark.png" alt="logo">
			</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar">
			<a class="mobile-menu-close"><i class="fa fa-close"></i></a>
			<div class="menu-top-menu-container">
				<ul id="menu-top-menu" class="nav navbar-nav nav-list">
					<li><a href="home.jsp">Home</a></li>
                                        <li><a href="productAdmin.jsp">Product Details</a></li>
					<li style="background: rgba(255, 255, 0, 0.51);"><a  href="index.jsp">logout</a></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
	</nav>
</div>
</header>	

<!-- INTRO
================================================== -->
<section id="home" style="padding:160px 0;background-image: url(https://unsplash.it/1324/683?random=0); background-position: center; background-repeat: no-repeat;background-size: cover;background-attachment:fixed;">
    <div class="container" >
		<div class="textwidget">
			<h1 class="toptitle">WELCOME ADMINISTRATOR <br/><br/><i class="fa fa-star roundicon"></i>
			</h1>								
                    <br>								
				 <table class="table" style="background: whitesmoke;">
    <thead>
      <tr>
        <th>Company Name</th>
        <th>Owner</th>
        <th>Found</th>
        <th>Contact</th>
        <th>Mobile</th>
        <th>Document</th>
        <th>Action</th>
      </tr>
    </thead>
    <% 
FileReader reader=new FileReader(com.connect.access.user);
		Properties p = new Properties(); 
		p.load(reader);
                int i=1;
    %>
    <tbody>
        <%  for (String value : email) { %>
      <tr>
          <td><%= p.getProperty(value+"name") %></td>
          <td><%= p.getProperty(value+"Owner") %></td>        
        <td><%= p.getProperty(value+"Found") %></td>
        <td><%= p.getProperty(value+"Email") %></td>
        <td><%= p.getProperty(value+"Mobile") %></td>
        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=i%>">
  View
</button></td>  
        <!-- The Modal -->
<div class="modal" id="myModal<%=i%>">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">View Document</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <img width ="320" height="320" src="doc/<%= p.getProperty(value+"file") %>" alt="Italian Trulli">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
    <td><%if(p.getProperty(value+"app")==null){%><form action="accept.jsp" method="post"><input type="hidden" name="id" value="<%=value%>">
            <input type="submit" id="submit" class="clearfix btn" value="accept"></form><%} else{ out.print("already selected");}%></td>
      </tr>  
       <% i++; }%>
    </tbody>
  </table>
				<div class="done">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						Your message has been sent. Thank you!
					</div>
				</div>
											
		</div>
		</div>
</section>


<footer id="footer" class="footer2">
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<small>
					&copy; <a href="">
							  Expertum 
							</a>
					</small>
				</div>
				<div class="col-md-6 text-right">
					<div class="footer-menu">
						<ul id="menu-footer-links" class="menu">
							<li><a href="#"><i class="fa fa-facebook"></i> Like us on Facebook</a></li>
							<li><a href="#"><i class="fa fa-twitter"></i> Follow us on Twitter</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!-- SCRIPTS
================================================== -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="contact/topvalidate.js"></script>
<script src="contact/bottomvalidate.js"></script>

</body>
</html>
