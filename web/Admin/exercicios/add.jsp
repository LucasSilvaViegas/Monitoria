<%@page import="modelo.Professores"%>
<%@page import="dao.ProfessoresDAO"%>
<%@page import="dao.ExerciciosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Exercicios"%>
<%@include file="../cabecalho.jsp" %>
<%@page import="modelo.Exercicios"%>
<%@page import="dao.ExerciciosDAO"%>
<%

    String msg = "";
    String classe = "";

    //Gravar a categoria no banco
    ExerciciosDAO dao = new ExerciciosDAO();
    //Monto o objeto com os dados para sem inserir
    Exercicios obj = new Exercicios();


    ExerciciosDAO exDAO = new ExerciciosDAO();
    List<Exercicios> exLista = exDAO.listar();

    ProfessoresDAO profDAO = new ProfessoresDAO();
    List<Professores> profLista = profDAO.listar();

    if (request.getParameter("txtTitulo") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setTitulo(request.getParameter("txtTitulo"));
        obj.setDescricao(request.getParameter("txtDescricao"));
        obj.setAlternativa1(request.getParameter("txt1"));
        obj.setAlternativa2(request.getParameter("txt2"));
        obj.setAlternativa3(request.getParameter("txt3"));
        obj.setAlternativa4(request.getParameter("txt4"));
        obj.setResposta(request.getParameter("txtR"));

        Professores prof = new Professores();
        prof.setId(Integer.parseInt(request.getParameter("txtProfessor")));
        obj.setProfessor(prof);

        //executo o insert na DAO    
        dao.incluir(obj);
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Adicionar Exercício
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
            Exercicios
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Pergunta/Título</label>
                        <input class="form-control" type="text" name="txtTitulo" required />
                    </div>

                    <div class="form-group">
                        <label>Descrição/Dica</label>
                        <input class="form-control" type="text" name="txtDescricao" required />
                    </div>

                    <div class="form-group">
                        <label>Alternativa 1</label>
                        <input class="form-control" type="text" name="txt1" required />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 2</label>
                        <input class="form-control" type="text" name="txt2" required />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 3</label>
                        <input class="form-control" type="text" name="txt3" required />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 4</label>
                        <input class="form-control" type="text" name="txt4" required />
                    </div>

                    <div class="form-group">
                        <label>Resposta</label>
                        <input class="form-control" type="text" name="txtR" required />
                    </div>

                    <div class="form-group">
                        <label>Professor</label>
                        <select name="txtProfessor" class="form-control" required>
                            <option value="">Selecione</option>
                            <%
                                for (Professores prof : profLista) {
                            %>
                            <option value="<%=prof.getId()%>" ><%=prof.getNome()%></option>
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