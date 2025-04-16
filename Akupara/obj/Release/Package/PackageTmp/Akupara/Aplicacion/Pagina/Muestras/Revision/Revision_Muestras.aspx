<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Revision_Muestras.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Revision.Revision_Muestras" %>

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
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h4 class="mb-2">Muestras</h4>
            <div class="main-content-breadcrumb"><span>Revisión de muestras</span>  </div>
        </div>
    </div>

    <div class="row" runat="server" id="divPrincipal" visible="true">
        <div class="col-6 col-sm-6 col-lg-6 col-xl-6">
            <div runat="server" visible="true" id="divSolicitudes">
                <div class="card">
                    <div class="card-header">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tableS" class="table-responsive-sm table table-striped border small form-control-sm">
                                    <thead>
                                        <tr>

                                            <th>Acciones</th>
                                            <th>Solicitud</th>
                                            <th>Nombre cliente</th>
                                            <th>Fecha de solicitud</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater runat="server" ID="SolicitudesRealizadas">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-center">
                                                        <div class=" text-left">
                                                            <asp:LinkButton runat="server" OnClientClick="showProgressGeneral();" ID="btnDetalleServicio" data-toggle="tooltip" title="Gestionar" OnCommand="btnDetalleServicio_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-success"><i class="typcn typcn-th-list-outline"></i> </asp:LinkButton>
                                                        </div>
                                                    </td>
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

        <div class="col-6 col-sm-6 col-lg-6 col-xl-6">

            <asp:Panel runat="server" ScrollBars="Auto" Height="100%">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="d-flex justify-content-between">
                            <h4 class="card-title mb-2 mt-2">Detalle Solicitud</h4>
                        </div>
                        <div class="row">
                            <div class="col-md-11">
                                <p class="tx-12 text-muted mb-0">Información del contacto</p>
                            </div>
                            <%--  <div class="col-md-1">
                        <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

                    </div>--%>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
                                <div>
                                    <div class="card-body m-0 ">
                                        <hr class="m-0" />
                                        <div class="pd-15  bg-gray-200 small formlayout">
                                            <div class="row row-sm ">
                                                <div class="col-lg-6">
                                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre  *</span> </div>
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtNombreCompleto" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control form-control-sm" placeholder="Nombre completo" type="text" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtNombreCompleto" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Identificación  *</span> </div>
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtIdentificacion" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control form-control-sm" placeholder="Identificación" type="text" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtIdentificacion" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="col-lg-6">
                                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon3">Telefono  *</span> </div>
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtTelefono" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control form-control-sm" placeholder="Telefono" type="number" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon4">Correo  *</span> </div>
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtCorreo" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control form-control-sm" placeholder="Correo" type="text" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtCorreo" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" BorderColor="Red" ValidationGroup="CrearSolicitud" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ErrorMessage="<i class='fa fa-info-circle'></i> Formato de Correo Invalido"></asp:RegularExpressionValidator>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon5">Universidad /Institución *</span> </div>
                                                    <asp:TextBox runat="server" Enabled="false" ID="txtUniversidad" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control form-control-sm" placeholder="Universidad /Institución" type="text" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                        ControlToValidate="txtUniversidad" Display="Dynamic" ForeColor="Red"
                                                        ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12" runat="server" id="divBotonCOnfirmarRevision">
                                        <div class="row row-sm ">

                                            <div class="col-lg-12">
                                                <div class="alert alert-outline-info" role="alert">
                                                    <strong>Importante!</strong> Por favor una vez complete la revisión, dar click a este Botón
                                                     <div class="col-lg-12 text-center">
                                                         <asp:LinkButton runat="server" ID="BtnConfirmarRevision" OnClientClick="showProgressGeneral();" OnClick="BtnConfirmarRevision_Click" class="btn btn-success btn-rounded "> Confirmar Revisión
                                                         </asp:LinkButton>
                                                     </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-header m-0 pb-0">
                                        <p class="tx-12 text-muted mb-0">Servicios Seleccionados <span class="badge badge-secondary">(Selección múltiple)</span></p>
                                        <hr class="m-0" />
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
                                        <p class="tx-12 text-muted mb-0">
                                            <span class="badge badge-secondary">(servicio)  
                                                <div class="main-content-breadcrumb">
                                                    <b class="text-bold"><%#Eval("NOMBRESERVICIO")%></b>
                                            </span>
                                    </div>
                                    </p>
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
                                                    <th>Estado</th>
                                                    <th></th>
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

                                                                    <asp:TextBox runat="server" ID="txtCantidadService" Enabled="false" Text='<%# Eval("CANTIDAD")%>' CssClass="form-control form-control-sm" />

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>

                                                                    <asp:Label runat="server" ID="txtestado" Text='<%# Eval("ESTADO")%>' CssClass="alert form-control-sm small alert-primary" />

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton runat="server" CssClass="btn btn-primary btn-xs" data-toggle="tooltip" title="Revisar" OnClientClick="showProgressGeneral();" OnCommand="btnrevisar_Command" ID="btnrevisar" CommandArgument='<%#Eval("ID")%>'><div class="avatar avatar-xs btn-primary"><i class="fa fa-eye fa-2x"></i> </div></asp:LinkButton>
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

            </asp:Panel>
        </div>
    </div>


    <asp:Panel runat="server" ID="PanelAnexosCargados" Visible="false">


        <div class="row">
            <div class="col-md-2">
                <label class="switch" data-toggle="tooltip" title="Marcar todos">
                    <asp:CheckBox ID="ch_anx1a" AutoPostBack="true" OnCheckedChanged="ch_anx1a_CheckedChanged" runat="server" />
                    <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>
                </label>
                <small>Seleccionar todo</small>
            </div>
            <div class="col-md-9">
                <p class="tx-12 text-muted mb-0"><span runat="server" id="nombrePerfilSpan" class="badge badge-secondary"></span></p>

            </div>
            <div class="text-right col-md-1">
                <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClientClick="showProgressGeneral();" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

            </div>
            <div class="col-md-12">
                <p class="alert alert-primary ">
                    Seleccione todas las muestras que desea aprobar en caso contrio, escriba en el campo de observación el motivo de rechazo.
              
                </p>
            </div>
            <div class="col-md-12 text-center">
                <asp:LinkButton runat="server" ID="btnGuardarAnex1a" OnClientClick="showProgressGeneral();" OnClick="btnGuardarAnex1a_Click" class="btn btn-success btn-rounded "> Guardar Gestión
                </asp:LinkButton>
            </div>
        </div>
        <div class="card-footer text-center">

            <div runat="server" id="divAnexo1a" class="table-responsive">
                <p>Anexo 1a</p>
                <div class="row">
                    <div class="col-md-12">
                         <ul class="nav nav-tabs">
                        <li class="nav-item">
                             <asp:Button runat="server" ID="ButtonMuestras" OnClick="ButtonMuestras_Click" CssClass="nav-link bg-primary active" Text="Muestras " />
                        </li>
                        <li class="nav-item">
                            <asp:Button runat="server" ID="ButtonLoci" OnClick="ButtonLoci_Click" CssClass="nav-link bg-secundary" Text="Loci" />
                        </li>
                       
                    </ul>
                    </div>
                </div>
                <div class="table-responsive"  id="tabla1a"  runat="server" visible="true">
                <table id="table1" class="table table-sm table-striped  text-md-nowrap border" >
                    <thead style="background-color: #565A5D; color: white">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="7">Información muestra</th>
                            <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                            <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>Observaciones</th>
                            <th style="color: white; background: #565A5D;">ID Muestra</th>
                            <th style="color: white; background: #565A5D;">Organismo</th>
                            <th style="color: white; background: #565A5D;">Especie</th>
                            <th style="color: white; background: #565A5D;">Tipo muestra</th>
                            <th style="color: white; background: #565A5D;">Estado</th>
                            <th style="color: white; background: #565A5D;">Rango</th>
                            <th style="color: white; background: #565A5D;">Secuencia interés</th>
                            <th style="color: white; background: #565A5D;">Nombre Forward</th>
                            <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                            <th style="color: white; background: #565A5D;">Nombre Reverse</th>
                            <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                            <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>
                            <th style="color: white; background: #565A5D;">#Loci</th>
                            <th style="color: white; background: #565A5D;">Tamaño (pb)</th>
                            <th style="color: white; background: #565A5D;">Nombre set </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="tbanexo1a">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div>
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck">
                                                            <asp:CheckBox ID="ch_DetalleServicio" runat="server" />
                                                            <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control  " ID="txtobservacion"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label11" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Label10" Text='<%# Eval("NOMBRE_FORWARD") %>' runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" Text='<%# Eval("SECUENCIA_FORWARD_5_3") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label12" Text='<%# Eval("NOMBRE_REVERSE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" Text='<%# Eval("SECUENCIA_REVERESE_5_3") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" Text='<%# Eval("LOCI") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" Text='<%# Eval("TAMAÑO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                    </div>
            
             <%--Tabla Loci--%>

                                 <div class="card-footer text-center">
                                <div class="table-responsive" runat="server" visible="false" id="TablaLoci">
                                    <table id="tableS" class="table table-sm table-striped  text-md-nowrap border">
                                        <thead style="background-color: #565A5D; color: white">
                                            <tr class="text-center">
                                                <th style="background-color: #808B96; color: white;" colspan="10">Análisis de Fragmentos - Loci(Genes)</th>
                                            </tr>
                                            <tr>
                                                <th style="color: white; background: #565A5D;">Especie</th>
                                                <th style="color: white; background: #565A5D;">Nombre set</th>
                                                <th style="color: white; background: #565A5D;">Locus</th>
                                                <th style="color: white; background: #565A5D;">Nombre Primer/Cebador</th>
                                                <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                                                <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                                                <th style="color: white; background: #565A5D;">Motivo de repetición</th>
                                                <th style="color: white; background: #565A5D;">Rango alélico</th>
                                                <th style="color: white; background: #565A5D;">Marcaje Fluorescente</th>
                                                <th style="color: white; background: #565A5D;">Observaciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="tbLoci">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label11" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                                        </td>
                                                         <td>
                                                            <asp:Label ID="Label14" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="txtestado" Text='<%# Eval("LOCUS") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label2" Text='<%# Eval("NOMBRE_PRIMER") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" Text='<%# Eval("SEC_FORWARD_LOCI") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" Text='<%# Eval("SEC_REVERSE_LOCI") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label10" Text='<%# Eval("MOTIVO_REPETICION") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" Text='<%# Eval("RANGO_ALELICO") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label12" Text='<%# Eval("MARCAJE_FLUORECENTE") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label13" Text='<%# Eval("OBSERVACIONES") %>' runat="server"></asp:Label>
                                                        </td>
                                                       
                                                        
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
            </div>

            <div runat="server" id="divAnexo1b" class="table-responsive">
                <p>Anexo 1b</p>
                <table id="table1b" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D; color: white">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="11">Información muestra</th>
                            <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                            <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>Observaciones</th>
                            <th style="color: white; background: #565A5D;">Plato</th>
                            <th style="color: white; background: #565A5D;">Pozo</th>
                            <th style="color: white; background: #565A5D;">ID Muestra</th>
                            <th style="color: white; background: #565A5D;">Organismo</th>
                            <th style="color: white; background: #565A5D;">Especie</th>
                            <th style="color: white; background: #565A5D;">Tipo muestra</th>
                            <th style="color: white; background: #565A5D;">Estado</th>
                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                            <th style="color: white; background: #565A5D;">Volumen (uL)</th>
                            <th style="color: white; background: #565A5D;">Rango</th>
                            <th style="color: white; background: #565A5D;">Secuencia interés</th>
                            <th style="color: white; background: #565A5D;">Nombre Forward</th>
                            <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                            <th style="color: white; background: #565A5D;">Nombre Reverse</th>
                            <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                            <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>
                            <th style="color: white; background: #565A5D;">#Loci</th>
                            <th style="color: white; background: #565A5D;">Tamaño (pb)</th>
                            <th style="color: white; background: #565A5D;">Nombre set </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="tbanexo1b">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div>
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck1b">
                                                            <asp:CheckBox ID="ch_DetalleServicio1b" runat="server" />
                                                            <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck1b" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" Text='<%# Eval("PLATO")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label11" Text='<%# Eval("POZO")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label15" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label12" Text='<%# Eval("CONC")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" Text='<%# Eval("VOLUMEN")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" Text='<%# Eval("NOMBRE_FORWARD") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label14" Text='<%# Eval("SECUENCIA_FORWARD_5_3") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" Text='<%# Eval("NOMBRE_REVERSE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label17" Text='<%# Eval("SECUENCIA_REVERESE_5_3") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" Text='<%# Eval("LOCI") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" Text='<%# Eval("TAMAÑO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div runat="server" id="divAnexo2" class="table-responsive">
                <p>Anexo 2</p>
                <table id="table2" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D; color: white">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="6">Información muestra</th>
                            <th style="background-color: #808B96; color: white;" colspan="6">Secuenciación</th>
                        </tr>
                        <tr class="small form-control-sm">
                            <th></th>
                            <th>Observaciones</th>
                            <th style="color: white; background: #565A5D;">Plato</th>
                            <th style="color: white; background: #565A5D;">Pozo</th>
                            <th style="color: white; background: #565A5D;">ID Muestra</th>

                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                            <th style="color: white; background: #565A5D;">Rango</th>
                            <th style="color: white; background: #565A5D;">Secuencia interés</th>
                            <th style="color: white; background: #565A5D;">Nombre</th>
                            <th style="color: white; background: #565A5D;">Secuencia (5´-3´)</th>
                            <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="tbanexo2">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div>
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck2">
                                                            <asp:CheckBox ID="ch_DetalleServicio2" runat="server" />
                                                            <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck2" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" Text='<%# Eval("PLATO")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label11" Text='<%# Eval("POZO")%>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                    </td>


                                    <td>
                                        <asp:Label ID="Label12" Text='<%# Eval("CONC")%>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" Text='<%# Eval("SECUENCIA_5_3") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div runat="server" id="divAnexo3" class="table-responsive">
                <p>Anexo 3</p>
                <table id="table3" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D;">
                        <tr class="text-center">
                            <th style="background-color: #808B96; color: white;" colspan="12">Análisis de Fragmentos - Productos PCR</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>Observaciones</th>
                            <th style="color: white; background: #565A5D;">Nombre Plato</th>
                            <th style="color: white; background: #565A5D;">Pozo</th>
                            <th style="color: white; background: #565A5D;">ID muestra</th>
                            <th style="color: white; background: #565A5D;">Estado</th>
                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                            <th style="color: white; background: #565A5D;">Volumen (uL)</th>
                            <th style="color: white; background: #565A5D;">Marcaje Fluorescente</th>
                            <th style="color: white; background: #565A5D;">Marcador de Peso</th>
                            <th style="color: white; background: #565A5D;">Tamaño producto PCR (pb)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="tbanexo3">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div>
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck3">
                                                            <asp:CheckBox ID="ch_DetalleServicio3" runat="server" />
                                                            <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck3" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("NOMBRE_PLATO")%>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label1" Text='<%# Eval("POZO") %>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="txtestado" Text='<%# Eval("ID_MUESTRA") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" Text='<%# Eval("CONC") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" Text='<%# Eval("VOLUMEN") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" Text='<%# Eval("MARCAJE_FLUORESCENTE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" Text='<%# Eval("MARCADOR_PESO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" Text='<%# Eval("TAMA_PRODUCTO_PCR") %>' runat="server"></asp:Label>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <div runat="server" id="divAnexo4" class="table-responsive">
                <p>Anexo 4</p>
                <table id="table4" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D;">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="6">Información muestra</th>
                            <th style="background-color: #D5D8DC; color: white;" colspan="2">Ácidos Nucleicos</th>
                            <th style="background-color: #B2BABB; color: white;" colspan="2">Información reacción</th>
                            <th style="background-color: #808B96; color: white;" colspan="5">Información Primers/Cebadores</th>

                        </tr>

                        <tr>
                            <th></th>
                            <th>Observaciones</th>
                            <th style="color: white; background: #565A5D;">ID Muestra</th>
                            <th style="color: white; background: #565A5D;">Organismo</th>
                            <th style="color: white; background: #565A5D;">Tipo muestra</th>
                            <th style="color: white; background: #565A5D;">Estado</th>
                            <th style="color: white; background: #565A5D;">Método extracción</th>
                            <th style="color: white; background: #565A5D;">Purificación</th>
                            <th style="color: white; background: #565A5D;">Tamaño producto (pb)</th>
                            <th style="color: white; background: #565A5D;">T°C alineamiento</th>
                            <th style="color: white; background: #565A5D;">Nombre</th>
                            <th style="color: white; background: #565A5D;">Secuencia Forward</th>
                            <th style="color: white; background: #565A5D;">Secuencia Reverse</th>
                            <th style="color: white; background: #565A5D;">Concentración (ng/uL) </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="tbanexo4">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div>
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" OnCommand="btnCheck_Command" CommandArgument='<%#Eval("ID")%>' ID="btnCheck4">
                                                            <asp:CheckBox ID="ch_DetalleServicio4" runat="server" />
                                                            <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>

                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck4" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
                                    <td>
                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" Text='<%# Eval("METODO_EXTRA") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" Text='<%# Eval("PURIFICACION") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" Text='<%# Eval("TAMA_PRODUCTO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" Text='<%# Eval("ALINEAMIENTO") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" Text='<%# Eval("FORWARD") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" Text='<%# Eval("REVERSE") %>' runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" Text='<%# Eval("CONCENTRACION") %>' runat="server"></asp:Label>
                                    </td>


                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>




    </asp:Panel>

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
