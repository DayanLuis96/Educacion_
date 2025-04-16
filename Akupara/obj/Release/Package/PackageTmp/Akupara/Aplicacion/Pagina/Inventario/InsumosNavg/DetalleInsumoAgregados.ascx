<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetalleInsumoAgregados.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.InsumosNavg.DetalleInsumoAgregados" %>


<table id="tableSLoteInsumo" class="table table-responsive-sm table-striped border  form-control-sm" style="color: #686A6B;">
    <thead>
        <tr>
            <th style="color: black">Lotes</th>
            <th style="color: black">Cantidad x Muestra</th>
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


                        <asp:LinkButton runat="server" ID="lbn_EliminarLote" OnClientClick="showProgressBar();" data-toggle="tooltip" title="Eliminar" OnCommand="lbn_EliminarLote_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa  fa-trash text-danger fa-2x"></i></asp:LinkButton>


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
                <div class="col text-center">
                    <label class="tx-12">Total Agregado Lote Seleccionado</label>
                    <p runat="server" id="totalLote" class="fw-bold tx-20 mb-0">0</p>
                </div>
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

