<%@page import="java.util.List"%>
<%@page import="modelo.Professores"%>
<%@page import="dao.ProfessoresDAO"%>
<%@page import="modelo.Exercicios"%>
<%@page import="dao.ExerciciosDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";
    Exercicios obj = new Exercicios();
    ProfessoresDAO cDAO = new ProfessoresDAO();
    List<Professores> cLista = cDAO.listar();

//Verifica se é post, ou seja, quero alterar
    if (request.getMethod().equals("POST")) {
        ExerciciosDAO dao = new ExerciciosDAO();

        obj.setId(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setTitulo(request.getParameter("txtTitulo"));
        obj.setDescricao(request.getParameter("txtDescricao"));
        obj.setAlternativa1(request.getParameter("txt1"));
        obj.setAlternativa2(request.getParameter("txt2"));
        obj.setAlternativa3(request.getParameter("txt3"));
        obj.setAlternativa4(request.getParameter("txt4"));
        obj.setResposta(request.getParameter("txtR"));

        Professores prof = new Professores();
        prof.setId(Integer.parseInt(request.getParameter("selProfessores")));
        obj.setProfessor(prof);
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
        ExerciciosDAO dao = new ExerciciosDAO();
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
            Alterar Exercicios
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
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getId()%>" />
                    </div>

                    <div class="form-group">
                        <label>Pergunta/Título</label>
                        <input class="form-control" type="text" name="txtTitulo" value="<%=obj.getTitulo()%>" />
                    </div>

                    <div class="form-group">
                        <label>Descrição/Dica</label>
                        <input class="form-control" type="text" name="txtDescricao" value="<%=obj.getDescricao()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Alternativa 1</label>
                        <input class="form-control" type="text" name="txt1" value="<%=obj.getAlternativa1()%>" />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 2</label>
                        <input class="form-control" type="text" name="txt2" value="<%=obj.getAlternativa2()%>" />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 3</label>
                        <input class="form-control" type="text" name="txt3" value="<%=obj.getAlternativa3()%>" />
                    </div>
                    <div class="form-group">
                        <label>Alternativa 4</label>
                        <input class="form-control" type="text" name="txt4" value="<%=obj.getAlternativa4()%>" />
                    </div>

                    <div class="form-group">
                        <label>Resposta</label>
                        <input class="form-control" type="text" name="txtR" value="<%=obj.getResposta()%>" />
                    </div>
                    <label>Professores:</label>
                    <select name="selProfessores">
                        <option>Selecione</option>
                        <%
                            String marcadoR;
                            for (Professores esc : cLista) {
                                if (esc.getId() == obj.getProfessor().getId()) {
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