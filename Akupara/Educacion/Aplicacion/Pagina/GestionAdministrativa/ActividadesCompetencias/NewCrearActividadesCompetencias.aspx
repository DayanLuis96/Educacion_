<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewCrearActividadesCompetencias.aspx.cs" Inherits="Akupara.Educacion.Aplicacion.Pagina.GestionAdministrativa.ActividadesCompetencias.NewCrearActividadesCompetencias" %>

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
    <style>
        .modal-content {
            height: 90vh;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
            padding: 15px; /* Agrega espacio interno */
            padding-bottom: 2px; /* Pequeño margen en la parte inferior */
        }

        .content {
            flex-grow: 1;
            overflow: hidden;
            padding: 10px; /* Espaciado interno para evitar que el contenido toque los bordes */
            background-color: #fff; /* Asegura un fondo si es necesario */
            border-radius: 8px; /* Opcional: para esquinas redondeadas */
        }

        .iframe_ {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="container-fluid">
        <hr class="my-4">
        <h5 class="text-primary">🧠 Crear Actividad Académica (Competencia ➜ Criterio ➜ Actividad)
        </h5>
        <hr class="mb-4">

        <!-- Área - Grado - Asignatura - Periodo -->
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Área*</span>
                        </div>
                        <asp:DropDownList ID="txtarea" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Grado*</span>
                        </div>
                        <asp:DropDownList ID="txtgrado" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Asignatura*</span>
                        </div>
                        <asp:DropDownList ID="txtasignatura" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Periodo*</span>
                        </div>
                        <asp:DropDownList ID="txtperiodo" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Competencia -->
        <div class="row">
            <div class="col-md-9">
                <div class="form-group">
                    <span>Competencia*</span>
                    <asp:DropDownList ID="txtcompetencias" placeholder="Seleccione Competencia" runat="server" CssClass="form-control select2 form-control-sm"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label></label>
                    <asp:LinkButton Text="Crear Competencia" ID="btncompetencia" CssClass="btn form-control form-control-sm btn-outline-success btn-sm" OnClick="btncompetencia_Click" runat="server" />
                </div>
            </div>
        </div>

        <!-- Criterio -->
        <div class="row">
            <div class="col-md-9">
                <div class="form-group">
                    <span>Criterio*</span>
                    <asp:DropDownList ID="txtcriterios" runat="server" CssClass="form-control select2 form-control-sm" />
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label></label>
                    <asp:LinkButton Text="Crear Criterios" ID="btncrearcriterios" OnClick="btncrearcriterios_Click" CssClass="btn btn-outline-primary form-control form-control-sm btn-sm" runat="server" />
                </div>
            </div>
        </div>

        <!-- Actividad - Tipo - Valor -->
        <div class="row">
            <div class="col-md-9">
                <div class="form-group">
                    <span>Actividad*</span>
                    <asp:DropDownList ID="txtcrearactividad" runat="server" CssClass="form-control select2  form-control-sm" />
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <label></label>
                    <asp:LinkButton Text="Crear Actividad" OnClick="btncrearactividad_Click" ID="btncrearactividad" CssClass="btn btn-outline-info btn-sm form-control   form-control-sm" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Tipo*</span>
                        </div>
                        <asp:DropDownList ID="txttipoactividad" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">% Valor*</span>
                        </div>
                        <asp:TextBox ID="txtvaloractividad" runat="server" CssClass="form-control form-control-sm" TextMode="Number" />
                    </div>
                </div>
            </div>
        </div>
        <!-- Descripción -->
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Descripción</span>
                        </div>
                        <asp:TextBox ID="txtdescripcionactividad" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="3" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Botón -->
        <div class="row mt-3">
            <div class="col-md-12 text-center">
                <asp:Button ID="btnGuardarActividad" runat="server" Text="Guardar Actividad" CssClass="btn btn-primary btn-sm" OnClick="btnGuardarActividad_Click"  OnClientClick="this.disabled=true;" UseSubmitBehavior="false"/>
              <asp:Button Text="Cancelar" CssClass="btn btn-outline-danger btn-sm" ID="btncancelar" OnClick="btncancelar_Click" runat="server" />
                      </div>
        </div>

    </div>
    <div class="modal fade" id="CrearCompetencia" data-backdrop="static" tabindex="-1" aria-labelledby="myModalLabelss" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl" style="max-width: 90%; height: 90vh;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary" id="myModalLabelss">🧠 Gestión de Actividades</h5>
                    <asp:LinkButton runat="server" ID="BtnCerrarModalActualizar" CssClass="btn-close" aria-label="Cerrar"></asp:LinkButton>
                </div>

                <div class="modal-body">
                    <div class="form-group" id="panelcompetencia" runat="server">

                        <div class="form-group mb-3">
                            <div class="input-group input-group-sm">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Competencia</span>
                                </div>
                                <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtcrearcompetencia" />
                            </div>
                        </div>

                        <div class="card shadow rounded-4">
                            <div class="card-header bg-primary text-white">
                                <h6 class="mb-0">📋 Listado de competencias creadas</h6>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered mb-0">
                                        <thead class="table-light text-dark text-center align-middle">
                                            <tr>
                                                <th>#</th>
                                                <th>Competencia</th>
                                                <th>Estado</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="TablaComitites">
                                                <ItemTemplate>
                                                    <tr class=" text-center">
                                                        <td>
                                                            <asp:Label ID="IdRegistro" Text=' <%# Eval("ID") %>' runat="server" />
                                                        </td>
                                                        <td><%#Eval("NOMBRE")%></td>
                                                        <td><%#Eval("ESTADO")%></td>
                                                        <td class="text-center">
                                                            <asp:Button ID="btnCambiarEstado" runat="server" Text="🔄" CommandName='<%#Eval("ESTADO")%>' CommandArgument='<%#Eval("ID")%>' OnCommand="btnCambiarEstado_Command" CssClass="btn btn-sm btn-info" ToolTip="Cambiar estado" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <!-- Más filas -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" id="panelcriterios" visible="false" runat="server">
                        <div class="form-group mb-3">
                            <div class="input-group input-group-sm">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Criterios / Actividad</span>
                                </div>
                                <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtcriterioscreados" />
                                <asp:CheckBox Text="Es Criterio" ID="checescriterio" Enabled="false" CssClass=" badge badge-info" runat="server" />
                            </div>
                        </div>
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
                                                <th>Criterios</th>
                                                <th>Estado</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="tablacriterios">
                                                <ItemTemplate>
                                                    <tr class=" text-center">
                                                        <td>
                                                            <asp:Label ID="IdRegistro" Text=' <%# Eval("ID") %>' runat="server" />
                                                        </td>
                                                        <td><%#Eval("NOMBRE")%></td>
                                                        <td><%#Eval("ESTADO")%></td>
                                                        <td class="text-center">
                                                            <asp:Button ID="btnCambiarEstadocriterios" runat="server" Text="🔄" CommandName='<%#Eval("ESTADO")%>' CommandArgument='<%#Eval("ID")%>' OnCommand="btnCambiarEstadocriterios_Command" CssClass="btn btn-sm btn-info" ToolTip="Cambiar estado" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <!-- Más filas -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <asp:Button Text="Guardar" CssClass="btn btn-sm btn-outline-success " ID="btnguardartodos" OnClick="btnguardartodos_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" runat="server" />
                        </div>
                </div>
                <!-- modal-body -->
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function IrCrearCompetencia() {
            $('#CrearCompetencia').modal('show');
        }
    </script>
</asp:Content>
