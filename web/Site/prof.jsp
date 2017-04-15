<%@page import="java.util.List"%>
<%@page import="modelo.Professores"%>
<%@page import="dao.ProfessoresDAO"%>
<%@include file="cabecalho.jsp"%>
<%    ProfessoresDAO dao = new ProfessoresDAO();
    List<Professores> lista;

    if (request.getParameter("codigo") != null) {
        Professores obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (obj != null) {
            Boolean funcionou = dao.excluir(obj);
            if (funcionou) {
                out.print("dsdsdsdsd");
            }
        }
    }

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
            <h1>Nossos professores</h1>
            <h2>No S-cool temos os <strong>melhores</strong> professores <br/>que vão lhe <span>ajudar</span> a se dar bem nos vestibulares!</h2>
            <form action="#" method="post">
                <input type="text" name="txtFiltro" class="form-control" placeholder="Pesquise um professor!"><br/>
                <button type="submit" class="btn">Pesquisar!</button><br/><br/><br/>
            </form>


        </div>
    </div>

    <div class="row-fluid">
        -------------------------------------------------<br/><br/>
        <%for (Professores item : lista) {%>

       
        <h2><strong><%=item.getNome()%></strong></h2>
        Leciona em: <span><%=item.getEscola().getNome()%></span>.<br/>
        Telefone para contato: <%=item.getTelefone()%><br/><br/>
        -------------------------------------------------
        <br/><br/>

        <%
            }
        %>


    </div>

</div>
</body>
</html>
