<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Metodos.aspx.cs" Inherits="Educacion.Educacion.Aplicacion.Pagina.Configuracion.Metodos.Metodos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="table-responsive">
        <div class="switcher-wrapper ">
            <div runat="server" visible="false" id="banerLateral">
                <div runat="server" id="divBotonCerrar" visible="false" class="demo-icon">
                    <asp:LinkButton CssClass="btn btn-danger" runat="server" data-toggle="tooltip" title="Cerrar" ID="btnCerrarBaner" OnClick="btnCerrarBaner_Click" Text="<i class='fa fa-times-circle text_primary'></i>"></asp:LinkButton>

                </div>
                <div class="form_holder sidebar-right1 ps">

                    <div class="card card-info">


                        <div class="card-header pb-0">


                            <div class="row">
                                <div class="col-md-11">
                                    <label class="text-danger">Detalle Servicio:</label>

                                    <h5 class="card-title mb-0 pb-0">
                                        <asp:Label runat="server" ID="lblNombreDetalleServicio"></asp:Label></h5>
                                </div>
                                <div class="text-right col-md-1">
                                    <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

                                </div>
                            </div>


                        </div>

                        <div class="card-body text-info">


                            <div class="pd-15  bg-gray-200 small formlayout">
                                <div class="row row-sm">

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="card order-list">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <asp:Panel ID="panelArticulosCreados" runat="server">
                                                        <div runat="server" visible="true" id="divSolicitudes">
                                                            <div class="card">
                                                                <div class="card-header">
                                                                    <div class="card-body">
                                                                        <div class="table-responsive">
                                                                            <asp:Panel ID="Panel1" Width="100%" Height="480px" ScrollBars="Auto" runat="server">

                                                                                <table id="tableS" class="table-responsive-sm table-striped border  form-control-sm" style="color: #686A6B;">
                                                                                    <thead>
                                                                                        <tr>

                                                                                            <th></th>
                                                                                            <th style="width: 5px">DESCRIPCION Artículo</th>

                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <asp:Repeater runat="server" ID="tbArticulos">
                                                                                            <ItemTemplate>
                                                                                                <tr>
                                                                                                    <td class="text-center">
                                                                                                        <div class=" text-left">
                                                                                                            <asp:LinkButton runat="server" CssClass="btn  btn-success btn-sm" ID="btnSeleccionar" OnCommand="btnSeleccionar_Command" data-toggle="tooltip" title="Seleccionar" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-check-circle-o"></i></asp:LinkButton>
                                                                                                            <%--                                                                                        <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh"></i></asp:LinkButton>--%>
                                                                                                        </div>
                                                                                                    </td>

                                                                                                    <td style="width: 5px">
                                                                                                        <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                                                                        <asp:Label ID="TemaDiscu" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                                                                                                    </td>



                                                                                                </tr>
                                                                                            </ItemTemplate>
                                                                                        </asp:Repeater>
                                                                                    </tbody>
                                                                                </table>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                                        <div class="card order-list">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                        <div class="card card-warning">
                                                            <div class="card-body text-warning">
                                                                <label class="text-danger">Nombre Artículo:</label>
                                                                <asp:Label runat="server" Text="No se ha seleccionado un Artículo" ID="lblNombreArticulo"></asp:Label>
                                                            </div>
                                                            <div class="card-header pb-0">
                                                                <div class="row row-sm">
                                                                    <div class="col-lg-6">
                                                                        <div class="form-group">
                                                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Cantidad *</span> </div>
                                                                            <asp:TextBox runat="server" ID="txtCantidad" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Cantidad" type="text" />
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                                ControlToValidate="txtCantidad" Display="Dynamic" ForeColor="Red"
                                                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-6 ">
                                                                        <asp:LinkButton runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="CrearArticulo" class="btn btn-primary btn-rounded "> <i class="fa fa-arrow-down"></i> Agregar
                                                                        </asp:LinkButton>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer">

                                                                <div class="table-responsive">
                                                                    <asp:Panel ID="Panel" Width="100%" Height="280px" ScrollBars="Auto" runat="server">

                                                                        <table id="tableSa" class="table-responsive-sm table-striped border  form-control-sm" style="color: #686A6B;">
                                                                            <thead>
                                                                                <tr>

                                                                                    <th></th>
                                                                                    <th>DESCRIPCION Artículo</th>
                                                                                    <th>CANTIDAD</th>
                                                                                    <th>Estado</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>

                                                                                <asp:Repeater runat="server" ID="RepeaterArticulos">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td class="text-center">
                                                                                                <div class=" text-left">
                                                                                                    <asp:LinkButton runat="server" CssClass="btn  btn-success btn-sm" ID="btnEditar" data-toggle="tooltip" title="Editar" OnCommand="btnEditar_Command_" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-pencil"></i></asp:LinkButton>
                                                                                                    <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" OnCommand="lbn_EstadoT_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh"></i></asp:LinkButton>

                                                                                                </div>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                                                                                            </td>

                                                                                            <td>
                                                                                                <asp:Label ID="Label1" Text='<%# Eval("CANTIDAD") %>' runat="server"></asp:Label>
                                                                                            </td>

                                                                                            <td>
                                                                                                <asp:Label ID="txtestado" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                                                            </td>


                                                                                        </tr>
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </tbody>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-x" style="left: 0px; top: 0px;">
                                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                                        </div>
                                        <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="header-title">
        <div class="row">
            <div class="col-md-10">
                <div class="mb-0 mb-lg-0 mb-xl-0">
                    <h4 class="mb-2">Configuración</h4>
                    <div class="main-content-breadcrumb"><span>Metodos de Procesamiento</span>  </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="mb-0 mb-lg-12 mb-xl-12">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="BtnNuevo_Click" data-toggle="tooltip" title="Nuevo" ID="BtnNuevo"><i class="fa fa-plus"> Nuevo Metodo</i></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAtras" OnClick="btnAtras_Click" Visible="false" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>
                </div>

            </div>
        </div>
    </div>

    <div runat="server" visible="true" id="divConsultarMetodos">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableSt" class="table table-striped border   form-control-sm" style="color: #686A6B;">
                            <thead>
                                <tr>
                                    <th style="color: black">Metodo</th>
                                    <th style="color: black">Observaciones</th>
                                    <th style="color: black">Estado</th>
                                    <th style="color: black">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="RepeterMetodos">
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("METODO")%>' runat="server"></asp:Label>
                                            </td>

                                            <td style="max-height: 50px; overflow: hidden;">
                                                <asp:Label ID="Label1" Text='<%# Eval("OBSERVACIONES") %>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label3" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                            </td>

                                            <td class="text-center">
                                                <div class=" text-left">

                                                    <div class="text-center">
                                                        <asp:UpdatePanel ID="UpdatePanelAso" runat="server">
                                                            <ContentTemplate>
                                                                <asp:LinkButton runat="server" ID="btnEditar" data-toggle="tooltip" title="Editar" OnCommand="btnEditar_Command" CommandArgument='<%#Eval("ID")%>' CssClass="btn btn-outline-success btn-sm"><i class="fa fa-pencil-square fa-2x"></i></asp:LinkButton>

                                                                <asp:LinkButton runat="server" ID="btnAsociarArtoculo" OnCommand="btnAsociarArtoculo_Command" CommandArgument='<%#Eval("ID")%>' ToolTip="Asociar Artículos" CssClass="btn btn-outline-warning btn-sm"><i class='fa fa-braille'></i> Asociar</asp:LinkButton>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btnAsociarArtoculo" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>
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

    <div runat="server" visible="false" id="divNuevoMetodo">
        <div class="main-content-body">
            <div class="row row-sm">
                <div class="col-md-12 col-lg-12 col-xl-12">
                    <div class="ecommerce-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <b>Metodo*:</b>
                                            <div class="small-group">
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txtnombreMetodo" class="form-control small  form-control-sm" type="text" required="true" placeholder="Ingrese el nombre del metodo " />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                        <div class="form-group">
                                            <p></p>
                                            <label class="custom-switch">
                                                <input type="checkbox" runat="server" checked="checked" id="checActivo" name="custom-switch-checkbox1" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Activo</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                        <div class="form-group">
                                            <p></p>
                                            <label class="custom-switch">
                                                <input type="checkbox" runat="server" checked="checked" id="ChecTermico" name="custom-switch-checkbox1" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Perfil Térmico</span></label>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <b>Observaciones:</b>
                                            <div class="small-group">
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" TextMode="MultiLine" Rows="3" ID="txtobservaciones" class="form-control multiline small  form-control-sm" type="text" required="true" placeholder="Observaciones " />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr />

                                    <div class="col-xs-12 col-sm-12" style="margin-bottom: 1%">
                                        <b>Procolos</b>
                                        <div class="form-group " style="text-align: center;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<span class='badge rounded-pill bg-danger text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Seleccione un Documento</span>"
                                                ControlToValidate="files" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="AdjuntosFile"></asp:RequiredFieldValidator>
                                            <asp:FileUpload ID="files" Multiple="Multiple" AllowMultiple="true" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                            <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                                ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                ValidationExpression="^.+\.(pdf)$" ValidationGroup="AdjuntosFile" ControlToValidate="files" />
                                            <br />

                                        </div>
                                    </div>

                                    <div class="col-md-12 text-center">
                                        <asp:LinkButton runat="server" ID="Btnguardar" OnClick="Btnguardar_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Guardar </asp:LinkButton>
                                    </div>


                                    <div runat="server" class="col-md-12" visible="false" id="divAdjuntos">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-body">
                                                    <b>Protocolos Configurados</b>
                                                    <div class="table-responsive">
                                                        <table id="tableS" class="table table-striped border    form-control-sm">
                                                            <thead>
                                                                <tr>

                                                                    <th>Nombre Archivo</th>

                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater runat="server" ID="AdjuntosRepeter">
                                                                    <ItemTemplate>
                                                                        <tr>

                                                                            <td>

                                                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("realname")%>' runat="server"></asp:Label>
                                                                            </td>


                                                                            <td class="text-center">
                                                                                <div class=" text-left">

                                                                                    <asp:LinkButton runat="server" ID="btnEliminar" data-toggle="tooltip" title="Eliminar Adjunto" OnCommand="btnEliminar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-danger"><i class="fa fa-trash-o fa-1x"></i></asp:LinkButton>
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
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
