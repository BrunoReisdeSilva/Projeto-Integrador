<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String nome, telefone, endereco, cpf, email;
        nome = request.getParameter("nome");
        telefone = request.getParameter("telefone");
        endereco = request.getParameter("endereco");
        cpf = request.getParameter("cpf");
        email = request.getParameter("email");

        if (nome != null && telefone != null && endereco != null && cpf != null && email != null) {
            Connection conecta = null;
            PreparedStatement st = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastrar", "root", "reis123");
                st = conecta.prepareStatement("INSERT INTO cadastro(nome, telefone, endereco, cpf, email) VALUES (?, ?, ?, ?, ?)");
                st.setString(1, nome);
                st.setString(2, telefone);
                st.setString(3, endereco);
                st.setString(4, cpf);
                st.setString(5, email);
                int rows = st.executeUpdate(); // Execute a inserção
                if (rows > 0) {
                    out.print("Produto cadastrado com sucesso");
                } else {
                    out.print("Erro ao cadastrar o produto");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (st != null) {
                    st.close();
                }
                if (conecta != null) {
                    conecta.close();
                }
            }
        }
    %>
</body>
</html>


