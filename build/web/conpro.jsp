<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <%
            //recebe o nome do produto digitado no formulário conpro.html
            String n;
            //n vai receber o nome do produto
            n=request.getParameter("nome");
            
            try{
            //fazer a conexao com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url="jdbc:mysql://localhost:3306/bancojsp";
            Strng user="root";
            String password="root";
            
            conecta=DriverManager.getConnection(url,user,password);
            //Lista os dados da tabela produto
            String sql=("SELECT * FROM produto WHERE nome LIKE ?");
            
            st=conecta.prepareStatement(sql);
            //na linha abaixo estamos dizendo o que vai dentro do ponto de ?
            //que será concatenado com % para poder pegar 
            //qualquer parte do nome do produto salvo no banco
            st.setString(1,"%" + n + "%");
            //ResultSet serve para guardar aquilo que é trazido do banco de dados
            ResultSet rs=st.executeQuery();
            //enquanto não chegar no final do BD ele vai executar
            //o que estiver dentro do while
            //vamos montar uma tabela html criando o título da tabela
            //e executar o código java
        %>
        <table>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Valor</th>
            </tr>
            <%
                while(rs.next())
            %>
            <!--finalizamos o código java acima e agora vamos criar uma tabela html
            para mostrar os dados recuperados do banco de dados-->
            <tr>
                <td>
                    <% =rs.getString("código")%>
                </td>
                <td>
                    <% =rs.getString("nome")%>
                </td>
                <td>
                    <% =rs.getString("marca")%>
                </td>
                <td>
                    <% =rs.getString("valor")%>
                </td>
            </tr>
            <%
                }
            %>
        </table>
            <%
                }catch (Exception x){
                    out.print("Mensagem de erro: " + x.getMenssage());
                }
            %>
    </body>
</html>