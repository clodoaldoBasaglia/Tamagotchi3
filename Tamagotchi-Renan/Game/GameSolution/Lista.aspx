<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Lista.aspx.vb" Inherits="GameSolution.Lista" %>
<%@Import Namespace="GameSolution"%>
<%@Import Namespace="System.Drawing"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lista de Pets</title>
</head>
<body>
    <h1> Veja aqui seus pets</h1>
    <div class="container">

    <div class="row">

    
    <form id="form1" runat="server" method="get" action="Tela.aspx">
        <div>
            <asp:Table ID="Table1" runat="server" Width="100px" CssClass="table">
            </asp:Table>
        </div>
        <script runat="server">

        </script>

        <asp:Label ID="Label1" runat="server"></asp:Label>

    </form>
        </div>
        </div>
</body>
</html>
