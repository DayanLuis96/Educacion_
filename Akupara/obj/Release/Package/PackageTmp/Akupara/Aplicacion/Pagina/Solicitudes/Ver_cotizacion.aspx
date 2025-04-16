<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ver_cotizacion.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Solicitudes.Ver_cotizacion" %>

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
            <h4 class="mb-2">Mis solicitudes</h4>
            <div class="main-content-breadcrumb"><span>Cotización</span>  </div>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="modal-body">


        <div class="card">

            <div runat="server" id="divINDICACIONES" visible="false">
                <div class="card-body">

                    <div class="row align-items-center">
                        <div class="col-6">
                            <h6 class="text-muted text-uppercase fw-semibold text-truncate fs-12 mb-0">Indicaciones Diligenciamiento</h6>
                        </div>
                    </div>
                    <!-- end row -->
                    <div class="mt-3 pt-2">
                        <div class="progress progress-lg rounded-pill">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-info" role="progressbar" style="width: 18%" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-success" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 16%" aria-valuenow="16" aria-valuemin="0" aria-valuemax="100"></div>
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 19%" aria-valuenow="19" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <!-- end -->

                    <div class="mt-3 pt-2">
                        <div class="d-flex mb-2">
                            <div class="flex-grow-1">
                                <p class="text-truncate text-muted fs-14 mb-0"><i class="mdi mdi-circle align-middle text-primary me-2"></i><strong>Paso 1:</strong> Descargar plantilla correspondiente al detalle del servicio. <i class="fa fa-download" aria-hidden="true"></i></p>
                            </div>
                            <div class="flex-shrink-0">
                                <p class="mb-0"><i class="fas fa-check-circle"></i></p>
                            </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex mb-2">
                            <div class="flex-grow-1">
                                <p class="text-truncate text-muted fs-14 mb-0"><i class="mdi mdi-circle align-middle text-info me-2"></i><strong>Paso 2:</strong> Gestionar plantilla descargada en el botón <i class="fa fa-plus-square" aria-hidden="true"></i></p>
                                <p class="alert-info">Nota: Recuerda cargar la misma cantidad solicitada.(La cantidad cotizada inicialmente puede ser modificable)</p>
                            </div>
                            <div class="flex-shrink-0">
                                <p class="mb-0"><i class="fas fa-check-circle"></i></p>
                            </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex mb-2">
                            <div class="flex-grow-1">
                                <p class="text-truncate text-muted fs-14 mb-0"><i class="mdi mdi-circle align-middle text-success me-2"></i><strong>Paso 3:</strong> En este apartado debes diligenciar la información de la muestra. Tienes dos opciones para hacerlo, de forma manual o a través del adjunto en Excel. Es indispensable que la información esté debidamente</p><p class="text-truncate text-muted fs-14 mb-0"> diligenciada y completa, para que no sea causa de devolución.</p>
                                <p class="alert-success">Nota: Una vez cargado el estado debe cambiar y el check de "Aceptar" debe cambiar a marcado <i class="fa fa-check-square" aria-hidden="true"></i>.</p>
                            </div>
                            <div class="flex-shrink-0">
                                <p class="mb-0"><i class="fas fa-check-circle"></i></p>
                            </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex mb-2">
                            <div class="flex-grow-1">
                                <p class="text-truncate text-muted fs-14 mb-0"><i class="mdi mdi-circle align-middle text-warning me-2"></i><strong>Paso 4:</strong> Realiza los pasos del 1 al 3 hasta completar todos los registros.</p>
                                <p class="alert-warning">Nota: Al finalizar, todos los que sean marcados con "Aceptar" <i class="fa fa-check-square" aria-hidden="true"></i>seguirán en el proceso.</p>
                            </div>
                            <div class="flex-shrink-0">
                                <p class="mb-0"><i class="fas fa-check-circle"></i></p>
                            </div>
                        </div>
                        <!-- end -->
                        <div class="d-flex">
                            <div class="flex-grow-1">
                                <p class="text-truncate text-muted fs-14 mb-0"><i class="mdi mdi-circle align-middle text-danger me-2"></i><strong>Paso 5:</strong> Da clic en el botón "Aceptar Servicios Seleccionados".</p>
                                <p class="alert-danger">Nota: Debes diligenciar por lo menos un servicio.</p>
                            </div>
                            <div class="flex-shrink-0">
                                <p class="mb-0"><i class="fas fa-check-circle"></i></p>
                            </div>
                        </div>
                        <!-- end -->
                    </div>

                    <!-- end -->

                </div>
            </div>
            <div class="card-header pb-0">
                <div class="d-flex justify-content-between">
                    <h4 class="card-title mb-2 mt-2">Detalle Cotización</h4>
                </div>
            </div>
            <asp:ListView ID="ListaDetalleCotizacion" runat="server" GroupPlaceholderID="groupPlaceHolder1"
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
                                <table id="tablecotizaciones" class="table table-sm rouded shadow table-striped mg-b-1 text-md-nowrap border table-sm">
                                    <thead style="background-color: #565A5D;">
                                        <tr>

                                            <th>Nombre de la unidad</th>
                                            <th>Cantidad</th>
                                            <th>Tipo de unidad</th>
                                            <th>Valor unitario</th>
                                            <th>Valor total</th>
                                            <th>Aceptar
                                               <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <div class="input-group">
                                                            <asp:CheckBox ID="checkAceptartodo" Visible="false" Text="Aceptar" AutoPostBack="true" OnCheckedChanged="checkAceptartodo_CheckedChanged" runat="server" />

                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>--%>

                                            </th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater runat="server" ID="Detallecotizacion">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server">
                                                        </asp:Label>
                                                        <asp:Label Visible="false" ID="txtUrl" Text=' <%# Eval("URL") %>' runat="server"></asp:Label>

                                                        <asp:Label Visible="false" ID="txtnombreplantilla" Text=' <%# Eval("nombre_plantilla") %>' runat="server">
                                                        </asp:Label>
                                                        <asp:Label ID="TemaDiscu" Text='<%# Eval("Nombre")%>' runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <div class="handle-counter" id="handleCounter">

                                                            <asp:TextBox runat="server" ID="txtCantidadService" OnTextChanged="txtCantidadService_TextChanged" AutoPostBack="true" TextMode="Number" Text='<%# Eval("CANTIDAD")%>' CssClass="form-control" />

                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label1" Text='<%# Eval("UNIDAD_MEDIDA") %>' runat="server"> </asp:Label>
                                                    </td>
                                                    <td>
                                                        <div class="handle-counter" id="valorunt">
                                                            <asp:TextBox ID="txtvalorunitario" Enabled="false" format="{0:N}" Text='<%# Eval("VALOR_UNITARIO") %>' runat="server" CssClass="form-control">  </asp:TextBox>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="handle-counter" id="valoruntotal">
                                                            <asp:TextBox ID="TextBox1" Enabled="false" format="{0:N}" Text='<%# Eval("ValorTotal") %>' runat="server" CssClass="form-control">  </asp:TextBox>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="checAceptar" CssClass="form-control form-control-sm text-center" CommandArgument='<%#Eval("ID")%>' runat="server" />

                                                        <%-- <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="checAceptar" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>--%>
                                                        <%--  <asp:Label Visible="false" ID="Label2" Text=' <%# Eval("ID") %>' runat="server">
                                                                    </asp:Label>--%>
                                                    </td>
                                                    <td>

                                                        <asp:LinkButton runat="server" Visible='<%# Eval("plantillas") %>' CssClass="btn btn-success  btn-sm" data-toggle="tooltip" title="Descargar plantilla" ID="btndescargarplan" OnCommand="btndescargarplan_Command" CommandArgument='<%#Eval("ID_PLANTILLA")%>'>Descargar plantilla <i class="fa fa-download fa-2x"></i> </asp:LinkButton>

                                                        <asp:LinkButton runat="server" Visible='<%# Eval("plantillas") %>' CssClass="btn btn-warning btn-sm" data-toggle="tooltip" title="Plantilla" ID="lbn_PlantillaT" OnCommand="lbn_PlantillaT_Command" OnClientClick="showProgressGeneral();" CommandArgument='<%#Eval("ID")%>'><div class="avatar avatar-xs bg-warning rounded-circle"><i class="fa fa-plus-circle fa-2x"></i> </div></asp:LinkButton>

                                                        <asp:Label runat="server" ID="Mensaje" CssClass="badge badge-pill badge-primary" Text='<%# Eval("MUESTRAS") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="Muestracargada_" CssClass="badge badge-pill badge-primary" Text='<%# Eval("MuestraCargada") %>'></asp:Label>

                                                        <asp:Label runat="server" ID="MensajeEstado_" CssClass="badge badge-pill badge-primary" Text='<%# Eval("EstadoMuestras") %>'></asp:Label>

                                                    </td>


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

        <div class="alert alert-success">
            <p>Los Servicios marcados como aceptados seran los unicos enviados para el procesamiento</p>
        </div>
    </div>

    <div runat="server" id="div1">
        <div class="row">


            <div class="col-md-12 text-center">
                <asp:LinkButton runat="server" ID="btnGuardarCotizacion" OnClick="btnGuardarCotizacion_Click" OnClientClick="showProgressGeneral();" class="btn btn-success btn-rounded ">Aceptar Servicios seleccionados</asp:LinkButton>

            </div>
            <%--<div class="col-md-5">
                    <asp:LinkButton runat="server" ID="btnRechazar" class="btn btn-danger btn-rounded btn-block">Rechazar</asp:LinkButton>
                </div>--%>
        </div>
    </div>


    <script type="text/javascript">
        function Mostrarformulario() {
            var frame = $('#iframe');
            var url = '<%= Session["FORM"] %>';
            frame.attr('src', url).show();

            $('#Anexo').modal('show');

        }
    </script>
    <div allowoutsideclick: false class="modal fade" id="Anexo" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Anexo</h4>
                    <asp:LinkButton runat="server" OnClick="Unnamed_Click" type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <div class="modal-body">
                    <div class="content">
                        <iframe name="iframe" id="iframe" onscroll="true" style="width: 100%; height: 500px; border: none"></iframe>

                    </div>
                </div>
            </div>
        </div>
    </div>

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
</asp:Content>
