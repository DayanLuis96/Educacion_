<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Protocolo.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.Protocolo" %>

<div class="card-body">

    <div class="row">
        <div class="col-md-12 text-right">
            <asp:LinkButton runat="server" ID="btnSig" OnClick="btnSig_Click" ToolTip="Siguiente" class="btn btn-primary">Siguiente<i class="fa  fa-arrow-right "></i></asp:LinkButton>

        </div>
    </div>
    <br />
    <div runat="server" class="row" visible="false" id="divPerfilTermico">
        <br />
        <br />
        <br />
        <hr />
        <div class="col-md-12 text-center alert bg-primary">

            <span class="h3 font-weight-bold text-white">PARAMETROS Servicio:</span>
        </div>
        <div class="col-md-4">
            <!-- div -->
            <div class="card">
                <div class="card-body">
                    <div class="text-wrap">
                        <div class="example">
                            <div class="d-md-flex">


                                <div class="tabs-style-4 ">
                                    <div class="panel-body tabs-menu-body ps">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab21" role="tabpanel">

                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="panel panel-primary tabs-style-4">
                                                            <div class="tab-menu-heading">
                                                                <div class="tabs-menu ">
                                                                    <!-- Tabs -->
                                                                    <ul class="nav panel-tabs me-3" role="tablist">
                                                                        <li class=""><a class="active small" data-bs-toggle="tab" aria-selected="true" role="tab"><i class="fe fe-airplay me-1"></i>PERFIL TÉRMICO: </a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table id="tableSt" class="table table-striped border   form-control-sm" style="color: #686A6B;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="color: black">Temperatura (°C)/Tiempo</th>
                                                                            <th style="color: black">Ciclos</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="RepeterTermicos">
                                                                            <ItemTemplate>
                                                                                <tr>

                                                                                    <td>

                                                                                        <asp:Label ID="TemaDiscu" Text='<%# Eval("columna")%>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td style="max-height: 50px; overflow: hidden;">
                                                                                        <asp:Label ID="Label1" Text='<%# Eval("valor") %>' runat="server"></asp:Label>
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
                        <!-- /div -->
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <!-- div -->
            <div class="card">
                <div class="card-body">
                    <div class="text-wrap">
                        <div class="example">
                            <div class="d-md-flex">

                                <div class="tabs-style-4 ">
                                    <div class="panel-body tabs-menu-body ps">
                                        <div class="tab-content">

                                            <div class="tab-pane active" id="tab22" role="tabpanel">

                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="panel panel-primary tabs-style-4">
                                                            <div class="tab-menu-heading">
                                                                <div class="tabs-menu ">
                                                                    <!-- Tabs -->
                                                                    <ul class="nav panel-tabs me-3" role="tablist">
                                                                        <li class=""><a class="active small" data-bs-toggle="tab" aria-selected="true" role="tab"><i class="fe fe-airplay me-1"></i>INFORMACIÓN DE REACCIÓN: </a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive">
                                                                <table id="tableSt" class="table table-striped border   form-control-sm" style="color: #686A6B;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th style="color: black">Componente (unidad concentración)</th>
                                                                            <th style="color: black">ci</th>
                                                                            <th style="color: black">cf</th>
                                                                            <th style="color: black">Volumen reacción (μL)</th>
                                                                            <th style="color: black">Volumen total</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="RepeaterComponentes">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="txtcomponente" Text='<%# Eval("COMPONENTE")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtCi" Text='<%# Eval("CI")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtcf" Text='<%# Eval("CF")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtvolreaccion" Text='<%# Eval("VOLUMEN_REACCION")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtvoltot" Text='<%# Eval("VOLUMEN_TOTAL")%>' runat="server"></asp:Label>
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
                        <!-- /div -->
                    </div>
                </div>



            </div>
        </div>
        <div class="col-md-12">
            <br />
            <hr />
        </div>

    </div>
    <div class="row">
        <div class="col-md-10">
            <h3 class="card-title mb-0 ">Protocolo </h3>
        </div>


        <div class="col-md-4">
            <div class="table-responsive">
                <table id="table" class=" table-striped border    form-control-sm">
                    <thead>
                        <tr>
                            <th>Protocolos</th>
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
                                            <asp:LinkButton runat="server" ID="btnVer" ToolTip="Adjunto" OnClientClick="showProgressBar();" OnCommand="btnVer_Command" CommandArgument='<%#Eval("ID")%>' class="btn  btn-primary"><i class="fa fa-eye fa-1x"></i></asp:LinkButton>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <div runat="server" visible="false" id="divselec" class="row">
                <div class="col-md-12 alert">
                    <hr />
                    <span>Protocolo seleccionado:
                        <asp:Label runat="server" CssClass="font-weight-bold" ID="txtprotSeleccionado"></asp:Label></span>
                    <hr />
                </div>

            </div>


        </div>
        <div class="col-md-8  ">

            <div class="content">
                <iframe name="iframe" id="iframe" onscroll="true" style="width: 100%; height: 390px; border: none"></iframe>
            </div>
        </div>

        <div class="col-md-12">
            <span class="font-weight-bold">Protocolo Estandar:</span>

            <asp:TextBox ID="txb_Texto" runat="server" Enabled="false" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
            <script>
                window.onload = function () {
                    CKEDITOR.replace('<%=txb_Texto.ClientID%>');
                };
            </script>
            <br />
            <hr />
        </div>
        <div class="col-md-12 text-center alert bg-primary">

            <span class="h3 font-weight-bold text-white">Modificaciones:</span>
        </div>

        <div class="col-md-12">
            <asp:LinkButton runat="server" ID="BtnGuardarModificaciones" OnClick="BtnGuardarModificaciones_Click" OnClientClick="showProgressBar();" CssClass="btn bg-primary-transparent text-primary " data-bs-toggle="tooltip" title="" data-bs-placement="bottom" data-bs-original-title="Add New"><span><i class="fa fa-save"></i> Guardar</span></asp:LinkButton>
            <br />
            <br />
        </div>
        <div class="col-md-12">
            <asp:GridView ID="tablamodificaciones" runat="server" ShowHeader="false" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <asp:Label runat="server" ID="txtnombre" CssClass="font-weight-bold mg-b-0" Text='<%# Bind("NOMBRE_MODIFICACION") %>'></asp:Label>
                                        </div>
                                        <div class="col-md-9">
                                            <asp:TextBox runat="server" ID="txtmodificaciones" Text='<%# Bind("MODIFICACION") %>' Rows="4" CssClass="form-control border border-bottom shadow border-primary form-control-sm" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>


                                </div>
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

<script type="text/javascript">
    function MostrarProtocolo() {
        var frame = $('#iframe');
        var url = '<%= Session["PROTOCOLO"] %>';
        frame.attr('src', url).show();
    }
</script>




</div>
