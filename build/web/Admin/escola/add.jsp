<%@page import="dao.EscolaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Escola"%>
<%@include file="../cabecalho.jsp" %>
<%@page import="modelo.Escola"%>
<%@page import="dao.EscolaDAO"%>
<%
    EscolaDAO dao = new EscolaDAO();
    Escola obj = new Escola();
    String msg = "";
    String classe = "";
    EscolaDAO escDAO = new EscolaDAO();
    List<Escola> escLista = escDAO.listar();

    if (request.getParameter("txtNome") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setNome(request.getParameter("txtNome"));
        obj.setEndereco(request.getParameter("txtEndereco"));

        //executo o insert na DAO    
        dao.incluir(obj);
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Adicionar Escolas
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Escola
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>

                    <div class="form-group">
                        <label>Endereco</label>
                        <input class="form-control" type="text" name="txtEndereco" required />
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>