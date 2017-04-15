<%-- 
    Document   : login
    Created on : 14/04/2017, 19:20:51
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.css">

        <link rel="stylesheet" href="css/custom-styles.css">

        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/font-awesome-ie7.css">

        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ser um SUPER-USUÁRIO!</title>
    </head>

    <%
        String msg = "  ";
        if (request.getMethod().equals("POST")) {
            if (request.getParameter("txtEmail").equals("ADMIN") && request.getParameter("txtSenha").equals("ADMIN")) {
                session.setAttribute("usuario", request.getParameter("txtEmail"));
                response.sendRedirect("index.jsp");
            } else {
                msg = "ERROU!";
            }
        }

    %>



    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
</head>
<body>

    <div class="container">

        <div class="row-fluid">

            <div class="span8 offset2">
                <div class="site-header">
                    <div class="logo">
                        <h1>S-cool</h1>
                    </div>
                    <div class="menu">
                        <div class="navbar">
                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                <i class="fw-icon-th-list"></i>
                            </a>
                            <div class="nav-collapse collapse">
                                <ul class="nav">
                                    <li class="active"><a href="index.jsp">Home</a></li>
                                </ul>
                            </div><!--/.nav-collapse -->
                        </div>

                    </div>
                </div>
                <div class="featured-heading">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <h1>Super-Usuário</h1>
                            <h2>Você pode ser um <strong>super-usuário</strong> e nem sabe!<br/> 
                                Poderás <span>editar</span> nossas informações se souberes o login!</h2>

                            <form method="POST">
                                <div>
                                    <span>Email:   </span>
                                    <input type="text" name="txtEmail" value="ADMIN"> 
                                </div>
                                <div>
                                    <span>Senha:   </span>
                                    <input type="password" name="txtSenha" value="ADMIN"> 
                                </div>
                                <input type="submit" value="ENTRAR" >
                            </form>
                            <h2><%out.print(msg);%></h2>

                            <br/>
                            <br/>
                            Login e Senha são "ADMIN" (tudo maiúsculo)<br/>
                            PS: Eu sei que isso não é seguro em um site, mas com mais tempo eu implemento o sistema de login corretamente :D
                        </div>
                    </div>
                </div>


                </body>
                </html>