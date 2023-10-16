<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        String nome, email, senha;
        nome = request.getParameter("nome");
        email = request.getParameter("email");
        senha = request.getParameter("senha");

        if (nome != null && email != null && senha != null) {
            Connection conecta = null;
            PreparedStatement st = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastrar", "root", "reis123");
                st = conecta.prepareStatement("INSERT INTO login (nome, email, senha) VALUES (?, ?, ?)");
                st.setString(1, nome);
                st.setString(2, email);
                st.setString(3, senha);
                int rows = st.executeUpdate(); 
                if (rows > 0) {
                    out.print("Logado com sucesso");
                } else {
                    out.print("Erro ao logar");
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
