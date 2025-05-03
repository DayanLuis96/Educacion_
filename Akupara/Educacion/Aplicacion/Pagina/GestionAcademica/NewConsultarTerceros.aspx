<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewConsultarTerceros.aspx.cs" Inherits="Akupara.Educacion.Aplicacion.Pagina.GestionAcademica.NewConsultarTerceros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Stilos_JS_Boostrapp_5/css/bootstrap.css" rel="stylesheet" />
    <link href="../../../Stilos_JS_Boostrapp_5/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Stilos_JS_Boostrapp_5/js/bootstrap.js"></script>
    <script src="../../../Stilos_JS_Boostrapp_5/js/bootstrap.min.js"></script>
    <link href="../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="text-center  form-group">
            <h5>Consultar</h5>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Persona</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtalumno" />
                        <asp:Button Text="Buscar Persona" CssClass="btn btn-outline-success btn-sm" ID="btnbuscar" OnClick="btnbuscar_Click" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group text-ringt">
                    <asp:Button Text="Nuevo Registro" CssClass="btn btn-outline-success btn-sm" ID="btnnuevo" OnClick="btnnuevo_Click" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group" style="width: 100%; height: 800px; overflow: scroll;">
                    <asp:GridView runat="server" ID="tablaconfigurados" CssClass="small shadow text-center  grid-padding" BorderColor="#cccccc" HeaderStyle-Height="30" HeaderStyle-BackColor="#dedee4" Width="100%" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#cccccc" SelectedRowStyle-BackColor="#66ccff">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="Editar" ID="btneditar" CssClass="btn btn-outline-primary btn-sm" OnCommand="btneditar_Command" CommandArgument='<%# Bind("ID") %>' runat="server" />
                                    <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" />
                            <asp:BoundField DataField="DOCUMENTO" HeaderText="DOCUMENTO" />
                            <asp:BoundField DataField="NOMBRE_COMPLETO" HeaderText="NOMBRE COMPLETO" />
                            <asp:BoundField DataField="FECHA_NACIMIENTO" HeaderText="FECHA NACIMIENTO" />
                            <asp:BoundField DataField="GENERO" HeaderText="GENERO" />
                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" />
                            <asp:BoundField DataField="CELULAR" HeaderText="CELULAR" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
