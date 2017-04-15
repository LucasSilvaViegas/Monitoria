<%@page import="dao.EscolaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Escola"%>
<%@include file="../cabecalho.jsp" %>
<%@page import="modelo.Professores"%>
<%@page import="dao.ProfessoresDAO"%>
<%

    String msg = "";
    String classe = "";

    //Gravar a categoria no banco
    ProfessoresDAO dao = new ProfessoresDAO();
    //Monto o objeto com os dados para sem inserir
    Professores obj = new Professores();
    //verifico se foi enviado o campo txtNome
    

    EscolaDAO escDAO = new EscolaDAO();
    List<Escola> escLista = escDAO.listar();

    if (request.getParameter("txtNome") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setNome(request.getParameter("txtNome"));
        obj.setTelefone(Integer.parseInt(request.getParameter("txtFone")));

        Escola escola = new Escola();
        escola.setId(Integer.parseInt(request.getParameter("txtEscola")));
        obj.setEscola(escola);

        //executo o insert na DAO    
        dao.incluir(obj);
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Adicionar Professores
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
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>

                    <div class="form-group">
                        <label>Telefone</label>
                        <input class="form-control" type="text" name="txtFone" required />
                    </div>

                    <div class="form-group">
                        <label>Escola</label>
                        <select name="txtEscola" class="form-control" required>
                            <option value="">Selecione</option>
                            <%
                                for (Escola esc : escLista) {
                            %>
                            <option value="<%=esc.getId()%>" ><%=esc.getNome()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>