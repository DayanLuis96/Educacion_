<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestionResultados.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.GestionResultados" %>

<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/FaseOneRedis.ascx" TagPrefix="uc1" TagName="FaseOneRedis" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/FaseTwoRedis.ascx" TagPrefix="uc1" TagName="FaseTwoRedis" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/FaseThreeRedis.ascx" TagPrefix="uc1" TagName="FaseThreeRedis" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/FaseFourRedis.ascx" TagPrefix="uc1" TagName="FaseFourRedis" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Resultado.ascx" TagPrefix="uc1" TagName="Resultado" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Inventario.ascx" TagPrefix="uc1" TagName="Inventario" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Metodo.ascx" TagPrefix="uc1" TagName="Metodo" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Protocolo.ascx" TagPrefix="uc1" TagName="Protocolo" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Punto_Chequeo.ascx" TagPrefix="uc1" TagName="Punto_Chequeo" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/FasesMuestra/Informe.ascx" TagPrefix="uc1" TagName="Informe" %>





<div>



    <!-- row -->
    <div class="row row-sm">
        <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12">
            <div class="card">
                <div class="card-header pb-0">
                    <div class="row">
                        <div class="col-md-10">
                            <h3 class="card-title mb-1 ">Gestionar Procesamiento de Muestras</h3>
                        </div>
                        <div class="col-md-2 alert alert-success" runat="server" id="divproce" visible="false">
                            <span class="font-weight-bold" runat="server" id="TipoSeleccion">Procesamiento #</span>
                                <asp:Label runat="server" CssClass="badge badge-primary" Font-Size="Large" ID="txtnumeroprocesamiento" Text="10"></asp:Label>
                        </div>
                    </div>

                </div>
                <div id="wizard2" class="panel panel-primary tabs-style-3">
                    <div class="tab-menu-heading">
                        <div class="tabs-menu wizard ">
                            <ul class="nav panel-tabs " role="tablist">
                                <%--<li class=""><a class="active" data-bs-toggle="tab" aria-selected="true" role="tab">
                                <i class="fe fe-airplay me-1"></i> Tab Style 01</a></li>--%>

                                <li role="tab" runat="server" id="vt11" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest1" CssClass="active" OnClientClick="showProgressBar();" OnClick="BtnPest1_Click">  <span class="badge badge-light rounded-pill"><i >1</i></span> Solicitudes
                                    </asp:LinkButton>
                                </li>
                                <li role="tab" runat="server" id="vt21" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest2" CssClass="first current" OnClientClick="showProgressBar();" OnClick="BtnPest2_Click"> <span class="badge badge-light rounded-pill"><i >2</i></span> Muestras
                                    </asp:LinkButton></li>
                                <li role="tab" runat="server" id="vt31" class="current first ">
                                    <asp:LinkButton runat="server" ID="BtnPest3" OnClientClick="showProgressBar();" OnClick="BtnPest3_Click"> <span class="badge badge-light rounded-pill"><i >3</i></span> Metodo
                                    </asp:LinkButton>
                                </li>
                                <li role="tab" runat="server" id="vt41" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest4" Visible="false" OnClientClick="showProgressBar();" CssClass="first current" OnClick="BtnPest4_Click">  <span class="badge badge-light rounded-pill"><i >4</i></span> Protocolo
                                    </asp:LinkButton></li>
                                <li role="tab" runat="server" id="vt51" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest5" Visible="false" OnClientClick="showProgressBar();" CssClass="first current" OnClick="BtnPest5_Click"> <span class="badge badge-light rounded-pill"><i >5</i></span> Insumos
                                    </asp:LinkButton></li>
                                <li role="tab" runat="server" id="vt61" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest6" Visible="false" OnClientClick="showProgressBar();" CssClass="first current" OnClick="BtnPest6_Click"><span class="badge badge-light rounded-pill"><i >6</i></span> Resultado
                                    </asp:LinkButton></li>
                                <li role="tab" runat="server" id="vt71" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest7" Visible="false" OnClientClick="showProgressBar();" CssClass="first current" OnClick="BtnPest7_Click"> <span class="badge badge-light rounded-pill"><i >7</i></span> Informe
                                    </asp:LinkButton></li>
                                <li role="tab" runat="server" id="Vt81" class="current first">
                                    <asp:LinkButton runat="server" ID="BtnPest8" Visible="false" OnClientClick="showProgressBar();" CssClass="first current" OnClick="BtnPest8_Click"> <span class="badge badge-light rounded-pill"><i >8</i></span> Punto de chequeo
                                    </asp:LinkButton></li>
                            </ul>
                        </div>

                    </div>
                    <div class="content  ">
                        <div id="Tab1" runat="server" tabindex="1">


                            <div class="card-body">
                                <%--                    <div class="list-group list-group-transparent border mb-0 mail-inbox"><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-primary me-3"></span>All </a><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-pink me-3"></span>General </a><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-success me-3"></span>Licenses </a><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-warning me-3"></span>Trademark use </a><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-danger me-3"></span>Company usage </a><a href="javascript:void(0);" class="list-group-item list-group-item-action d-flex align-items-center py-2"><span class="wd-10 ht-10 brround bg-primary me-3"></span>Settings </a></div>--%>
                                <div class="card-header">
                                    <h3 class="card-title mb-0 ">Solicitudes </h3>
                                </div>
                                <div class="col-md-12">
                                    <asp:ListView ID="ListaDetalleServicios" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                                        ItemPlaceholderID="itemPlaceHolder1" GroupItemCount="1">
                                        <LayoutTemplate>
                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                        </LayoutTemplate>
                                        <GroupTemplate>
                                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                        </GroupTemplate>
                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="txtID" Text=' <%# Eval("ID") %>' runat="server">
                                            </asp:Label>
                                            <div class="alert alert-outline-success m-0 pb-0" role="alert">
                                                <div class=" pb-0">
                                                    <p class="tx-12 text-muted mb-0"><span class="badge badge-secondary">(servicio)</span></p>
                                                </div>
                                                <div class="alert alert-success" role="alert">
                                                    <div class="main-content-breadcrumb">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<b class="text-bold"><%#Eval("NOMBRESERVICIO")%></b></div>
                                                </div>
                                                <div class=" m-0">
                                                    <div class="table-responsive table-card mt-3 mb-1">
                                                        <div class=" pb-0">
                                                            <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Detalles)</span></p>
                                                        </div>
                                                        <table id="tableSolicitudes" class="table table-sm rouded small m-0 shadow table-striped mg-b-1 text-md-nowrap border table-sm">
                                                            <thead style="background-color: #565A5D;">
                                                                <tr>
                                                                    <th>Dt Srvicio</th>
                                                                    <th>Cantidad</th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater runat="server" ID="DetalleServicio">
                                                                    <ItemTemplate>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server">
                                                                                </asp:Label>
                                                                                <asp:Label Visible="false" ID="txtUrl" Text=' <%# Eval("URL") %>' runat="server"></asp:Label>

                                                                                <asp:Label Visible="false" ID="txtnombreplantilla" Text=' <%# Eval("nombre_plantilla") %>' runat="server">
                                                                                </asp:Label>
                                                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("Nombre")%>' runat="server"></asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <div class="handle-counter" id="handleCounter">

                                                                                    <asp:TextBox runat="server" ID="txtCantidadService" TextMode="Number" Text='<%# Eval("CANTIDAD")%>' CssClass="form-control form-control-sm small" />

                                                                                </div>
                                                                            </td>

                                                                            <td>
                                                                                <asp:LinkButton runat="server" Visible='<%# Eval("plantillas") %>' CssClass="btn btn-warning btn-sm " OnCommand="lbn_PlantillaT_Command" OnClientClick="showProgressBar();" data-toggle="tooltip" title="Plantilla" ID="lbn_PlantillaT" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-eye"></i> Muestras </asp:LinkButton>

                                                                                <asp:Label runat="server" ID="Mensaje" CssClass="badge badge-pill badge-primary" Text='<%# Eval("MUESTRAS") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>


                        </div>
                        <div id="Tab2" runat="server" visible="false" tabindex="2">
                            <%--                            <h3 id="wizard2-h-1" tabindex="-1" class="title">Seleccion de Muestras</h3>--%>
                            <section id="wizard2-p-1">
                                <div>
                                    <div class="card-header">
                                        <h3 class="card-title mb-0 ">Seleccion de Muestras </h3>
                                    </div>
                                    <div>
                                        <div class="col-md-12">
                                            <asp:Panel runat="server" ID="PanelAnexosCargados">

                                                <div class="card-footer">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="col-md-2">
                                                                    <asp:LinkButton runat="server" ID="btnselectTodo" OnClick="btnselectTodo_Click" CssClass="btn bg-primary-transparent text-primary "> <i class="fa fa-check"></i> Seleccionar todo</asp:LinkButton>
                                                                    <asp:LinkButton runat="server" Visible="false" ID="BtnDesTodo" OnClick="BtnDesTodo_Click" CssClass="btn bg-danger-transparent text-primary "> <i class="fa fa-close"></i> Desmarcar todo</asp:LinkButton>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="btn">
                                                                        <span>Seleccionar las primeras: 
                                                                            <asp:TextBox runat="server" TextMode="Number" ID="txtNumeroSeleccionar"></asp:TextBox>
                                                                            <asp:LinkButton runat="server" ID="btnselecciona" OnClick="btnselecciona_Click" title="Seleccionar" class=" small btn-primary btn-sm "><i class="fa small fa-check  fa-1x"></i></asp:LinkButton>
                                                                            <asp:LinkButton runat="server" ID="BtnLimpiar" OnClick="BtnLimpiar_Click" title="Limpia" class=" small btn-warning btn-sm "><i class="fa small  fa-broom"></i></asp:LinkButton></span>
                                                                    </div>
                                                                    <div class="btn">
                                                                        <span>Número de muestras seleccionadas:
                                                                        <asp:Label runat="server" CssClass="font-weight-bold" ID="txtseleccionadas"></asp:Label></span>
                                                                    </div>

                                                                </div>
                                                                <div class="col-md-2 text-right">
                                                                    <asp:LinkButton runat="server" OnClick="Unnamed_Click" ID="btncontinuar" CssClass="btn bg-primary text-white "> Continuar <i class="fa fa-arrow-right"></i> </asp:LinkButton>
                                                                </div>
                                                            </div>
                                                            <div runat="server" id="divAnexo1a" visible="false" class="table-responsive">
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <p class="font-weight-bold">Anexo 1a</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <ul class="nav nav-tabs">
                                                                            <li class="nav-item">
                                                                                <asp:Button runat="server" ID="ButtonMuestras" OnClick="ButtonMuestras_Click" CssClass="nav-link bg-primary active" Text="Muestras " />
                                                                            </li>
                                                                            <li class="nav-item">
                                                                                <asp:Button runat="server" ID="ButtonLoci" OnClick="ButtonLoci_Click" CssClass="nav-link bg-secundary" Text="Loci" />
                                                                            </li>

                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="table-responsive" id="tabla1a" runat="server" visible="true">
                                                                    <table id="table" class="table table-sm table-striped  text-md-nowrap border">
                                                                        <thead style="background-color: #565A5D; color: white">
                                                                            <tr class="text-center">
                                                                                <th style="background-color: #1C2833; color: white;" colspan="6">Información muestra</th>
                                                                                <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                                                                                <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                                                                            </tr>
                                                                            <tr>
                                                                                <th></th>
                                                                                <%--                                                <th>Observaciones</th>--%>
                                                                                <th style="color: white; background: #565A5D;">ID Muestra</th>
                                                                                <th style="color: white; background: #565A5D;">Organismo</th>
                                                                                <th style="color: white; background: #565A5D;">Especie</th>
                                                                                <th style="color: white; background: #565A5D;">Tipo muestra</th>
                                                                                <th style="color: white; background: #565A5D;">Estado</th>
                                                                                <th style="color: white; background: #565A5D;">Rango</th>
                                                                                <th style="color: white; background: #565A5D;">Secuencia interés</th>
                                                                                <th style="color: white; background: #565A5D;">Nombre Forward</th>
                                                                                <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                                                                                <th style="color: white; background: #565A5D;">Nombre Reverse</th>
                                                                                <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                                                                                <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>
                                                                                <th style="color: white; background: #565A5D;">#Loci</th>
                                                                                <th style="color: white; background: #565A5D;">Tamaño (pb)</th>
                                                                                <th style="color: white; background: #565A5D;">Nombre set </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <asp:Repeater runat="server" ID="tbanexo1a">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <div>
                                                                                                <asp:UpdatePanel runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:CheckBox ID="ch_DetalleServicio" AutoPostBack="true" OnCheckedChanged="ch_DetalleServicio_CheckedChanged" runat="server" />
                                                                                                        <%--                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>--%>
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:PostBackTrigger ControlID="ch_DetalleServicio" />
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                            </div>
                                                                                            <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                            <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                                                                            </asp:Label>
                                                                                        </td>
                                                                                        <%-- <td>
                                                            <asp:TextBox runat="server" Visible="false" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control  " ID="txtobservacion"></asp:TextBox>

                                                        </td>--%>
                                                                                        <td>
                                                                                            <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                                                                        </td>

                                                                                        <td>
                                                                                            <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label11" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label10" Text='<%# Eval("NOMBRE_FORWARD") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label5" Text='<%# Eval("SECUENCIA_FORWARD_5_3") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label12" Text='<%# Eval("NOMBRE_REVERSE") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label13" Text='<%# Eval("SECUENCIA_REVERESE_5_3") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label7" Text='<%# Eval("LOCI") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label8" Text='<%# Eval("TAMAÑO") %>' runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label9" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                                                                        </td>

                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                 <%--Tabla Loci--%>

                                 <div class="card-footer text-center">
                                <div class="table-responsive" runat="server" visible="false" id="TablaLoci">
                                    <table id="tableS" class="table table-sm table-striped  text-md-nowrap border">
                                        <thead style="background-color: #565A5D; color: white">
                                            <tr class="text-center">
                                                <th style="background-color: #808B96; color: white;" colspan="10">Análisis de Fragmentos - Loci(Genes)</th>
                                            </tr>
                                            <tr>
                                                <th style="color: white; background: #565A5D;">Especie</th>
                                                <th style="color: white; background: #565A5D;">Nombre set</th>
                                                <th style="color: white; background: #565A5D;">Locus</th>
                                                <th style="color: white; background: #565A5D;">Nombre Primer/Cebador</th>
                                                <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                                                <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                                                <th style="color: white; background: #565A5D;">Motivo de repetición</th>
                                                <th style="color: white; background: #565A5D;">Rango alélico</th>
                                                <th style="color: white; background: #565A5D;">Marcaje Fluorescente</th>
                                                <th style="color: white; background: #565A5D;">Observaciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="tbLoci">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label11" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                                        </td>
                                                         <td>
                                                            <asp:Label ID="Label14" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="txtestado" Text='<%# Eval("LOCUS") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label2" Text='<%# Eval("NOMBRE_PRIMER") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label3" Text='<%# Eval("SEC_FORWARD_LOCI") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" Text='<%# Eval("SEC_REVERSE_LOCI") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label10" Text='<%# Eval("MOTIVO_REPETICION") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" Text='<%# Eval("RANGO_ALELICO") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label12" Text='<%# Eval("MARCAJE_FLUORECENTE") %>' runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label13" Text='<%# Eval("OBSERVACIONES") %>' runat="server"></asp:Label>
                                                        </td>
                                                       
                                                        
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                                                            </div>

                                                            <div runat="server" id="divAnexo1b" visible="false" class="table-responsive">
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <p class="font-weight-bold">Anexo 1b</p>
                                                                    </div>
                                                                </div>
                                                                <table id="table" class="table table-sm table-striped  text-md-nowrap border">
                                                                    <thead style="background-color: #565A5D; color: white">
                                                                        <tr class="text-center">
                                                                            <th style="background-color: #1C2833; color: white;" colspan="10">Información muestra</th>
                                                                            <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                                                                            <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th></th>
                                                                            <%--                                                <th>Observaciones</th>--%>
                                                                            <th style="color: white; background: #565A5D;">Plato</th>
                                                                            <th style="color: white; background: #565A5D;">Pozo</th>
                                                                            <th style="color: white; background: #565A5D;">ID Muestra</th>
                                                                            <th style="color: white; background: #565A5D;">Organismo</th>
                                                                            <th style="color: white; background: #565A5D;">Especie</th>
                                                                            <th style="color: white; background: #565A5D;">Tipo muestra</th>
                                                                            <th style="color: white; background: #565A5D;">Estado</th>
                                                                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                                                                            <th style="color: white; background: #565A5D;">Volumen (uL)</th>
                                                                            <th style="color: white; background: #565A5D;">Rango</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia interés</th>
                                                                            <th style="color: white; background: #565A5D;">Nombre Forward</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia Forward (5´-3´)</th>
                                                                            <th style="color: white; background: #565A5D;">Nombre Reverse</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia Reverse (5´-3´)</th>
                                                                            <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>
                                                                            <th style="color: white; background: #565A5D;">#Loci</th>
                                                                            <th style="color: white; background: #565A5D;">Tamaño (pb)</th>
                                                                            <th style="color: white; background: #565A5D;">Nombre set </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="tbanexo1b">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div>
                                                                                            <asp:UpdatePanel runat="server">
                                                                                                <ContentTemplate>
                                                                                                    <asp:CheckBox ID="ch_DetalleServicio1b" AutoPostBack="true" OnCheckedChanged="ch_DetalleServicio_CheckedChanged" runat="server" />
                                                                                                    <%--                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>--%>
                                                                                                </ContentTemplate>
                                                                                                <Triggers>
                                                                                                    <asp:PostBackTrigger ControlID="ch_DetalleServicio1b" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                                                                        </asp:Label>
                                                                                    </td>
                                                                                    <%--<td>
                                                            <asp:TextBox runat="server" Visible="false" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                                        </td>--%>
                                                                                    <td>
                                                                                        <asp:Label ID="Label10" Text='<%# Eval("PLATO")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label11" Text='<%# Eval("POZO")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label15" Text='<%# Eval("ESPECIE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label12" Text='<%# Eval("CONC")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label13" Text='<%# Eval("VOLUMEN")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" Text='<%# Eval("NOMBRE_FORWARD") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label14" Text='<%# Eval("SECUENCIA_FORWARD_5_3") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label16" Text='<%# Eval("NOMBRE_REVERSE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label17" Text='<%# Eval("SECUENCIA_REVERESE_5_3") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label7" Text='<%# Eval("LOCI") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label8" Text='<%# Eval("TAMAÑO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label9" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                            <div runat="server" id="divAnexo2" visible="false" class="table-responsive">
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <p class="font-weight-bold">Anexo 2</p>
                                                                    </div>
                                                                </div>
                                                                <table id="table" class="table table-sm table-striped  text-md-nowrap border">
                                                                    <thead style="background-color: #565A5D; color: white">
                                                                        <tr class="text-center">
                                                                            <th style="background-color: #1C2833; color: white;" colspan="5">Información muestra</th>
                                                                            <th style="background-color: #808B96; color: white;" colspan="6">Secuenciación</th>
                                                                        </tr>
                                                                        <tr class="small form-control-sm">
                                                                            <th></th>
                                                                            <%--                                                <th>Observaciones</th>--%>
                                                                            <th style="color: white; background: #565A5D;">Plato</th>
                                                                            <th style="color: white; background: #565A5D;">Pozo</th>
                                                                            <th style="color: white; background: #565A5D;">ID Muestra</th>

                                                                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                                                                            <th style="color: white; background: #565A5D;">Rango</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia interés</th>
                                                                            <th style="color: white; background: #565A5D;">Nombre</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia (5´-3´)</th>
                                                                            <th style="color: white; background: #565A5D;">Concentración (ng/uL)</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="tbanexo2">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div>
                                                                                            <asp:UpdatePanel runat="server">
                                                                                                <ContentTemplate>
                                                                                                    <asp:CheckBox ID="ch_DetalleServicio2" AutoPostBack="true" OnCheckedChanged="ch_DetalleServicio_CheckedChanged" runat="server" />
                                                                                                    <%--                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>--%>
                                                                                                </ContentTemplate>
                                                                                                <Triggers>
                                                                                                    <asp:PostBackTrigger ControlID="ch_DetalleServicio2" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                                                                        </asp:Label>
                                                                                    </td>
                                                                                    <%--  <td>
                                                            <asp:TextBox runat="server" Visible="false" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                                        </td>--%>
                                                                                    <td>
                                                                                        <asp:Label ID="Label10" Text='<%# Eval("PLATO")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label11" Text='<%# Eval("POZO")%>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                                                                    </td>


                                                                                    <td>
                                                                                        <asp:Label ID="Label12" Text='<%# Eval("CONC")%>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="Label3" Text='<%# Eval("RANGO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label1" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" Text='<%# Eval("SECUENCIA_5_3") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                            <div runat="server" id="divAnexo3" visible="false" class="table-responsive">
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <p class="font-weight-bold">Anexo 3</p>
                                                                    </div>
                                                                </div>
                                                                <table id="table" class="table table-sm table-striped  text-md-nowrap border">
                                                                    <thead style="background-color: #565A5D;">
                                                                        <tr class="text-center">
                                                                            <th style="background-color: #808B96; color: white;" colspan="12">Análisis de Fragmentos - Productos PCR</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th></th>
                                                                            <%--                                                <th>Observaciones</th>--%>
                                                                            <th style="color: white; background: #565A5D;">Nombre Plato</th>
                                                                            <th style="color: white; background: #565A5D;">Pozo</th>
                                                                            <th style="color: white; background: #565A5D;">ID muestra</th>
                                                                            <th style="color: white; background: #565A5D;">Estado</th>
                                                                            <th style="color: white; background: #565A5D;">Conc (ng/uL)</th>
                                                                            <th style="color: white; background: #565A5D;">Volumen (uL)</th>
                                                                            <th style="color: white; background: #565A5D;">Marcaje Fluorescente</th>
                                                                            <th style="color: white; background: #565A5D;">Marcador de Peso</th>
                                                                            <th style="color: white; background: #565A5D;">Tamaño producto PCR (pb)</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="tbanexo3">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div>
                                                                                            <asp:UpdatePanel runat="server">
                                                                                                <ContentTemplate>

                                                                                                    <asp:CheckBox ID="ch_DetalleServicio3" AutoPostBack="true" OnCheckedChanged="ch_DetalleServicio_CheckedChanged" runat="server" />
                                                                                                    <%--                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>--%>
                                                                                                </ContentTemplate>
                                                                                                <Triggers>
                                                                                                    <asp:PostBackTrigger ControlID="ch_DetalleServicio3" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                                                                        </asp:Label>
                                                                                    </td>
                                                                                    <%-- <td>
                                                            <asp:TextBox runat="server" Visible="false" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                                        </td>--%>
                                                                                    <td>
                                                                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("NOMBRE_PLATO")%>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="Label1" Text='<%# Eval("POZO") %>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="txtestado" Text='<%# Eval("ID_MUESTRA") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label3" Text='<%# Eval("CONC") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" Text='<%# Eval("VOLUMEN") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" Text='<%# Eval("MARCAJE_FLUORESCENTE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" Text='<%# Eval("MARCADOR_PESO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label7" Text='<%# Eval("TAMA_PRODUCTO_PCR") %>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                            <div runat="server" id="divAnexo4" visible="false" class="table-responsive">
                                                                <div class="row">
                                                                    <div class="col-md-12 text-center">
                                                                        <p class="font-weight-bold">Anexo 4</p>
                                                                    </div>
                                                                </div>
                                                                <asp:LinkButton runat="server" ID="LinkButton4"> <i class="fa fa-check"></i> Seleccionar todo</asp:LinkButton>
                                                                <table id="table" class="table table-sm table-striped  text-md-nowrap border">
                                                                    <thead style="background-color: #565A5D;">
                                                                        <tr class="text-center">
                                                                            <th style="background-color: #1C2833; color: white;" colspan="5">Información muestra</th>
                                                                            <th style="background-color: #D5D8DC; color: white;" colspan="2">Ácidos Nucleicos</th>
                                                                            <th style="background-color: #B2BABB; color: white;" colspan="2">Información reacción</th>
                                                                            <th style="background-color: #808B96; color: white;" colspan="5">Información Primers/Cebadores</th>

                                                                        </tr>

                                                                        <tr>
                                                                            <th></th>
                                                                            <%--                                                <th>Observaciones</th>--%>
                                                                            <th style="color: white; background: #565A5D;">ID Muestra</th>
                                                                            <th style="color: white; background: #565A5D;">Organismo</th>
                                                                            <th style="color: white; background: #565A5D;">Tipo muestra</th>
                                                                            <th style="color: white; background: #565A5D;">Estado</th>
                                                                            <th style="color: white; background: #565A5D;">Método extracción</th>
                                                                            <th style="color: white; background: #565A5D;">Purificación</th>
                                                                            <th style="color: white; background: #565A5D;">Tamaño producto (pb)</th>
                                                                            <th style="color: white; background: #565A5D;">T°C alineamiento</th>
                                                                            <th style="color: white; background: #565A5D;">Nombre</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia Forward</th>
                                                                            <th style="color: white; background: #565A5D;">Secuencia Reverse</th>
                                                                            <th style="color: white; background: #565A5D;">Concentración (ng/uL) </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:Repeater runat="server" ID="tbanexo4">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <div>
                                                                                            <asp:UpdatePanel runat="server">
                                                                                                <ContentTemplate>
                                                                                                    <asp:CheckBox ID="ch_DetalleServicio4" AutoPostBack="true" OnCheckedChanged="ch_DetalleServicio_CheckedChanged" runat="server" />
                                                                                                    <%--                                                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>--%>
                                                                                                </ContentTemplate>
                                                                                                <Triggers>
                                                                                                    <asp:PostBackTrigger ControlID="ch_DetalleServicio4" />
                                                                                                </Triggers>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                                                                        </asp:Label>
                                                                                    </td>
                                                                                    <%--<td>
                                                            <asp:TextBox runat="server" Visible="false" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                                        </td>--%>
                                                                                    <td>
                                                                                        <asp:Label ID="txtidmuestra" Text='<%# Eval("ID_MUESTRA")%>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="Label1" Text='<%# Eval("ORGANISMO") %>' runat="server"></asp:Label>
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:Label ID="txtestado" Text='<%# Eval("TIPO_MUESTRA") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label2" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label3" Text='<%# Eval("METODO_EXTRA") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" Text='<%# Eval("PURIFICACION") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" Text='<%# Eval("TAMA_PRODUCTO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" Text='<%# Eval("ALINEAMIENTO") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label7" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label8" Text='<%# Eval("FORWARD") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label9" Text='<%# Eval("REVERSE") %>' runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label10" Text='<%# Eval("CONCENTRACION") %>' runat="server"></asp:Label>
                                                                                    </td>


                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="btncontinuar" />
                                                            <%--                                                            <asp:PostBackTrigger ControlID="btnselecciona" />--%>
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>




                                            </asp:Panel>
                                        </div>

                                    </div>
                                </div>
                            </section>
                        </div>
                        <div id="Tab3" runat="server" visible="false" tabindex="3">
                            <uc1:Metodo runat="server" ID="Metodo" />
                            <%-- <section >
                                 <div class="card-header">
                                        <h3 class="card-title mb-0 ">Metodo </h3>
                                    </div>
                                <div class=" col-md-12" runat="server">
                                    <div class="card">
                                        <div class="card-body">

                                            <div class="row">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>--%>
                        </div>
                        <div id="Tab4" runat="server" visible="false" tabindex="4">
                            <section id="wizard2-p-2">

                                <uc1:Protocolo runat="server" ID="Protocolo" />
                            </section>
                        </div>
                        <div id="Tab5" runat="server" visible="false" tabindex="5">
                            <uc1:Inventario runat="server" ID="Inventario" />
                        </div>
                        <div id="Tab6" runat="server" visible="false" tabindex="6">
                            <uc1:Resultado runat="server" ID="Resultado" />
                        </div>
                        <div id="Tab7" runat="server" visible="false" tabindex="7">
                            <uc1:Informe runat="server" ID="Informe" />

                        </div>
                        <div id="Tab8" runat="server" visible="false" tabindex="8">
                            <uc1:Punto_Chequeo runat="server" ID="Punto_Chequeo" />
                        </div>
                    </div>
                    <%--<div class="wizard clearfix">
                        <div class="actions clearfix">
                            <ul role="menu" aria-label="Pagination">
                                <li class="disabled" aria-disabled="true"><a href="#previous" role="menuitem">Previous</a></li>
                                <li aria-hidden="false" aria-disabled="false"><a href="#next" role="menuitem">Next</a></li>
                                <li aria-hidden="true" style="display: none;"><a href="#finish" role="menuitem">Finish</a></li>
                            </ul>
                        </div>
                    </div>--%>
                </div>



            </div>

        </div>

    </div>

    <div allowoutsideclick: false class="modal fade" id="informacionprocesamiento" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-md modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Muestras en procesoo</h4>
                    <asp:LinkButton runat="server" Enabled="false" ID="BtnCerrarModalActualizar" class="close">
                            <span aria-hidden="true" aria-disabled="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <div class="modal-body">
                    <div class="content">
                        <div class="alert shadow">
                            <p>El servicio seleccionado tiene muestras en proceso, si desea continuar con el proceso presione el boton <b>"Continuar"</b>, de lo contrario presiona el boton <b>"Seleccionar muestras"</b>  para procesar otras muestras.</p>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <asp:LinkButton runat="server" OnClick="volver_Click" OnClientClick="showProgressBar();" ID="volver" ToolTip="Volver" class="btn btn-sm btn-danger text-white"> Volver <i class="fa fa-arrow-left"></i></asp:LinkButton>

                            </div>
                            <div class="col-md-6 text-right">
                                <asp:LinkButton runat="server" ID="LinkButton1" ToolTip="Seleccionar muestras" OnClientClick="showProgressBar();" class="btn btn-sm btn-success text-white"> Seleccionar muestras <i class="fa fa-arrow-right"></i></asp:LinkButton>

                            </div>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table id="table" class=" table-striped border  table   form-control-sm">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater runat="server" ID="tableprocesos">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <p>
                                                                Procesamiento <b>#
                                                                <asp:Label ID="TXTP" Text='<%# Eval("ID")%>' runat="server"></asp:Label></b>
                                                            </p>

                                                        </td>
                                                        <td class=" text-right">
                                                            <div class="  text-right">
                                                                <asp:LinkButton runat="server" ID="btnContunuarProces" OnClientClick="showProgressBar();" data-toggle="tooltip" title="Continuar" OnCommand="btnContunuarProces_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-primary text-white"> Continuar <i class="fa fa-arrow-right"></i></asp:LinkButton>
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
    <script type="text/javascript">
        function info() {


            $('#informacionprocesamiento').modal('show');

        }
    </script>
</div>
