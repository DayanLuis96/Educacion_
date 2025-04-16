<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inventario.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.Inventario" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Inventario/InsumosNavg/DetalleInsumoAgregados.ascx" TagPrefix="uc1" TagName="DetalleInsumoAgregados" %>

<asp:Panel ID="PanelMensajeMetodo" Visible="false" runat="server" CssClass="mt-3">
    <asp:Label ID="Label4" runat="server">
                            <div class="alert alert-light text-center alert-info" role="alert">
                                <h5>
                                    <br />
                                    .:: Seleccione un metodo por favor ::.
                                    <br />
                                    <br />
                                </h5>
                            </div>
    </asp:Label>
</asp:Panel>

<asp:Panel ID="PanelMensaje" Visible="true" runat="server" CssClass="mt-3">
    <asp:Label ID="ALERtablaDatos" runat="server">
                            <div class="alert alert-light text-center alert-info" role="alert">
                                <h5>
                                    <br />
                                    .:: El metodo seleccionado ya fue gestionado y no puede seguir con este proceso, por favor seleccione metodo siguiente ::.
                                    <br />
                                    <br />
                                </h5>
                            </div>
    </asp:Label>
</asp:Panel>

<asp:Panel runat="server" Visible="false" ID="PanelInsumos">

    <div class="text-wrap" >
        <div class="example">
            <div class="p-3 bg-light" runat="server" id="divadicionales" visible="true">
                <nav class="nav main-nav flex-column flex-md-row justify-content-center">
                    <a class="nav-link active">
                        <asp:LinkButton runat="server" ID="btnAgregarArticulos" OnClientClick="showProgressBar();" OnClick="btnAgregarArticulos_Click" data-toggle="tooltip" title="Agrega Artículos" type="button" class="btn ripple btn-warning"><i class="fe fe-link"></i>Artículos</asp:LinkButton>
                    </a>

                    <a class="nav-link active">
                        <asp:LinkButton runat="server" ID="btnAdicionar" OnClientClick="showProgressBar();" OnClick="btnAdicionar_Click" data-toggle="tooltip" title="Número Adicional Muestras" type="button" class="btn ripple  btn-danger"><i class="fe fe-plus"></i>Adicional Muestras</asp:LinkButton>
                    </a>

                    <div runat="server" id="divAdicional" visible="false">


                        <a class="nav-link active">

                            <div class="row">

                                <div class="col-md-10">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon12">Cantidad *</span> </div>
                                        <asp:TextBox runat="server" ID="txtCantidadAdicional" TextMode="Number" min="0" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Cantidad" type="text" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                            ControlToValidate="txtCantidadAdicional" Display="Dynamic" ForeColor="Red"
                                            ValidationGroup="CreartxtCantidadAdicional"></asp:RequiredFieldValidator>

                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <br />
                                    <div class="form-group">
                                        <asp:LinkButton runat="server" ID="btnGuardarAdicional" OnClientClick="showProgressBar();" ValidationGroup="CreartxtCantidadAdicional" OnClick="btnGuardarAdicional_Click" data-toggle="tooltip" title="Guardar" type="button" class="btn ripple  btn-success"><i class="fe fe-save"></i>Guardar</asp:LinkButton>
                                    </div>
                                </div>



                            </div>

                        </a>


                    </div>

                    <a class="nav-link active">

                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="icon1 mt-2"><i class="fa fa-hashtag text-primary tx-40"></i></div>
                                    </div>
                                    <div class="col-6">
                                        <div class="mt-0 text-center">
                                            <h3 class="mb-0">
                                                <label runat="server" id="lblValorAgregado"></label>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </a>

                </nav>
            </div>

        </div>
    </div>

    <table id="tableSArticu" class="table table-responsive-sm table-striped table-bordered key-buttons  form-control-sm">
        <thead style="background-color: #565A5D; color: white">
            <tr>
                <th style="color: white">Artículo</th>
                <th style="color: white">Cantidad x Muestra</th>
                <th style="color: white">Numero de Muestra</th>
                <th style="color: white">Cantidad Requerida</th>
                <th style="color: white">Lote</th>
                <th style="color: white">Existencias</th>
            </tr>
        </thead>
        <tbody>

            <asp:Repeater runat="server" ID="RepeaterArticulos">
                <ItemTemplate>
                    <tr style="background-color: <%# Eval("COLOR") %>">

                        <td style="width: 600px;">
                            <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                            <asp:Label ID="TemaDiscu" Text='<%# Eval("DESCRIPCION")%>' runat="server"></asp:Label>
                        </td>

                        <td>
                            <asp:Label ID="Label1" Text='<%# Eval("CANTIDAD") %>' runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label2" Text='<%# Eval("NUMERO_MUESTRAS") %>' runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" Text='<%# Eval("CANTIDAD_REQUERIDA") %>' runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddl_Lote" AutoPostBack="true" OnSelectedIndexChanged="ddl_Lote_SelectedIndexChanged" CssClass="form-control small drop-down-profile  form-control-sm  "></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                ControlToValidate="ddl_Lote" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="CrearBajasInsumos"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="txtexistencias" runat="server"></asp:Label>
                        </td>


                        <asp:Panel ID="panelHijo" runat="server" Visible="true">
                            <tr class="child text-center">
                                <td class="child" colspan="6">

                                    <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                        <div class="card card-warning row">
                                            <div class="alert alert-info" role="alert">

                                                <div class="card order-list">
                                                    <div class="card-body">
                                                        <div class="table-responsive">
                                                            <div class=" pb-0">
                                                                <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">( Multiples Lotes)</span></p>
                                                            </div>
                                                            <table id="tableSLoteInsumo" class="table table-responsive-sm table-striped border  form-control-sm" style="color: #686A6B;">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="color: black">Lote</th>
                                                                        <th style="color: black">Cantidad Agregada</th>
                                                                        <th style="color: black"></th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    <asp:Repeater runat="server" ID="RepeaterInsumos">
                                                                        <ItemTemplate>
                                                                            <tr>

                                                                                <td>
                                                                                    <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                                                    <asp:Label ID="TemaDiscu" Text='<%# Eval("LOTE")%>' runat="server"></asp:Label>
                                                                                </td>

                                                                                <td>
                                                                                    <asp:Label ID="Label1" Text='<%# Eval("CANTIDAD") %>' runat="server"></asp:Label>
                                                                                </td>


                                                                                <td class="text-center">


                                                                                    <asp:LinkButton runat="server" OnClientClick="showProgressBar();" ID="lbn_EliminarLote" data-toggle="tooltip" title="Eliminar" OnCommand="lbn_EliminarLote_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa  fa-trash text-danger fa-2x"></i></asp:LinkButton>


                                                                                </td>

                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </tbody>
                                                            </table>

                                                            <div class="col-sm-12 col-lg-12">
                                                                <div class="card">

                                                                    <div class="card-body pt-0">
                                                                        <div class="row">
                                                                            <%--<div class="col text-center">
                                                                        <label class="tx-12">Total Agregado Lote Seleccionado</label>
                                                                        <p runat="server" id="totalLote" class="fw-bold tx-20 mb-0">0</p>
                                                                    </div>--%>
                                                                            <!-- col -->
                                                                            <div class="col border-start text-center ">
                                                                                <label class="tx-12">Requerido</label>
                                                                                <p class="fw-bold tx-20 mb-0">
                                                                                    <asp:Label ID="TXTP_CantidadR" Text='' runat="server"></asp:Label>
                                                                                </p>
                                                                            </div>
                                                                            <!-- col -->
                                                                            <div class="col border-start text-center">
                                                                                <label class="tx-12">Total Agregado</label>
                                                                                <p runat="server" id="totalLotesAgregados" class="fw-bold tx-20 mb-0">0</p>
                                                                            </div>
                                                                            <!-- col -->
                                                                        </div>
                                                                        <!-- row -->
                                                                        <div class="progress mt-4 ht-20">
                                                                            <div runat="server" id="controlProgressInsumo" class="progress-bar progress-bar-striped progress-bar-animated bg-success wd-100p ht-20"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <asp:LinkButton runat="server" ID="lbn_ContinuarProcesoXLotes" OnClientClick="showProgressBar();" CssClass="btn ripple btn-secondary btn-block" data-toggle="tooltip" title="Continuar configurando cantidades" OnCommand="lbn_ContinuarProcesoXLotes_Command" CommandArgument='<%#Eval("ID") + ";" + Eval("CANTIDAD_REQUERIDA")%>'><i class="fa fa-external-link-square fa-2x"></i> Continuar configurando lotes</asp:LinkButton>

                                                        </div>
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


    <div class="text-wrap">
        <div class="example">
            <div class="btn-list">
                <asp:LinkButton runat="server" Visible="true" ID="lbn_ContinuarBajasInsumo" OnClientClick="showProgressBar();" OnClick="lbn_ContinuarBajasInsumo_Click" ValidationGroup="CrearBajasInsumos" CssClass="btn ripple btn-success btn-block" data-toggle="tooltip" title="Guardar"><i class="fa fa-save fa-2x"></i> Guardar</asp:LinkButton>
                <asp:LinkButton runat="server" Visible="false" ID="lbn_ContinuarTransladoInsumo" OnClientClick="showProgressBar();" OnClick="lbn_ContinuarTransladoInsumo_Click" ValidationGroup="CrearBajasInsumos" CssClass="btn ripple btn-success btn-block" data-toggle="tooltip" title="Guardar"><i class="fa fa-save fa-2x"></i> Guardar Stock</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Panel>
