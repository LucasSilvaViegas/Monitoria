<%@page import="modelo.Professores"%>
<%@page import="modelo.Exercicios"%>
<%@page import="java.util.List"%>
<%@page import="dao.ExerciciosDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    ExerciciosDAO dao= new ExerciciosDAO();
    List<Exercicios> lista;
    Professores professor;
    if(request.getParameter("codigo")!=null){
        Exercicios obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if(obj != null){
            Boolean funcionou = dao.excluir(obj);
            if(funcionou){
                out.print("Registro exclu�do com sucesso!");
            }
        }
    }
    
    if(request.getParameter("txtFiltro") !=null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }else{
    lista = dao.listar();}

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Exercicios

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
            
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" name="txtFiltro" class="form-control" placeholder="digite...">
                                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
                            </div>
        </form>
        <div class="panel-body">
           
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>C�digo</th>
                        <th>Nome</th>
                        <th>Descri��o</th>
                        <th>Alt. 1</th>
                        <th>Alt. 2</th>
                        <th>Alt. 3</th>
                        <th>Alt. 4</th>
                        <th>Alternativa Correta</th>
                        <th>Professor</th>
                        <th>A��es</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(Exercicios item:lista)
                        {
                        %>
                    
                    <tr>
                        <td><%=item.getId()%></td>
                        <td><%=item.getTitulo()%></td>
                        <td><%=item.getDescricao()%></td>
                        <td><%=item.getAlternativa1()%></td>
                        <td><%=item.getAlternativa2()%></td>
                        <td><%=item.getAlternativa3()%></td>
                        <td><%=item.getAlternativa4()%></td>
                        <td><%=item.getResposta()%></td>
                        <td><%=item.getProfessor().getNome()%></td>
                        <td><a href="upd.jsp?codigo=<%=item.getId()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button  class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getId()%>">Excluir</button>
                         </td>
                    </tr>
                    <%
                        }
                        %>
                </tbody>
            </table>
           
                <!-- /.table-responsive -->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
        </div>
                <!-- Button trigger modal -->
   
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Confirme a escolha</h4>
            </div>
            <div class="modal-body">
                Voc� tem certeza de que quer excluir?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">N�o</button>
                <button type="button" class="btn btn-primary" onclick="excluir()">Sim</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    
    var codigo;
    
    function excluir(){
        document.location.href = "index.jsp?codigo="+codigo;
    } 
    
    
 </script>
    <%@include file="../rodape.jsp" %>
