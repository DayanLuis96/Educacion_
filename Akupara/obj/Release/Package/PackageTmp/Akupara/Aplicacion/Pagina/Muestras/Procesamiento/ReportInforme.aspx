<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportInforme.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Procesamiento.ReportInforme" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
               <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="800px" Width="100%"></rsweb:ReportViewer>
    </form>
</body>
</html>
