<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Entrada_Articulos.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.Entrada.Entrada_Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-title">
        <div class="row">
            <div class="col-md-10">
                <div class="mb-0 mb-lg-0 mb-xl-0">
                    <h4 class="mb-2">Artículos</h4>
                    <div class="main-content-breadcrumb"><span>Entrada de Artículos</span>  </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-0 mb-lg-12 mb-xl-12">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary" data-toggle="tooltip" title="Nuevo" OnClick="lbn_NuevoArticulo_Click" ID="lbn_NuevoArticulo"><i class="fa fa-plus"> Nueva entrada</i></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAtrasDetalle" Visible="false" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>
                </div>
            </div>
        </div>

    </div>

    <asp:Panel ID="panelArticulosCreados" runat="server">
        <div runat="server" id="divSolicitudes">
            <div class="card">
                <div class="card-header">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="tableS" class="table table-striped border   form-control-sm">
                                <thead>
                                    <tr>
                                        <th>Concepto o Factura</th>
                                        <th>ARTICULO</th>
                                        <th>Tipo de entrada</th>
                                        <th>Fecha</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="tbEntradas">
                                        <ItemTemplate>
                                            <tr>

                                                <td>
                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                    <asp:Label ID="TemaDiscu" Text='<%# Eval("NUMERO_DOCUMENTO")%>' runat="server"></asp:Label>
                                                </td>

                                                
                                                <td>

                                                    <asp:Label ID="Label2" Text='<%# Eval("ARTICULO")%>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="Label1" Text='<%# Eval("TIPO_ENTRADA") %>' runat="server"></asp:Label>
                                                </td>

                                                <td>
                                                    <asp:Label ID="txtestado" Text='<%# Eval("FECHA") %>' runat="server"></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <div class=" text-center">
                                                        <asp:LinkButton runat="server" CssClass="btn  btn-success" ID="btnVerdetalles" data-toggle="tooltip" title="Ver detalles" OnCommand="btnVerdetalles_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-eye"></i></asp:LinkButton>
                                                        <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="Btnimprimir" data-toggle="tooltip" title="Imprimir" OnCommand="Btnimprimir_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-print"></i></asp:LinkButton>

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
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Comprobante *</span> </div>
                                    <asp:DropDownList runat="server" ID="txtcomprobante" class="form-control select2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtcomprobante" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Tipo de entrada *</span> </div>
                                    <asp:DropDownList runat="server" ID="txttipoentrada" class="form-control select2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txttipoentrada" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Concepto o # Factura *</span> </div>
                                    <asp:TextBox runat="server" ID="txtfactura" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Factura" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtfactura" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Fecha de Entrada *</span> </div>
                                    <asp:TextBox runat="server" TextMode="Date" ID="txtfechaentrada" aria-describedby="basic-addon1" aria-label="Username" class="form-control" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtfechaentrada" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-body ">
                    <hr class="m-0" />
                    <div class="pd-15  bg-gray-200 small formlayout">
                        <div class="row row-sm">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <asp:TextBox type="text" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtbuscarArticulo_TextChanged" ID="txtbuscarArticulo" placeholder="Nombre del articulo ..."></asp:TextBox>

                                    <asp:Label runat="server" OnClick="Unnamed_Click" class="btn  btn-primary" ID="BtnbuscarArt">Buscar</asp:Label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <asp:Panel runat="server" ID="panelbuscarArticulos" Visible="false" ScrollBars="Auto" Width="100%" Height="150px">
                                    <small>Seleccinar articulo</small>
                                    <hr class="m-1" />
                                    <asp:GridView ID="tbArticulos" CssClass="table  text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm" EnableViewState="true" ShowHeader="false" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="tbArticulos_SelectedIndexChanged" BorderColor="Transparent" runat="server">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-CssClass="m-0 text-black">
                                                <ItemTemplate>
                                                    <asp:Label Visible="false" ID="txtid" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>
                                                    <div>
                                                        <asp:Label ID="txtnombreart" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class=" text-center">
                                                        <asp:LinkButton runat="server" CssClass="btn small btn-sm  btn-success" ID="btnSeleccionar" data-toggle="tooltip" title="Seleccionar" CommandName="Select"><i class="fa fa-check"></i></asp:LinkButton>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />
                                    </asp:GridView>
                                </asp:Panel>

                                <asp:Panel runat="server" ID="panelArtSeleccionado" Visible="false">
                                    <div class="card bg-white border-info border-top border-right  shadow ">

                                        <div class=" shadow-sm  border border-white form-control m-0 rounded">
                                            <asp:Label runat="server" ID="txtArtSeleccionado"></asp:Label>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row row-sm">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Cantidad *</span> </div>
                                    <asp:TextBox runat="server" TextMode="Number" ID="txtcantidad" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Cantidad" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtcantidad" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Valor unitario *</span> </div>
                                    <asp:TextBox runat="server" ID="txtvalorunitario" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Valor unitario" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtvalorunitario" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Fecha vencimiento *</span> </div>
                                    <asp:TextBox runat="server" ID="txtfechavencimiento" TextMode="Date" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Vencimiento" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtfechavencimiento" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Lote *</span> </div>
                                    <asp:TextBox runat="server" ID="txtlote" aria-describedby="basic-addon1" aria-label="Username" class="form-control" placeholder="Lote" type="text" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                        ControlToValidate="txtlote" Display="Dynamic" ForeColor="Red"
                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row row-sm">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Observaciones</span> </div>
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtobservaciones" aria-describedby="basic-addon1" aria-label="Username" class="form-control " type="text" />

                                </div>
                            </div>

                            <div class=" col-md-6">
                                <div class="form-group">
                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Total Entrada</span> </div>
                                    <asp:TextBox ID="txtvalortotalentrada" Enabled="false" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 text-center">
            <asp:LinkButton runat="server" ID="btnAgregar" ValidationGroup="CrearArticulo" OnClick="btnAgregar_Click" class="btn btn-primary btn-rounded "> <i class="fa fa-arrow-down"></i> Agregar
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" class="btn btn-success btn-rounded ">
            </asp:LinkButton>
        </div>
    </asp:Panel>


    <hr />
    <asp:GridView ID="TablaAgregar" runat="server" OnRowDeleting="TablaAgregar_RowDeleting" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NOMBRE" ItemStyle-CssClass="small" HeaderText="Articulo" ReadOnly="True" SortExpression="NOMBRE" />
            <asp:BoundField DataField="CANTIDAD" ItemStyle-CssClass="small" HeaderText="Cantidad" ReadOnly="True" SortExpression="CANTIDAD" />
            <asp:BoundField DataField="VALOR_UNITARIO" ItemStyle-CssClass="small" HeaderText="Valor Unitario" ReadOnly="True" SortExpression="VALOR_UNITARIO" />
            <asp:BoundField DataField="VALOR_TOTAL" ItemStyle-CssClass="small" HeaderText="Valor Total" ReadOnly="True" SortExpression="VALOR_TOTAL" />
            <asp:BoundField DataField="LOTE" ItemStyle-CssClass="small" HeaderText="Lote" ReadOnly="True" SortExpression="LOTE" />
            <asp:BoundField DataField="FECHA_VENCIMIENTO" ItemStyle-CssClass="small" HeaderText="Fecha Vencimiento" ReadOnly="True" SortExpression="FECHA_VENCIMIENTO" />
            <asp:BoundField DataField="OBSERVACIONES" ItemStyle-CssClass="small" HeaderText="Observaciones" ReadOnly="True" SortExpression="OBSERVACIONES" />
            <asp:TemplateField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                <ItemTemplate>
                    <div class="text-center">
                        <asp:LinkButton runat="server" OnClientClick="if (!window.confirm('Desea eliminar el servicio seleccionado?')) return false;" ToolTip="Eliminar" CssClass="btn btn-outline-danger btn-sm" CommandName="delete"><i class='fa fa-trash'></i> Eliminar </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />

    </asp:GridView>



    <div allowoutsideclick: false class="modal fade" id="detalle" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Detalles de la entrada</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <div class="modal-body">
                    <asp:GridView ID="tablaconsultar" runat="server" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ARTICULO" ItemStyle-CssClass="small" HeaderText="Articulo" ReadOnly="True" SortExpression="ARTICULO" />
                            <asp:BoundField DataField="CANTIDAD" ItemStyle-CssClass="small" HeaderText="Cantidad" ReadOnly="True" SortExpression="CANTIDAD" />
                            <asp:BoundField DataField="VALOR_UNITARIO" ItemStyle-CssClass="small" DataFormatString="{0:n}" HeaderText="Vlr. Unitario" ReadOnly="True" SortExpression="VALOR_UNITARIO" />
                            <asp:BoundField DataField="VALOR_TOTAL" ItemStyle-CssClass="small" DataFormatString="{0:n}" HeaderText="Vlr. Total" ReadOnly="True" SortExpression="VALOR_TOTAL" />
                            <asp:BoundField DataField="LOTE" ItemStyle-CssClass="small" HeaderText="Lote" ReadOnly="True" SortExpression="LOTE" />
                            <asp:BoundField DataField="FECHA_VENCIMIENTO" ItemStyle-CssClass="small" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Fecha vencimiento" ReadOnly="True" SortExpression="FECHA_VENCIMIENTO" />
                        </Columns>
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function Modaldetalle() {
            $('#detalle').modal('show');
        }
    </script>
</asp:Content>
