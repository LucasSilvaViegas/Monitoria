<%@page import="modelo.Professores"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Escola"%>
<%@page import="dao.EscolaDAO"%>
<%@include file="cabecalho.jsp"%>
<%    EscolaDAO dao = new EscolaDAO();
    List<Escola> lista;

    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }

%>

<div class="carousel slide" id="myCarousel">
    <!-- Carousel items -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="img/banner-image2.jpg" alt="">
        </div>
    </div>
</div>
<div class="featured-heading">
    <div class="row-fluid">
        <div class="span10 offset1">
            <h1>Escolas!</h1>
            <h2>Encontre uma <strong>escola</strong> perto de você!</h2>
            <form action="#" method="post">
                <input type="text" name="txtFiltro" class="form-control" placeholder="Pesquise uma escola!"><br/>
                <button type="submit" class="btn">Pesquisar!</button><br/><br/><br/>
            </form>


        </div>
    </div>

    <div class="row-fluid">
        -------------------------------------------------<br/><br/>
        <%for (Escola item : lista) {%>


        <h1><strong><%=item.getNome()%></strong></h1>
        <h2><%=item.getEndereco()%></h2>
        Professores:<br/>
        <%

            String strProfessores = "";
            int x = 0;
            for (Professores hitem : item.getProfessoresList()) {
                strProfessores += hitem.getNome() + ", ";
                x++;
            }
            if (strProfessores.isEmpty() || strProfessores == null) {
                out.print("nulo");
            } else {
                out.print(strProfessores.substring(0, (strProfessores.length() - 2)));
            }
        %>
        <br/><br/>
        -------------------------------------------------
        <br/><br/>

        <%
            }
        %>


    </div>

</div>
</body>
</html>
