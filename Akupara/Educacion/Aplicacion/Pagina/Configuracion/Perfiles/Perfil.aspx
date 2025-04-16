<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Educacion.Educacion.Aplicacion.Pagina.Configuracion.Perfiles.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <h4 class="mb-2">Configuración</h4>
            <div class="main-content-breadcrumb"><span>Perfiles</span>  </div>
        </div>
    </div>
    <asp:Panel runat="server" ID="PanelPrincipal" Visible="true">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="main-content-body">
                    <div class="row row-sm">
                        <div class="col-md-12 col-lg-12 col-xl-12">
                            <div class="ecommerce-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <b>Perfil*:</b>
                                                    <div class="small-group">
                                                        <div class="input-group">
                                                            <asp:TextBox runat="server" ID="txtnombre" class="form-control small  form-control-sm" type="text" required="true" placeholder="Ingrese el nombre del perfil " />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                                <div class="form-group">
                                                    <p></p>
                                                    <label class="custom-switch">
                                                        <input type="checkbox" runat="server" id="checActivo" name="custom-switch-checkbox1" class="custom-switch-input">
                                                        <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Activo</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                                <asp:LinkButton runat="server" ID="Btnguardar" OnClick="Btnguardar_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Guardar </asp:LinkButton>
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
                        <div class="main-content-label mg-b-5">Perfiles configurados </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:GridView ID="tablaconsultar" runat="server" OnSelectedIndexChanged="tablaconsultar_SelectedIndexChanged" OnRowUpdating="tablaconsultar_RowUpdating" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="NOMBRE" ItemStyle-CssClass="small" HeaderText="Servicio" ReadOnly="True" SortExpression="NOMBRE" />
                                                <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="txtestado" Enabled="false" CssClass="rounded check-box rounded-bottom" Checked='<%# Bind("ACTIVO") %>'></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Editar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:LinkButton runat="server"  data-toggle="tooltip" title="Editar"  CommandName="Update"><i class='fa fa-pencil-square text-success fa-2x'></i> </asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Permisos" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">

                                                            <asp:UpdatePanel runat="server">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="btnPermisos" data-toggle="tooltip" title="Permisos" OnCommand="btnPermisos_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-lock text-danger fa-2x"></i></asp:LinkButton>

                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btnPermisos" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />

                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>



            </ContentTemplate>

        </asp:UpdatePanel>
    </asp:Panel>

    <asp:Panel runat="server" ID="PanelPermisosMenu" Visible="false">

        <div class="row">
            <div class="col-md-11">
                <p class="tx-12 text-muted mb-0"><span runat="server" id="nombrePerfilSpan" class="badge badge-secondary"></span></p>
            </div>
            <div class="col-md-1">
                <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

            </div>
        </div>

        <div class="row row-sm">

            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <div class="card order-list">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class=" pb-0">
                                <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Menú Principal)</span></p>
                            </div>
                            <table id="tableSolicitudes" class="table table-sm rouded shadow table-striped text-md-nowrap border table-sm">
                                <thead style="background-color: #565A5D;">
                                    <tr>

                                        <th>Nombre opción Menú</th>
                                        <th>Estado</th>
                                        <th>Activar/Desactivar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="DetalleMenu">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label Visible="false" ID="txtID" Text=' <%# Eval("id") %>' runat="server">
                                                    </asp:Label>
                                                    <asp:Label ID="lblNombre" Text='<%# Eval("nombre")%>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="lblEstado" Text='<%# Eval("estado") %>' runat="server"> </asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" OnCommand="lbn_EstadoT_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh fa-1x"></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" CssClass="btn btn-primary btn-lg" data-toggle="tooltip" OnCommand="lbn_HijosT_Command" title="Ver Detalles" ID="lbn_HijosT" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-outdent fa-1x"></i></asp:LinkButton>
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

            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <div class="card order-list">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class=" pb-0">
                                <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Detalle Menú)</span></p>
                            </div>
                            <table class="table table-sm rouded shadow table-striped text-md-nowrap border table-sm">
                                <thead style="background-color: #565A5D;">
                                    <tr>

                                        <th>Nombre opción Menú</th>
                                        <th>Estado</th>
                                        <th>Activar/Desactivar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="RepeaterHijosLateral">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("id") %>' runat="server">
                                                    </asp:Label>
                                                    <asp:Label ID="lblNombre" Text='<%# Eval("nombre")%>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="lblEstado" Text='<%# Eval("estado") %>' runat="server"> </asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoTHijoNivel1" OnCommand="lbn_EstadoTHijoNivel1_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh fa-1x"></i></asp:LinkButton>
                                                </td>


                                                <asp:Panel ID="panelHijo" runat="server" Visible="false">
                                                    <tr class="child">
                                                        <td class="child" colspan="4">
                                                            <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                                <div class="card card-warning">
                                                                    <div class="card order-list">
                                                                        <div class="card-body">
                                                                            <div class="table-responsive">
                                                                                <div class=" pb-0">
                                                                                    <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">( Menu Nivel2 con Detalle)</span></p>
                                                                                </div>
                                                                                <table class="table table-sm rouded shadow table-striped text-md-nowrap border table-sm">
                                                                                    <thead>
                                                                                        <tr>

                                                                                            <th style="color: #565A5D;">Nombre opción Menú</th>
                                                                                            <th style="color: #565A5D;">Estado</th>
                                                                                            <th style="color: #565A5D;">Activar/Desactivar</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <asp:Repeater runat="server" ID="RepeaterHijosLateralPadre">
                                                                                            <ItemTemplate>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("id") %>' runat="server">
                                                                                                        </asp:Label>
                                                                                                        <asp:Label ID="lblNombre" Text='<%# Eval("nombre")%>' runat="server"></asp:Label>
                                                                                                    </td>

                                                                                                    <td>
                                                                                                        <asp:Label ID="lblEstado" Text='<%# Eval("estado") %>' runat="server"> </asp:Label>
                                                                                                    </td>
                                                                                                    <td class="text-center">
                                                                                                        <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoTPadree" OnCommand="lbn_EstadoTPadree_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh fa-1x"></i></asp:LinkButton>
                                                                                                        <asp:LinkButton runat="server" CssClass="btn btn-primary btn-lg" data-toggle="tooltip" title="Ver Detalles" ID="lbn_HijosTP" OnCommand="lbn_HijosTP_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-outdent fa-1x"></i></asp:LinkButton>

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


                                                        </td>
                                                    </tr>
                                                </asp:Panel>

                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                            <asp:Panel runat="server" Visible="false" ID="panelHijoNivel2">

                                <div class="col-xl-12 col-lg-6 col-md-6 col-sm-12">
                                    <div class="card order-list">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <div class=" pb-0">
                                                    <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Detalle Menú Nivel2)</span></p>
                                                </div>
                                                <table class="table table-sm rouded shadow table-striped text-md-nowrap border table-sm">
                                                    <thead style="background-color: #565A5D;">
                                                        <tr>

                                                            <th>Nombre opción Menú</th>
                                                            <th>Estado</th>
                                                            <th>Activar/Desactivar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater runat="server" ID="RepeaterHijosLateralNivel2">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("id") %>' runat="server">
                                                                        </asp:Label>
                                                                        <asp:Label ID="lblNombre" Text='<%# Eval("nombre")%>' runat="server"></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Label ID="lblEstado" Text='<%# Eval("estado") %>' runat="server"> </asp:Label>
                                                                    </td>
                                                                    <td class="text-center">
                                                                        <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoTNivel2" OnCommand="lbn_EstadoTNivel2_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh fa-1x"></i></asp:LinkButton>
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

                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>

        </div>




    </asp:Panel>


</asp:Content>
