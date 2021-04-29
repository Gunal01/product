<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Medical</title>
  <link rel="icon" type="image/png" href="images/medical.jpg"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet"> 

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style1.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body style="background: #25292d;">

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1><span><i class="glyphicon glyphicon-remove"></i></span></h1>
			</div>
                    <br><br><br>
			<p>You Are removed from the block for some reason</p>
                        <p style="color: red;"><%=request.getAttribute("Message")%></p>
			<a href="index.jsp">Login</a>
		</div>
	</div>

</body>

</html>
