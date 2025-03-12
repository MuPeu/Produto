<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <%
            //recebe os dados alterados no formulário carregaprod.jsp
            int codigo;
            String nome, marca;
            double valor;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            marca = request.getParameter("marca");
            valor = Double.parseDouble(request.getParameter("preco"));
            
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/bancojsp";
            String user="root";
            String password="root";
            //alterar os dados na tabela produto no Banco de Dados
            conecta=DriverManager.getConnection(url,user,password);
            String sql=("UPDATE produto SET nome=?, marca=?, preco=? WHERE codigo=?");
            st=conecta.prepareStatement(sql);
            
            st.setString(1,nome);
            st.setString(2,marca);
            st.setDouble(3,valor);
            st.setInt(4,codigo);
            
            st.executeUpdate();
            out.print("Os dados do produto " + nome + " foram alterados com sucesso!");
        %>
    </body>
</html>
