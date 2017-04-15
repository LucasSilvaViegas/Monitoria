<%@page import="java.util.List"%>
<%@page import="modelo.Exercicios"%>
<%@page import="dao.ExerciciosDAO"%>
<%@include file="cabecalho.jsp"%>


<div class="featured-heading">
    <div class="row-fluid">
        <div class="span10 offset1">
            <h1>Praticar Atividades!</h1>
            <h2>Eu só tive <strong>10 horas</strong> para fazer esse exercício.<br/>

                <%                    ExerciciosDAO eDAO = new ExerciciosDAO();
                    List<Exercicios> eLista = eDAO.listar();
                    String msg = "";
                    Exercicios q = new Exercicios();

                    /*
                    if (request.getParameter("txt1") != null || request.getParameter("txt2") != null || request.getParameter("txt3") != null || request.getParameter("txt4") != null) {
                        msg = q.getResposta();
                    }
                     */
                %>
                E a integração das perguntas no site não está completa!<br/>
                Você pode encontrar as perguntas na parte Administrativa,<br/>
                É só você ser um <a href="login.jsp">super-usuário!</a> <br/><br/>
                <h2>Mas a ideia que eu tenho, é fazer essa tela mostrar<br/>
                uma questão do banco de dados aleatoriamente e<br/>
                dizer se está certo ou não. E ir repetindo até o usuário não querer mais.</h2>
        </div>
    </div>

    <div class="row-fluid">
        <form action="#" method="post">
            -------------------------------------------------<br/><br/>
            <%for (Exercicios item : eLista) {

            %>


            <h1><strong><%=item.getTitulo()%></strong></h1>
            <h2><%=item.getDescricao()%></h2>
            Pergunta feita por: <strong><%=item.getProfessor().getNome()%></strong><br/><br/>

            <label><h2><input class="form-control" type="checkbox" name="txt1" /><%=item.getAlternativa1()%></h2></label>
            <label><h2><input class="form-control" type="checkbox" name="txt2" /><%=item.getAlternativa2()%></h2></label>
            <label><h2><input class="form-control" type="checkbox" name="txt3" /><%=item.getAlternativa3()%></h2></label>
            <label><h2><input class="form-control" type="checkbox" name="txt4" /><%=item.getAlternativa4()%></h2></label>


            <!--<h2><%//=msg%></h2>-->



            <br/><br/>
            -------------------------------------------------
            <br/><br/>

            <%
                }
            %>

            <button type="submit" class="btn">QUERO SABER AS RESPOSTAS!</button>

        </form>
    </div>


</div>


</body>
</html>
