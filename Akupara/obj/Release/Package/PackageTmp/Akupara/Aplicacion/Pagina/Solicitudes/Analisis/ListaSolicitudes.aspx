<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="ListaSolicitudes.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Solicitudes.Analisis.ListaSolicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #BackgroundGeneral {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100002;
        }

        #progressGeneral {
            position: fixed;
            top: 20%;
            left: 20%;
            left: 20%;
            height: 50%;
            width: 50%;
            z-index: 100001;
            background-image: url('../../../../../assets/images/loading.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="BackgroundGeneral" style="display: none;"></div>
    <div id="progressGeneral" style="display: none;"></div>
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h4 class="mb-2">Solicitudes</h4>
            <div class="main-content-breadcrumb"><span>Gestionar Solicitudes</span>  </div>
        </div>
    </div>
    <div runat="server" visible="true" id="divSolicitudes">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableS" class="table table-striped border   form-control-sm">
                            <thead>
                                <tr>

                                    <th>Solicitud</th>
                                    <th>Nombre cliente</th>
                                    <th>Fecha de solicitud</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="SolicitudesRealizadas">
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("TITULO")%>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label1" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label3" Text='<%# Eval("FECHA_SOLICITUD") %>' runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtestado" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                            </td>
                                            <td class="text-center">
                                                <div class=" text-left">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <asp:LinkButton runat="server" ID="btnDetalleServicio" data-toggle="tooltip" OnClientClick="showProgressGeneral();" Visible="false" title="Gestionar" OnCommand="btnDetalleServicio_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-success"><i class="typcn typcn-th-list-outline"></i> Gestionar</asp:LinkButton>
                                                            <asp:LinkButton runat="server" ID="btnvercotizacion" data-toggle="tooltip" OnClientClick="showProgressGeneral();" Visible="false" title="Ver Cotización" OnCommand="btnvercotizacion_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-warning"><i class="typcn typcn-eye-outline"></i> Ver cotización</asp:LinkButton>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="btnDetalleServicio" />
                                                            <asp:PostBackTrigger ControlID="btnvercotizacion" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>

                                                </div>
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

    <script type="text/javascript">
        function ModalDetalles() {
            $('#detalles').modal('show');
        }
    </script>

    <script type="text/javascript">

        function showProgressGeneral() {
            var progressBar = document.getElementById('progressGeneral');
            var Background = document.getElementById('BackgroundGeneral');

            // Guardar los estilos originales del elemento
            var originalDisplay = progressBar.style.display;
            var originalStyles = progressBar.getAttribute('style');

            var originalDisplay2 = Background.style.display;
            var originalStyles2 = Background.getAttribute('style');

            // Mostrar la barra de progreso
            progressBar.style.display = 'block';
            Background.style.display = 'block';

            // Ocultar la barra de progreso cuando la página haya terminado de cargar
            window.addEventListener('load', function () {
                progressBar.style.display = 'none';
                Background.style.display = 'none';

                // Restaurar los estilos originales del elemento
                progressBar.style.display = originalDisplay;
                progressBar.setAttribute('style', originalStyles);


                Background.style.display = originalDisplay2;
                Background.setAttribute('style', originalStyles2);
            });
        }


    </script>


    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div allowoutsideclick: false class="modal fade" id="detalles" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class=" modal-xl   modal-dialog ">
                    <div class="modal-xl modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabelsss">Detalles</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="d-flex justify-content-between">
                                        <h4 class="card-title mb-2 mt-2">Detalle Solicitud</h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-11">
                                            <p class="tx-12 text-muted mb-0">Información del contacto</p>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
                                            <div>
                                                <div class="card-body ">
                                                    <hr class="m-0" />
                                                    <div class="pd-15  bg-gray-200 small formlayout">
                                                        <div class="row row-sm ">
                                                            <div class="col-lg-6">
                                                                <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre  *</span> </div>
                                                                <asp:TextBox runat="server" Enabled="false" ID="txtNombreCompleto" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Nombre completo" type="text" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                    ControlToValidate="txtNombreCompleto" Display="Dynamic" ForeColor="Red"
                                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Identificación  *</span> </div>
                                                                <asp:TextBox runat="server" Enabled="false" ID="txtIdentificacion" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Identificación" type="text" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                    ControlToValidate="txtIdentificacion" Display="Dynamic" ForeColor="Red"
                                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                            </div>

                                                            <div class="col-lg-6">
                                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon3">Telefono  *</span> </div>
                                                                <asp:TextBox runat="server" Enabled="false" ID="txtTelefono" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Telefono" type="number" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                    ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red"
                                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon4">Correo  *</span> </div>
                                                                <asp:TextBox runat="server" Enabled="false" ID="txtCorreo" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Correo" type="text" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                    ControlToValidate="txtCorreo" Display="Dynamic" ForeColor="Red"
                                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" BorderColor="Red" ValidationGroup="CrearSolicitud" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ErrorMessage="<i class='fa fa-info-circle'></i> Formato de Correo Invalido"></asp:RegularExpressionValidator>
                                                            </div>

                                                            <div class="col-lg-12">
                                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon5">Universidad /Institución *</span> </div>
                                                                <asp:TextBox runat="server" Enabled="false" ID="txtUniversidad" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Universidad /Institución" type="text" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                    ControlToValidate="txtUniversidad" Display="Dynamic" ForeColor="Red"
                                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="card-header m-0 pb-0">
                                                    <p class="tx-12 text-muted mb-0">Servicios Seleccionados <span class="badge badge-secondary">(Selección múltiple)</span></p>
                                                    <hr />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <asp:ListView ID="ListaDetalleServicios" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                                        ItemPlaceholderID="itemPlaceHolder1" GroupItemCount="1">
                                        <LayoutTemplate>
                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                        </LayoutTemplate>
                                        <GroupTemplate>
                                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                        </GroupTemplate>
                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="txtID" Text=' <%# Eval("ID") %>' runat="server">
                                            </asp:Label>
                                            <div class="alert alert-outline-success m-0 pb-0" role="alert">
                                                <div class=" pb-0">
                                                    <p class="tx-12 text-muted mb-0"><span class="badge badge-secondary">(servicio)</span></p>
                                                </div>
                                                <div class="alert alert-success" role="alert">
                                                    <div class="main-content-breadcrumb">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<b class="text-bold"><%#Eval("NOMBRESERVICIO")%></b> </div>
                                                </div>

                                                <div class=" m-0">

                                                    <div class="table-responsive table-card mt-3 mb-1">
                                                        <div class=" pb-0">
                                                            <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Detalles)</span></p>
                                                        </div>
                                                        <table id="tableSolicitudes" class="table table-sm rouded shadow table-striped mg-b-1 text-md-nowrap border table-sm">
                                                            <thead style="background-color: #565A5D;">
                                                                <tr>

                                                                    <th>Nombre de la unidad</th>
                                                                    <th>Cantidad</th>
                                                                    <th>Tipo de unidad</th>
                                                                    <th>Valor unitario</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater runat="server" ID="DetalleServicio">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server">
                                                                                </asp:Label>
                                                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("Nombre")%>' runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <div class="handle-counter" id="handleCounter">

                                                                                    <asp:TextBox runat="server" ID="txtCantidadService" Enabled="false" Text='<%# Eval("CANTIDAD")%>' CssClass="form-control" />

                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="Label1" Text='<%# Eval("UNIDAD_MEDIDA") %>' runat="server"> </asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="txtvalorunitario" format="{0:N}" Text='<%# Eval("VALOR_UNITARIO") %>' runat="server" CssClass="form-control">  </asp:TextBox>
                                                                            </td>
                                                                            <%-- <td>
                                                            <asp:LinkButton runat="server" Visible='<%# Eval("plantillas") %>' CssClass="btn btn-light btn-xs" data-toggle="tooltip" title="Plantilla" ID="lbn_PlantillaT" OnCommand="lbn_PlantillaT_Command" CommandArgument='<%#Eval("ID")%>'><div class="avatar avatar-xs bg-warning rounded-circle"><i class="fa fa-plus-circle fa-2x"></i> </div></asp:LinkButton>
                                                        </td>
                                                        <asp:LinkButton ID="btnDetallePlatilla" runat="server" Visible="false">
                                                        <tr class="child">
                                                            <td class="child" colspan="4">
                                                                <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                                    <div class="card card-warning">
                                                                        <div class="card-header pb-0">
                                                                            <h5 class="card-title mb-0 pb-0">En este apartado estará la info de la Plantilla</h5>
                                                                        </div>
                                                                        <div class="card-body text-warning">

                                                                            <ul data-dtr-index="18" class="dtr-details">
                                                                                <li data-dtr-index="4" data-dt-row="18" data-dt-column="4"><span class="dtr-title">PLANO:</span> <span class="dtr-data">Nombre de la Plantilla</span></li>
                                                                                <li data-dtr-index="5" data-dt-row="18" data-dt-column="5"><span class="dtr-title">PLANO:</span> <span class="dtr-data">-Descargar Plantilla para diligenciar</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="card-footer">

                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </td>
                                                        </tr>
                                                        </asp:LinkButton>--%>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <div class="pd-30 pb-5 pd-sm-40 bg-gray-200 formlayout">
                                            <div class="row row-xs align-items-center mg-b-20">
                                                <div class="col-md-4">
                                                    <label class="form-label font-weight-bold mg-b-0">Asunto *</label>
                                                </div>
                                                <div class="col-md-8 mg-t-5 mg-md-t-0">
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtTituloSolicitud" CssClass="form-control" placeholder="Asunto" type="text" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtTituloSolicitud" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row row-xs align-items-center mg-b-20">
                                                <div class="col-md-4">
                                                    <label class="form-label font-weight-bold mg-b-0">Comentarios</label>
                                                </div>
                                                <div class="col-md-8 mg-t-5 mg-md-t-0">
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtComentariosSolicitud" Rows="5" TextMode="MultiLine" CssClass="form-control" placeholder="Comentarios" type="text" />
                                                </div>
                                            </div>



                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div runat="server" visible="false" id="divbtns">
                                <div class="row">

                                    <div class="col-md-12 text-center">
                                        <asp:LinkButton runat="server" ID="btnGuardarCotizacion" OnClientClick="showProgressGeneral();" OnClick="btnGuardarCotizacion_Click" class="btn btn-success btn-rounded ">Guardar Cotización</asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="btnActualizarCotizacion" OnClientClick="showProgressGeneral();" OnClick="btnGuardarCotizacion_Click" class="btn btn-success btn-rounded ">Actualizar Cotización</asp:LinkButton>

                                    </div>
                                    <%--<div class="col-md-5">
                    <asp:LinkButton runat="server" ID="btnRechazar" class="btn btn-danger btn-rounded btn-block">Rechazar</asp:LinkButton>
                </div>--%>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </div>

        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>

