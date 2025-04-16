<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reportes_Inventario.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.Reportes.Reportes_Inventario" %>

<%@ Register Src="~/Akupara/Aplicacion/Pagina/Inventario/Reportes/DetalleReporte.ascx" TagPrefix="uc1" TagName="DetalleReporte" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:DetalleReporte runat="server" id="DetalleReporte" />
   
</asp:Content>
