<%@page import="java.util.List"%>
<%@page import="modelo.Escola"%>
<%@page import="dao.EscolaDAO"%>
<%@page import="modelo.Professores"%>
<%@page import="dao.ProfessoresDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";
    Professores obj = new Professores();
    EscolaDAO cDAO = new EscolaDAO();
    List<Escola> cLista = cDAO.listar();

//Verifica se é post, ou seja, quero alterar
    if (request.getMethod().equals("POST")) {
        ProfessoresDAO dao = new ProfessoresDAO();

        obj.setId(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setTelefone(Integer.parseInt(request.getParameter("txtFone")));

        Escola escola = new Escola();
        escola.setId(Integer.parseInt(request.getParameter("selEscola")));
        obj.setEscola(escola);

        Boolean resultado = dao.alterar(obj);

        if (resultado) {
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Registro NÃO FOI alterado com sucesso";
            classe = "alert-danger";
        }

//Popular com o que ele digitou no form
    } else {
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        ProfessoresDAO dao = new ProfessoresDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

//Se for um registro inválido, sai da tela 
        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Atualizar Professores
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
            Professores
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo"readonly value="<%=obj.getId()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" value="<%=obj.getNome()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Telefone</label>
                        <input class="form-control" type="text" name="txtFone" value="<%=obj.getTelefone()%>"/>
                    </div>

                    <label>Escola:</label>
                    <select name="selEscola">
                        <option>Selecione</option>
                        <%
                            String marcadoR;
                            for (Escola esc : cLista) {
                                if (esc.getId() == obj.getEscola().getId()) {
                                    marcadoR = ">";
                                } else {
                                    marcadoR = "";
                                }
                        %>
                        <option value="<%=esc.getId()%>"><%=marcadoR%><%=esc.getNome()%></option>
                        <%
                            }
                        %>                

                    </select>


                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>