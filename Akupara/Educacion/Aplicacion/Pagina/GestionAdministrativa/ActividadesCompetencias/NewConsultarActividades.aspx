<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewConsultarActividades.aspx.cs" Inherits="Akupara.Educacion.Aplicacion.Pagina.GestionAdministrativa.ActividadesCompetencias.NewConsultarActividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../../Stilos_JS_Boostrapp_5/css/bootstrap.css" rel="stylesheet" />
    <script src="../../../../../js/jquery-1.10.2.min.js"></script>
    <link href="../../../../Stilos_JS_Boostrapp_5/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../../Stilos_JS_Boostrapp_5/js/bootstrap.js"></script>
    <script src="../../../../Stilos_JS_Boostrapp_5/js/bootstrap.min.js"></script>
    <link href="../../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.js"></script>
    <style>
        thead th {
            color: #000 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="container-fluid">
        <div class="text-center  form-group">
            <h5>Consultar Actividades</h5>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Actividad</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtactividad" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <asp:Button Text="Buscar" CssClass="btn btn-outline-primary btn-sm" ID="btnbuscar" OnClick="btnbuscar_Click" runat="server" />
                <asp:Button Text="Nuevo Actividad" CssClass="btn btn-outline-success btn-sm" ID="btnnuevo" OnClick="btnnuevo_Click" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card shadow rounded-4">
                    <div class="card-header bg-primary text-white">
                        <h6 class="mb-0">📋 Listado de criterios / Actividades creadas</h6>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-bordered mb-0">
                                <thead class="table-light text-dark text-center align-middle">
                                    <tr>
                                        <th>#</th>
                                        <th>Área</th>
                                        <th>Grado</th>
                                        <th>Asignatura</th>
                                        <th>Periodo</th>
                                        <th>Competencia</th>
                                        <th>Criterio</th>
                                        <th>Actividad</th>
                                        <th>Tipo</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="tablaactividades">
                                        <ItemTemplate>
                                            <tr class=" text-center">
                                                <td>
                                                    <asp:Label ID="IdRegistro" Text=' <%# Eval("ID") %>' runat="server" />
                                                </td>
                                                <td><%# Eval("AREA") %></td>
                                                <td><%# Eval("GRADO") %></td>
                                                <td><%# Eval("ASIGNATURA") %></td>
                                                <td><%# Eval("PERIODO") %></td>
                                                <td><%# Eval("COMPETENCIA") %></td>
                                                <td><%# Eval("CRITERIO") %></td>
                                                <td><%# Eval("ACTIVIDAD") %></td>
                                                <td><%# Eval("TIPO") %></td>
                                                <td class="text-center">
                                                    <asp:Button ID="btnCambiarEstadocriterios" runat="server" Text="🔄"  CommandArgument='<%#Eval("ID")%>'   CssClass="btn btn-sm btn-info" ToolTip="Cambiar estado" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
