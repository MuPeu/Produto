<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
    </head>
    <body>
        <% try{
                //fazer a conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://localhost:3306/bancojsp";
                String user="root";
                String password="root";
                conecta = DriverManager.getConnection(url,user,password);
                //Listar os dados da tabela produto do banco de dados
                String sql=("SELECT * FROM produto");
                st=conecta.prepareStatement(sql);
                ResultSet rs=st.executeQuery();
                //enquanto não chegar no final ele vai executar
                //o que estiver dentro do while
        %>
        <table>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Preço</th>
            </tr>
            <%
                while (rs.next()){
            %>
            <!<!--Finalizei o código java acima agora vou criar o corpo da tabela html para mostar os dados trazidos do Banco de Dados-->
            <tr>
                <td>
                    <%=rs.getString("codigo")%>
                </td>
                <td>
                    <%=rs.getString("nome")%>
                </td>
                <td>
                    <%=rs.getString("marca")%>
                </td>
                <td>
                    <%=rs.getString("preco")%>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch(Exception x){
                out.print ("Mensagem de erro: " + x.getMessage());
            }
        %>
    </body>
</html>