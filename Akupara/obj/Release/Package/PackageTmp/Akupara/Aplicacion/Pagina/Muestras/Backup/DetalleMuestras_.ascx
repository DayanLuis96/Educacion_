<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetalleMuestras_.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Backup.DetalleMuestras_" %>

<style>
    .header-style {
        color: white;
        background-color: black;
    }
</style>
<asp:HiddenField runat="server" ID="HidenIDBacukp" />
<asp:HiddenField runat="server" ID="HidenDDL" Value="0" />
<div class="col-md-12 ">
    <div class="page-header d-sm-flex d-block">
        <ol class="breadcrumb mb-sm-0 mb-3">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="javascript:void(0);">Muestra</a></li>
        </ol>
    </div>
    <div class="table-responsive">
        <asp:GridView runat="server" AutoGenerateColumns="true" CssClass="table table-striped border    form-control-sm" ID="griwMuestra"></asp:GridView>
    </div>
</div>
<div class="">
    <!-- Page Header -->
    <div class="page-header d-sm-flex d-block">
        <ol class="breadcrumb mb-sm-0 mb-3">
            <!-- breadcrumb -->
            <li class="breadcrumb-item"><a href="javascript:void(0);">Muestra</a></li>
            <li class="breadcrumb-item active" aria-current="page">Resultados</li>
        </ol>
        <!-- End breadcrumb -->
        <%-- <div class="ms-auto">
            <div>
                <a href="javascript:void(0);" class="btn bg-primary-transparent text-primary btn-sm" data-bs-toggle="tooltip" title="" data-bs-placement="bottom" data-bs-original-title="Add New"><span><i class="fa fa-plus"></i></span></a>
            </div>
        </div>--%>
    </div>
    <!-- End Page Header -->
    <!-- row -->
    <div class="row row-sm">
        <div class="col-md-12 col-xl-4 mb-3 mb-md-0">
            <div class="card">

                <div class="card-header border-bottom border-top pt-3 pb-3 mb-0 fw-bold text-uppercase">Filtros</div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Tipo resultado: </span></div>
                                <asp:DropDownList runat="server" ID="ddl_TipoResultadoDetalle" class="form-control select2 form-control-sm "></asp:DropDownList>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="p-3 border-top">
                    <asp:LinkButton runat="server" ID="btnFiltar" OnClientClick="showProgressBar();" OnClick="btnFiltar_Click" class="btn btn-primary btn-block">Filtrar</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="col-xl-8 col-md-12">
            <div class="card item2-gl-nav">
                <div class="card-body d-flex p-3">
                    <b>Resultados cargados</b>
                </div>
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-1551" role="tabpanel">
                    <div class="row row-sm">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                            <div class="card">
                                <div class="product-grid">
                                    <div class="card-header">
                                        <div class="card-body">

                                            <div class="table-responsive">
                                                <table id="tableS" class="table table-striped border    form-control-sm">
                                                    <thead>
                                                        <tr>

                                                            <th>ID_CAMPO</th>
                                                            <th>Nombre Archivo</th>
                                                            <th>Tipo Resultado</th>

                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <asp:Repeater runat="server" ID="AdjuntosRepeter">
                                                            <ItemTemplate>
                                                                <tr>

                                                                    <td>
                                                                        <asp:Label ID="lblCampo" Text='<%# Eval("ID_CAMPO")%>' runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblrealname" Text='<%# Eval("realname")%>' runat="server"></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Label ID="lblTipoResultado" Text='<%# Eval("TipoResultado")%>' runat="server"></asp:Label>
                                                                    </td>

                                                                    <td>
                                                                        <asp:LinkButton runat="server" CssClass="btn btn-success  btn-sm" data-toggle="tooltip" title="Descargar Archivo" ID="btndescargarplan" OnCommand="btndescargarplan_Command" CommandArgument='<%#Eval("ID")%>'> <i class="fa fa-download fa-2x"></i> </asp:LinkButton>
                                                                        <asp:LinkButton runat="server" ID="btnEliminar" data-toggle="tooltip" title="Eliminar Adjunto" OnCommand="btnEliminar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-danger"><i class="fa fa-trash-o fa-1x"></i></asp:LinkButton>
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