<div allowoutsideclick: false class="modal fade" id="informacionLotesInventario" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-xl">
        <div class="modal-xl modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabelsss">INSUMOS                                        
              
                </h4>
                <asp:LinkButton runat="server" ID="BtnCerrarModalinformacionLotesInventario" OnClientClick="showProgressBar();" CssClass="btn btn-icon  btn-danger" OnClick="BtnCerrarModalinformacionLotesInventario_Click">
                            <span aria-hidden="true" aria-disabled="true">&times;</span>
                </asp:LinkButton>
            </div>
            <div class="modal-body">

                <div class="text-center">
                    <div class="card-body text-warning">
                        <label class="text-danger">Nombre Artículo:</label>
                        <asp:Label runat="server" Text="No se ha seleccionado un Artículo" ID="lblNombreArticulo"></asp:Label>
                    </div>

                </div>
                <div class="row">

                    <div class=" col-md-4">
                        <div class="form-group">
                            <label>Lote </label>
                            <asp:DropDownList ID="ddl_LoteInsumo" AutoPostBack="true" OnSelectedIndexChanged="ddl_LoteInsumo_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                ControlToValidate="ddl_LoteInsumo" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="SelectCrearLotesBaja"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <div class="form-group">
                            <br />
                            <label>Existencia</label>
                            <asp:Label ID="txtexistencia" Text="0" Font-Size="XX-Large" CssClass="text-bold text-blue" Enabled="false" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class=" col-md-3">
                        <div class="form-group">
                            <label>Cantidad Utilizar </label>
                            <asp:TextBox ID="txtCantidadUtilizarInsu" CssClass="form-control" TextMode="Number" min="0" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                ControlToValidate="txtCantidadUtilizarInsu" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="SelectCrearLotesBaja"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class=" col-md-3">
                        <div class="form-group text-center">
                            <br />
                            <asp:LinkButton ID="btnAgrgarLoteInsumos" ValidationGroup="SelectCrearLotesBaja" OnClientClick="showProgressBar();" OnClick="btnAgrgarLoteInsumos_Click" CssClass="btn btn-primary" runat="server" Text="Agregar" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer">
                <uc1:DetalleInsumoAgregados runat="server" ID="DetalleInsumoAgregados" />
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function infoLOTES() {


        $('#informacionLotesInventario').modal('show');

    }

    function CerrarinfoLOTES() {


        $('#informacionLotesInventario').modal('hide');


    }
