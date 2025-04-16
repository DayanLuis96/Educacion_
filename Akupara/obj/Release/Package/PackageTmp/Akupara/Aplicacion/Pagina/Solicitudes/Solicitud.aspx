<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Solicitud.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Solicitudes.Solicitud" %>

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

        .border-b1 {
            border-bottom: 1px solid;
        }

        #notiContent {
            height: 200px;
            overflow: auto;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
        }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                left: 2px;
                bottom: 2px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #94B43B;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #94B43B;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(20px);
            -ms-transform: translateX(20px);
            transform: translateX(20px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 30px;
        }

            .slider.round:before {
                border-radius: 50%;
            }

        .btn-redon {
            border-radius: 100%;
            height: 2.5rem;
            width: 2.5rem;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="BackgroundGeneral" style="display: none;"></div>
    <div id="progressGeneral" style="display: none;"></div>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="card">
                <div class="card-header pb-0">
                    <div class="row row-sm">
                        <div class="col-md-6">
                            <div class="d-flex justify-content-between">
                                <h4 class="card-title mb-2 mt-2">Datos de los Servicios</h4>
                            </div>

                            <p class="tx-12 text-muted mb-0">Información del contacto</p>
                        </div>
                        <div class="col-md-6 text-right">
                            <asp:LinkButton runat="server" ID="btnmisSolicitudes" OnClick="btnmisSolicitudes_Click" CssClass="btn  btn-lg btn-outline-success"><i class="fa fa-list"></i> Mis solicitudes</asp:LinkButton>

                        </div>
                    </div>


                    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
                        <div class="card">
                            <div class="card-body ">
                                <hr class="m-0" />
                                <div class="pd-15  bg-gray-200 small formlayout">
                                    <div class="row row-sm">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre  *</span> </div>
                                                <asp:TextBox runat="server" ID="txtNombreCompleto" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Nombre completo" type="text" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtNombreCompleto" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Identificación  *</span> </div>
                                                <asp:TextBox runat="server" ID="txtIdentificacion" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Identificación" type="text" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtIdentificacion" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon3">Telefono  *</span> </div>
                                                <asp:TextBox runat="server" ID="txtTelefono" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Telefono" type="number" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">

                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon4">Correo  *</span> </div>
                                                <asp:TextBox runat="server" ID="txtCorreo" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Correo" type="text" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtCorreo" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" BorderColor="Red" ValidationGroup="CrearSolicitud" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ErrorMessage="<i class='fa fa-info-circle'></i> Formato de Correo Invalido"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group">

                                                <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon5">Universidad /Institución *</span> </div>
                                                <asp:TextBox runat="server" ID="txtUniversidad" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Universidad /Institución" type="text" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtUniversidad" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="row row-sm">
                        <div class="col-md-12">
                            <div class="card task-container overflow-hidden">
                                <div class="task-overlay"></div>
                                <div class="row row-sm">
                                    <div class="col-xl-3 col-lg-4 pr-0 tab-list-items ps">

                                        <div class="card-body pl-0 pr-0">
                                            <ul class="nav nav-pills d-block items-blog-tab-menu">
                                                <div class="card-header pb-0">
                                                    <p class="tx-12 text-muted mb-0">Seleccione el servicio <span class="badge badge-secondary">(Selección múltiple posible)</span></p>
                                                </div>
                                                <hr class="mg-y-10">
                                                <li class=""><a href="#" class="task-label" data-toggle="tab">Lista de Servicios</a></li>
                                                <asp:Panel ID="PanelDetalle" Width="100%" Height="600px" ScrollBars="Auto" runat="server">

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
                                                            <div class="main-content-breadcrumb">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span></span> </div>


                                                            <li>

                                                                <asp:LinkButton runat="server" ID="btnDetalleServicio" data-toggle="tooltip" OnCommand="btnDetalleServicio_Command" title='<%#Eval("NOMBRESERVICIO")%>' CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-outline-dark small"><i class="fa fa-empire fa-2x"></i> &nbsp;&nbsp;&nbsp;

                                                              <h6>  <%#Eval("NOMBRESERVICIO")%></h6>
                                                                </asp:LinkButton>


                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </asp:Panel>
                                            </ul>
                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-8 pl-0">
                                        <div class="">


                                            <!-- main-mail-options -->
                                            <div class="tab-content border-left tasks-list-box ps ps--active-y" id="">
                                                <div class="text-center col-12"><span id="errmsg" class="mx-auto pt-5"></span></div>

                                                <asp:ListView ID="ListaDetalleServicios2" runat="server"
                                                    ItemPlaceholderID="itemPlaceHolder1" GroupItemCount="1">

                                                    <ItemTemplate>
                                                        <asp:Label Visible="false" ID="txtIDD" Text=' <%# Eval("ID") %>' runat="server">
                                                        </asp:Label>
                                                        <div class="tab-pane" id="divDetalle" runat="server">
                                                            <div class="main-mail-list">
                                                                <asp:Panel ID="PanelDetalle" Width="100%" Height="600px" ScrollBars="Auto" runat="server">

                                                                    <div class="task-task-item edit edit_number_link" id="edit_number_link0">

                                                                        <%--   <div class="card-body">--%>
                                                                        <div class="table-responsive">
                                                                            <table class="table table-sm table-striped  text-md-nowrap border small">
                                                                                <thead style="background-color: #565A5D;">
                                                                                    <tr>
                                                                                        <th>
                                                                                            <label runat="server" visible="false" class="switch" data-toggle="tooltip" title="Marcar todos">
                                                                                                <asp:CheckBox ID="ch_MDetalleServicio" AutoPostBack="true" OnCheckedChanged="ch_MDetalleServicio_CheckedChanged" runat="server" />
                                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>
                                                                                            </label>
                                                                                        </th>
                                                                                        <th>Nombre de la unidad</th>
                                                                                        <th>Cantidad</th>
                                                                                        <th>Cantidad Manual</th>
                                                                                        <th>Tipo de unidad</th>
                                                                                        <%--<th></th>--%>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <asp:Repeater runat="server" ID="DetalleServicio">
                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <label class="switch custom-switch">
                                                                                                        <asp:UpdatePanel runat="server">
                                                                                                            <ContentTemplate>
                                                                                                                <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck">
                                                                                                                    <asp:CheckBox ID="ch_DetalleServicio" runat="server" />
                                                                                                                    <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                                                                                </asp:LinkButton>
                                                                                                            </ContentTemplate>
                                                                                                            <Triggers>
                                                                                                                <asp:AsyncPostBackTrigger ControlID="btnCheck" />
                                                                                                            </Triggers>
                                                                                                        </asp:UpdatePanel>
                                                                                                    </label>

                                                                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server">
                                                                                                    </asp:Label>
                                                                                                </td>

                                                                                                <td>
                                                                                                    <asp:Label ID="TemaDiscu" Text='<%# Eval("Nombre")%>' runat="server"></asp:Label>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <div class="handle-counter" id="handleCounter">
                                                                                                        <asp:UpdatePanel runat="server">
                                                                                                            <ContentTemplate>
                                                                                                                <div class="small-group">
                                                                                                                    <div class="input-group">
                                                                                                                        <asp:LinkButton runat="server" ID="btnMin" OnCommand="btnMin_Command" CommandArgument='<%#Eval("ID")%>' class="counter-minus btn btn-light btn- btn-sm">-</asp:LinkButton>

                                                                                                                        <asp:TextBox runat="server" ID="txtCantidadService" Enabled="false" Text="0" min="0" CssClass="btn-sm form-control-sm small" />
                                                                                                                        <asp:LinkButton runat="server" ID="btnPlus" OnCommand="btnPlus_Command" CommandArgument='<%#Eval("ID")%>' class="counter-plus btn btn-light  btn-sm">+</asp:LinkButton>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </ContentTemplate>
                                                                                                            <Triggers>
                                                                                                                <asp:AsyncPostBackTrigger ControlID="btnMin" />
                                                                                                                <asp:AsyncPostBackTrigger ControlID="txtCantidadService" />
                                                                                                                <asp:AsyncPostBackTrigger ControlID="btnPlus" />
                                                                                                            </Triggers>
                                                                                                        </asp:UpdatePanel>
                                                                                                    </div>
                                                                                                </td>

                                                                                                <td>

                                                                                                    <div class="handle-counter">
                                                                                                        <asp:UpdatePanel runat="server">
                                                                                                            <ContentTemplate>
                                                                                                                <asp:TextBox runat="server" ID="txtManual" Enabled="false" onKeyPress="return soloNumeros(event)" Text="0" min="0" CssClass="btn-sm" />
                                                                                                                <asp:LinkButton runat="server" ID="btnPlusManual" OnCommand="btnPlusManual_Command" CommandArgument='<%#Eval("ID")%>' class="counter-plus btn btn-primary btn-sm"><i class="fa fa-refresh" aria-hidden="true"></i> Asignar</asp:LinkButton>
                                                                                                            </ContentTemplate>
                                                                                                            <Triggers>
                                                                                                                <asp:AsyncPostBackTrigger ControlID="btnPlusManual" />
                                                                                                            </Triggers>
                                                                                                        </asp:UpdatePanel>
                                                                                                    </div>

                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Label ID="Label1" Text='<%# Eval("tipo") %>' runat="server"> </asp:Label>
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
                                                                        <%--   </div>--%>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>

                                                <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                                    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                                </div>
                                                <div class="ps__rail-y" style="top: 0px; height: 600px; right: 0px;">
                                                    <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 544px;"></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>






                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="pd-30 pb-5 pd-sm-40 bg-gray-200 formlayout">
                            <div class="row row-xs align-items-center mg-b-20">
                                <div class="col-md-4">
                                    <label class="form-label font-weight-bold mg-b-0">Asunto *</label>
                                </div>
                                <div class="col-md-8 mg-t-5 mg-md-t-0">
                                    <asp:TextBox runat="server" ID="txtTituloSolicitud" class="form-control" placeholder="Asunto" type="text" />
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
                                    <asp:TextBox runat="server" ID="txtComentariosSolicitud" Rows="5" TextMode="MultiLine" class="form-control" placeholder="Comentarios" type="text" />
                                </div>
                            </div>

                            <div class="col-md-12 text-center">

                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <asp:LinkButton runat="server" ID="lbn_enviarData" OnClientClick="showProgressGeneral();" ValidationGroup="CrearSolicitud" OnClick="lbn_enviarData_Click" Text="Enviar" CssClass="btn btn-success"></asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <script>
                    function soloNumeros(e) {
                        var key = window.Event ? e.which : e.keyCode
                        return ((key >= 48 && key <= 57) || (key == 8))
                    }

                </script>


            </div>



        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ListaDetalleServicios" />
            <asp:PostBackTrigger ControlID="lbn_enviarData" />
        </Triggers>
    </asp:UpdatePanel>

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
