<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetalleReporte.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inventario.Reportes.DetalleReporte" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:ScriptManager runat="server" />

<div class="header-title">
    <div class="text-center">
        <h4 class="mb-2">Informes Inventario</h4>
    </div>
</div>
<hr />
<div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">

    <div class="card">
        <div class="card-body ">
            <hr class="m-0" />
            <div class="pd-15  bg-gray-200 small formlayout">
                <div class="row row-sm">
                    <div class="col-md-12">
                        <div class="box box-success">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label>Reportes</label>
                                        <asp:DropDownList ID="txtreportes" AutoPostBack="true" CssClass="form-control select2" runat="server" OnSelectedIndexChanged="txtreportes_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Panel runat="server" Visible="false" ID="panelfechainicial" GroupingText="Fecha Inicial">
                                            <asp:TextBox runat="server" ID="txtfechainicial" TextMode="Date" CssClass="form-control" />
                                        </asp:Panel>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Panel runat="server" Visible="false" ID="panelfechafinal" GroupingText="Fecha Final">
                                            <asp:TextBox runat="server" ID="txtfechafinal" TextMode="Date" CssClass="form-control" />
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Panel runat="server" Visible="false" ID="panelarticulos" GroupingText="Articulos">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtbuscararticulos" />
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:LinkButton Text="<i class='fa fa-search'></i> Buscar Articulos" CssClass="btn btn-outline-primary" runat="server" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Panel runat="server" Visible="false" ID="panelbodega" GroupingText="Lote">
                                            <asp:DropDownList ID="txtLote" CssClass="form-control select2" runat="server"></asp:DropDownList>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <hr />
                                        <div class=" text-center">
                                            <asp:LinkButton Text="<i class='fa fa-print'></i> Generar Reporte" Width="200" CssClass="btn btn-outline-primary" ID="generar" runat="server" OnClick="generar_Click" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="main-card mb-3 card">
                                            <div class="card-header">Informe</div>
                                            <div class="card-body">
                                                <asp:Panel runat="server">
                                                    <rsweb:ReportViewer ID="ReportViewer1" Width="100%" runat="server" Height="377px"></rsweb:ReportViewer>
                                                </asp:Panel>
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
