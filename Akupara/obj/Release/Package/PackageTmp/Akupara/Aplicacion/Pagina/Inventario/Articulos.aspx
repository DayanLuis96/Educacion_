<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <div class="header-title">
        <div class="row">
            <div class="col-md-10">
                <div class="mb-0 mb-lg-0 mb-xl-0">
                    <h4 class="mb-2">Artículos</h4>
                    <div class="main-content-breadcrumb"><span>Gestionar Artículos</span>  </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-0 mb-lg-12 mb-xl-12">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary" data-toggle="tooltip" title="Nuevo" OnClick="lbn_NuevoArticulo_Click" ID="lbn_NuevoArticulo"><i class="fa fa-plus"> Nuevo Artículo</i></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAtrasDetalle" Visible="false" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>
                </div>
            </div>
        </div>



    </div>

    <asp:Panel ID="panelArticulosCreados" runat="server">
        <div runat="server" visible="true" id="divSolicitudes">
            <div class="card">
                <div class="card-header">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="tableS" class="table table-striped border   form-control-sm">
                                <thead>
                                    <tr>

                                        <th>DESCRIPCION Artículo</th>
                                        <th>CATEGORIA</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="tbArticulos">
                                        <ItemTemplate>
                                            <tr>

                                                <td>
                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                    <asp:Label ID="TemaDiscu" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="Label1" Text='<%# Eval("CATEGORIA") %>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="txtestado" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <div class=" text-left">
                                                        <asp:LinkButton runat="server" CssClass="btn  btn-success" ID="btnEditar" data-toggle="tooltip" title="Editar" OnCommand="btnEditar_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-pencil"></i></asp:LinkButton>
                                                        <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" OnCommand="lbn_EstadoT_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh"></i></asp:LinkButton>

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
    </asp:Panel>

    <asp:Panel ID="panelNuevoArticulo" runat="server" Visible="false">
        <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
            <div class="card">
                <div class="card-body ">
                    <hr class="m-0" />
                    <div class="pd-15  bg-gray-200 small formlayout">
                        <div class="row row-sm">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre Artículo *</span> </div>
                                    <asp:TextBox runat="server" ID="txtNombreArticulo" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Nombre Artículo" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtNombreArticulo" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Categoría  *</span> </div>
                                    <asp:DropDownList runat="server" ID="ddlCategoria" class="form-control select2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="ddlCategoria" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon22">Unidad Medida</span> </div>
                                    <asp:DropDownList runat="server" ID="ddlUnidadMedida" class="form-control" />

                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon3">Cantidad</span> </div>
                                    <asp:TextBox runat="server" ID="txtcantidad" aria-describedby="basic-addon1" aria-label="Username" min="0" class="form-control" placeholder="Cantidad" type="number" />

                                </div>
                            </div>


                            <div class="col-lg-12">
                                <div class="form-group">

                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon5">Observaciones</span> </div>
                                    <asp:TextBox runat="server" ID="txtObservaciones" aria-describedby="basic-addon1" TextMode="MultiLine" Rows="4" aria-label="Username" class="form-control" placeholder="Observaciones" type="text" />
                                    

                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-12 text-center">
            <asp:LinkButton runat="server" ID="btnGuardar" ValidationGroup="CrearArticulo" OnCommand="btnGuardar_Command" class="btn btn-success btn-rounded ">
            </asp:LinkButton>
        </div>
    </asp:Panel>

</asp:Content>
