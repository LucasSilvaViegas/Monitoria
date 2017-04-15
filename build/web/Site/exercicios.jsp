<%@page import="java.util.List"%>
<%@page import="modelo.Exercicios"%>
<%@page import="dao.ExerciciosDAO"%>
<%@include file="cabecalho.jsp"%>


<div class="featured-heading">
    <div class="row-fluid">
        <div class="span10 offset1">
            <h1>Praticar Atividades!</h1>
            <h2>Eu s� tive <strong>10 horas</strong> para fazer esse exerc�cio.<br/>

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
                E a integra��o das perguntas no site n�o est� completa!<br/>
                Voc� pode encontrar as perguntas na parte Administrativa,<br/>
                � s� voc� ser um <a href="login.jsp">super-usu�rio!</a> <br/><br/>
                <h2>Mas a ideia que eu tenho, � fazer essa tela mostrar<br/>
                uma quest�o do banco de dados aleatoriamente e<br/>
                dizer se est� certo ou n�o. E ir repetindo at� o usu�rio n�o querer mais.</h2>
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