</script>


<div allowoutsideclick: false class="modal fade" id="informacionArticulosAdicionalInventario" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-xl">
        <div class="modal-xl modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabelsss">ARTÍCULOS                                        
              
                </h4>
                <asp:LinkButton runat="server" ID="LinkButton2" class="close">
                            <span aria-hidden="true" aria-disabled="true">&times;</span>
                </asp:LinkButton>
            </div>
            <div class="modal-body">

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
                                                                                                    <asp:LinkButton runat="server" CssClass="btn  btn-success btn-sm" ID="btnSeleccionar" OnClientClick="showProgressBar();" OnCommand="btnSeleccionar_Command" data-toggle="tooltip" title="Seleccionar" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-check-circle-o"></i></asp:LinkButton>
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
                                                        <asp:Label runat="server" Text="No se ha seleccionado un Artículo" ID="lblNombreArticuloAdicional"></asp:Label>
                                                    </div>
                                                    <div class="card-header pb-0">
                                                        <div class="row row-sm">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Cantidad *</span> </div>
                                                                    <asp:TextBox runat="server" ID="txtCantidad" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Cantidad" type="text" />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                        ControlToValidate="txtCantidad" Display="Dynamic" ForeColor="Red"
                                                                        ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6 ">
                                                                <asp:LinkButton runat="server" ID="btnAgregar" OnClientClick="showProgressBar();" OnClick="btnAgregar_Click" ValidationGroup="CrearArticulo" class="btn btn-primary btn-rounded "> <i class="fa fa-arrow-down"></i> Agregar
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

                                                                        <asp:Repeater runat="server" ID="RepeaterArticulos2">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td class="text-center">
                                                                                        <div class=" text-left">
                                                                                            <asp:LinkButton runat="server" OnClientClick="showProgressBar();" CssClass="btn  btn-success btn-sm" ID="btnEditar" data-toggle="tooltip" title="Editar" OnCommand="btnEditar_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-pencil"></i></asp:LinkButton>
                                                                                            <asp:LinkButton runat="server" OnClientClick="showProgressBar();" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" OnCommand="lbn_EstadoT_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh"></i></asp:LinkButton>

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
<script type="text/javascript">
    function ArticulosINSUMOSADD() {


        $('#informacionArticulosAdicionalInventario').modal('show');

    }

</script>








