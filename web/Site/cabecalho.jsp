<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>S-Cool</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <style>
            body  {
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.css">

        <link rel="stylesheet" href="css/custom-styles.css">

        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/font-awesome-ie7.css">

        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="prof.jsp">Professores</a></li>
                                        <li><a href="escolas.jsp">Escolas</a></li>
                                        <li><a href="exercicios.jsp">Atividades</a></li>
                                            <%if (session.getAttribute("usuario") == null) {%>
                                        <li><a href="login.jsp">Super-Usuário</a></li>
                                            <%
                                            } else {
                                            %>
                                        <li><a href="../Admin/" role="button">Editar coisas</a></li>
                                        <li><a href="logoff.jsp" role="button">DESLOGAR</a></li>
                                            <%
                                                }
                                            %>
                                    </ul>
                                </div><!--/.nav-collapse -->
                            </div>

                        </div>
                    </div>