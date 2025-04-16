<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="BajaArticulo.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.Baja.BajaArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-title">
        <div class="row">
            <div class="col-md-10">
                <div class="mb-0 mb-lg-0 mb-xl-0">
                    <h4 class="mb-2">Artículos</h4>
                    <div class="main-content-breadcrumb"><span>Baja de Artículos</span>  </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-0 mb-lg-12 mb-xl-12">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary" data-toggle="tooltip" title="Nuevo" OnClick="lbn_NuevoArticulo_Click" ID="lbn_NuevobajaArticulo"><i class="fa fa-plus"> Nueva Baja</i></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAtrasDetalle" Visible="false" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>
                </div>
            </div>
        </div>

    </div>
    <asp:Panel ID="panelArticulosbajas" runat="server">
        <div runat="server" id="divSolicitudes">
            <div class="card">
                <div class="card-header">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="tableS" class="table table-striped border   form-control-sm">
                                <thead>
                                    <tr>
                                        <th>ARTICULO</th>
                                        <th>LOTE</th>
                                        <th>CANTIDAD_BAJA</th>
                                        <th>FECHA_BAJA</th>
                                        <th>USUARIO</th>
                                        <%--                                        <th>Acciones</th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="tbbAJAS">
                                        <ItemTemplate>
                                            <tr>

                                                <td>
                                                    <%--                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>--%>

                                                    <asp:Label ID="TemaDiscu" Text='<%# Eval("ARTICULO")%>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="Label1" Text='<%# Eval("LOTE") %>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="txtestado" Text='<%# Eval("CANTIDAD_BAJA") %>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="FECHA_BAJA" Text='<%# Eval("FECHA_BAJA") %>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="USUARIO" Text='<%# Eval("USUARIO") %>' runat="server"></asp:Label>
                                                </td>
                                                <%--<td class="text-center">
                                                    <div class=" text-center">
                                                        <asp:LinkButton runat="server" CssClass="btn  btn-success" ID="btnVerdetalles" data-toggle="tooltip" title="Ver detalles" OnCommand="btnVerdetalles_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-eye"></i></asp:LinkButton>
                                                        <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="Btnimprimir" data-toggle="tooltip" title="Imprimir" OnCommand="Btnimprimir_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-print"></i></asp:LinkButton>

                                                    </div>
                                                </td>--%>
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
    <asp:Panel ID="panelNuevoBajaArticulo" runat="server" Visible="false">
        <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">

            <div class="card">
                <div class="card-body ">
                    <hr class="m-0" />
                    <div class="pd-15  bg-gray-200 small formlayout">
                        <div class="row row-sm">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Comprobante *</span> </div>
                                    <asp:DropDownList runat="server" ID="txtcomprobante" class="form-control select2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtcomprobante" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="GuardarBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Tipo de Baja *</span> </div>
                                    <asp:DropDownList runat="server" ID="txttipoBaja" class="form-control select2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txttipoBaja" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="GuardarBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-4">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Fecha de Baja *</span> </div>
                                    <asp:TextBox runat="server" TextMode="Date" ID="txtfechaentrada" aria-describedby="basic-addon1" aria-label="Username" class="form-control" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtfechaentrada" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="GuardarBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-body ">
                    <hr class="m-0" />
                    <asp:Panel ID="Panelarticulos" runat="server">

                        <div class="text-center">
                            <div class="card-body text-warning">
                                <label class="text-danger">Nombre Artículo:</label>
                                <asp:Label runat="server" Text="No se ha seleccionado un Artículo" ID="lblNombreArticulo"></asp:Label>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtbuscarArticulo" OnTextChanged="txtbuscarArticulo_TextChanged" placeholder="Nombre del articulo" runat="server" CssClass=" form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-3">
                                                <asp:LinkButton runat="server" ID="btnbuscararticulo" CssClass="btn btn-primary" OnClick="btnbuscararticulo_Click" Text="Buscar Artículo"></asp:LinkButton>
                                            </div>

                                            <div class="col-md-3">
                                                <label>Existencia</label>
                                                <asp:Label ID="txtexistencia" Text="0" Font-Size="XX-Large" CssClass="text-bold text-blue" Enabled="false" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <asp:Panel runat="server" ID="paneltablaarticulos" Visible="false" ScrollBars="Auto" Height="300px">
                                            <asp:GridView ID="tbArticulos" runat="server" CssClass="mGrid" AutoGenerateColumns="False" Width="100%">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField>

                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="btnseleccionar" CssClass=" btn btn-success" CommandArgument='<%#Eval("ID")%>' OnCommand="btnseleccionar_Command" runat="server"><i class="fa fa-plus"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-CssClass="m-0 text-black">
                                                        <ItemTemplate>
                                                            <asp:Label Visible="false" ID="txtid" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>
                                                            <div>
                                                                <asp:Label ID="txtnombreart" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <br />
                            <hr />
                            <div class=" col-md-12">
                                <div class="form-group">
                                    <label>Nombre </label>
                                    <asp:TextBox ID="txtnombreArticulo" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtnombreArticulo" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="form-group">
                                    <label>Unidad Medida </label>
                                    <asp:TextBox ID="txtunidadmedid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class=" col-md-3">
                                <div class="form-group">
                                    <label>Cantidad Baja</label>
                                    <asp:TextBox ID="txtcantidad" CssClass="form-control" TextMode="Number" AutoPostBack="true" runat="server" Min="1" OnTextChanged="txtcantidad_TextChanged" Font-Size="XX-Large">0</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtcantidad" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class=" col-md-3">
                                <div class="form-group">
                                    <label>Lote </label>
                                    <asp:DropDownList ID="ddl_Lote" AutoPostBack="true" OnSelectedIndexChanged="txtlotee_SelectedIndexChanged" CssClass="form-control select2" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="ddl_Lote" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearBaja"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class=" col-md-3">
                                <div class="form-group">
                                    <label>Fecha Vencimiento </label>
                                    <asp:TextBox ID="txtfechavencimiento" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class=" col-md-12">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Observaciones </label>
                                        <asp:TextBox ID="txtobservacionesarticulo" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class=" col-md-12">
                                <div class="form-group text-center">
                                    <asp:LinkButton ID="LinkButton1" OnClick="btnagregar_Click" ValidationGroup="CrearBaja" CssClass="btn btn-primary" runat="server" Text="Agregar" />
                                    <asp:LinkButton ID="btnguardar" OnClick="btnguardar_Click" CssClass="btn btn-success" ValidationGroup="GuardarBaja" Text="<i class='fa fa-save'></i>&nbsp;&nbsp;Guardar" runat="server"></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box box-primary">
                                    <div class="box-body">
                                        <asp:Panel runat="server" Height="300px" ScrollBars="Auto">
                                            <asp:GridView ID="tablaentradaarticulos" runat="server" CssClass="mGrid" Width="100%" AutoGenerateColumns="False" OnRowDeleting="tablaentradaarticulos_RowDeleting">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="ID_ARTICULO" HeaderText="#" ReadOnly="True" SortExpression="ID_ARTICULO" />
                                                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ReadOnly="True" SortExpression="NOMBRE" />
                                                    <asp:BoundField DataField="UNIDAD_MEDIDA" HeaderText="Unidad Medida" ReadOnly="True" SortExpression="UNIDAD_MEDIDA" />
                                                    <asp:BoundField DataField="LOTE" HeaderText="Lote" ReadOnly="True" SortExpression="LOTE" />
                                                    <asp:BoundField DataField="CANTIDAD_TRASLADAR" HeaderText="Cantidad" ReadOnly="True" SortExpression="CANTIDAD_TRASLADAR" />
                                                    <asp:BoundField DataField="FECHA_VENCIMIENTO" HeaderText="Fecha Vencimiento" ReadOnly="True" SortExpression="FECHA_VENCIMIENTO" />
                                                    <asp:ButtonField CommandName="Delete" Text="<i class='fa fa-trash'></i>" ControlStyle-CssClass=" btn btn-outline-danger">
                                                        <ControlStyle CssClass=" btn btn-outline-danger" />
                                                    </asp:ButtonField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
