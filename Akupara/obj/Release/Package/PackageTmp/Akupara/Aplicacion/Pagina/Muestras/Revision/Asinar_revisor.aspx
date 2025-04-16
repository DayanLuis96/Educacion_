<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Asinar_revisor.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Revision.Asinar_revisor" %>

<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/GestionResultados.ascx" TagPrefix="uc1" TagName="GestionResultados" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #BackgroundGeneral {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100002;
        }

        #progressGeneral {
            position: fixed;
            top: 20%;
            left: 20%;
            left: 20%;
            height: 50%;
            width: 50%;
            z-index: 100001;
            background-image: url('../../../../../assets/images/loading.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="BackgroundGeneral" style="display: none;"></div>
    <div id="progressGeneral" style="display: none;"></div>
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h4 class="mb-2">Muestras</h4>
            <div class="main-content-breadcrumb"><span>Asignar Revisor</span>  </div>
        </div>
        <div class="text-right col-md-1">
            <asp:LinkButton runat="server" ID="btnAtrasDetallestock" Visible="false" OnClick="btnAtrasDetallestock_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

        </div>
    </div>
    <asp:Panel runat="server" ID="PanelStockInventario" Visible="false">
        <uc1:GestionResultados runat="server" ID="GestionResultados" />
    </asp:Panel>
    <div runat="server" visible="true" id="divSolicitudes">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableS" class="table table-striped border   form-control-sm">
                            <thead>
                                <tr>

                                    <th>Solicitud</th>
                                    <th>Nombre cliente</th>
                                    <th>Fecha de solicitud</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="SolicitudesRealizadas">
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("TITULO")%>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label1" Text='<%# Eval("NOMBRE") %>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label3" Text='<%# Eval("FECHA_SOLICITUD") %>' runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtestado" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                            </td>
                                            <td class="text-center">
                                                <div class=" text-left">
                                                    <asp:LinkButton runat="server" ID="btnDetalleServicio" OnClientClick="showProgressGeneral();" data-toggle="tooltip" title="Ver detalles" OnCommand="btnvercotizacion_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-success"><i class="typcn typcn-th-list-outline"></i> Ver Detalles</asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="Btnvalidar" OnClientClick="showProgressGeneral();" data-toggle="tooltip" title="Validar Stock" OnCommand="Btnvalidar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-warning"><i class="typcn typcn-th-list-outline"></i> Validar Stock</asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnStokMuestras" OnClientClick="showProgressGeneral();" data-toggle="tooltip" title="Asignar Stock" OnCommand="btnStokMuestras_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-info"><i class="typcn typcn-th-list-outline"></i> Asignar Stock</asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnAsignar" OnClientClick="showProgressGeneral();" data-toggle="tooltip" title="Asignar Revisores" OnCommand="btnAsignar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-primary"><i class="typcn typcn-eye-outline"></i> Asignar Revisores</asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnverprefactura" OnClientClick="showProgressGeneral();" data-toggle="tooltip" title="Ver prefactura"  CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-secondary"><i class="typcn typcn-eye-outline"></i> Ver prefactura</asp:LinkButton>

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

    <asp:Panel runat="server" ID="PanelAnexosCargados" Visible="false">


        <div class="row">

            <div class="col-md-9">
                <p class="tx-12 text-muted mb-0"><span runat="server" id="nombrePerfilSpan" class="badge badge-secondary"></span></p>

            </div>
            <div class="text-right col-md-1">
                <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClientClick="showProgressGeneral();" OnClick="btnAtrasDetalle_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

            </div>

        </div>
        <div class="card-footer text-center">

            <div class="row" runat="server" id="divAsignarMuestras">
                <div class="col-md-1">
                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon113"># Muestras Disponibles</span> </div>

                    <span class="badge badge-danger">
                        <label runat="server" id="NumMuestras"></label>
                    </span>
                </div>
                <div class="col-md-5" runat="server" id="divCantidadMuestras">
                    <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon11">Cantidad Muestras Asignar *</span> </div>
                    <asp:TextBox runat="server" TextMode="Number" min="0" ID="txtCantidadMuestras" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="# Muestras" />

                </div>
                <div class="col-md-6 text-center">
                    <br />
                    <asp:LinkButton runat="server" ID="btnGuardarAnex1a" OnClick="btnGuardarAnex1a_Click" OnClientClick="showProgressGeneral();" class="btn btn-primary btn-rounded btn-block">Asignar Muestras</asp:LinkButton>
                    <br />
                </div>
            </div>
            <div runat="server" id="divAnexo1a" class="table-responsive">
                <p>Anexo 1a</p>
                <div class="row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <asp:Button runat="server" ID="ButtonMuestras" OnClick="ButtonMuestras_Click" CssClass="nav-link bg-primary active" Text="Muestras " />
                            </li>
                            <li class="nav-item">
                                <asp:Button runat="server" ID="ButtonLoci" OnClick="ButtonLoci_Click" CssClass="nav-link bg-secundary" Text="Loci" />
                            </li>
                            <li class="nav-item">
                                <asp:Button runat="server" ID="ButtonActaulizar1A" OnClick="ButtonActaulizar1A_Click" CssClass="nav-link btn active bg-success" Text="Actualizar Muestras" />
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="table-responsive" id="tabla1a" runat="server" visible="true">
                    <table id="tableSa" class="table table-sm table-striped  text-md-nowrap border">
                        <thead style="background-color: #565A5D; color: white">
                            <tr class="text-center">
                                <th style="background-color: #1C2833; color: white;" colspan="7">Información muestra</th>
                                <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                                <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>Observaciones</th>
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
                                                <label class="switch custom-switch">
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="btnCheck">
                                                                <asp:CheckBox Enabled="false" ID="ch_DetalleServicio" runat="server" />


                                                            </asp:LinkButton>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="btnCheck" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </label>

                                            </div>
                                            <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                            <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control  " ID="txtobservacion"></asp:TextBox>

                                        </td>
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
                                            <asp:TextBox ID="txtsecInteres" Text='<%# Eval("SECUENCIA_INTERES") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtnomForward" Text='<%# Eval("NOMBRE_FORWARD") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsecforward" Text='<%# Eval("SECUENCIA_FORWARD_5_3") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtnomReverse" Text='<%# Eval("NOMBRE_REVERSE") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsecreverse" Text='<%# Eval("SECUENCIA_REVERESE_5_3") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtconsentracion" Text='<%# Eval("CONSENTRACION") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLoci" Text='<%# Eval("LOCI") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttamaño" Text='<%# Eval("TAMAÑO") %>' runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomset" Text='<%# Eval("NOMBRE_SET") %>' runat="server"></asp:TextBox>
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

            <div runat="server" id="divAnexo1b" class="table-responsive">
                <p>Anexo 1b</p>
                <table id="tableSa" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D; color: white">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="11">Información muestra</th>
                            <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                            <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>Observaciones</th>
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
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="btnCheck1b">
                                                            <asp:CheckBox Enabled="false" ID="ch_DetalleServicio1b" runat="server" />


                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck1b" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
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

            <div runat="server" id="divAnexo2" class="table-responsive">
                <p>Anexo 2</p>
                <table id="tableSa" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D; color: white">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="6">Información muestra</th>
                            <th style="background-color: #808B96; color: white;" colspan="6">Secuenciación</th>
                        </tr>
                        <tr class="small form-control-sm">
                            <th></th>
                            <th>Observaciones</th>
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
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="btnCheck2">
                                                            <asp:CheckBox Enabled="false" ID="ch_DetalleServicio2" runat="server" />


                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck2" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
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

            <div runat="server" id="divAnexo3" class="table-responsive">
                <p>Anexo 3</p>
                <table id="tableSa" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D;">
                        <tr class="text-center">
                            <th style="background-color: #808B96; color: white;" colspan="12">Análisis de Fragmentos - Productos PCR</th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>Observaciones</th>
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
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="btnCheck3">
                                                            <asp:CheckBox Enabled="false" ID="ch_DetalleServicio3" runat="server" />


                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck3" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
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

            <div runat="server" id="divAnexo4" class="table-responsive">
                <p>Anexo 4</p>
                <table id="tableSa" class="table table-sm table-striped  text-md-nowrap border">
                    <thead style="background-color: #565A5D;">
                        <tr class="text-center">
                            <th style="background-color: #1C2833; color: white;" colspan="6">Información muestra</th>
                            <th style="background-color: #D5D8DC; color: white;" colspan="2">Ácidos Nucleicos</th>
                            <th style="background-color: #B2BABB; color: white;" colspan="2">Información reacción</th>
                            <th style="background-color: #808B96; color: white;" colspan="5">Información Primers/Cebadores</th>

                        </tr>

                        <tr>
                            <th></th>
                            <th>Observaciones</th>
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
                                            <label class="switch custom-switch">
                                                <asp:UpdatePanel runat="server">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")%>' ID="btnCheck4">
                                                            <asp:CheckBox Enabled="false" ID="ch_DetalleServicio4" runat="server" />


                                                        </asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnCheck4" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </label>

                                        </div>
                                        <asp:Label Visible="false" ID="txtest" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server"></asp:Label>
                                        <asp:Label Visible="false" ID="IDserv" Text=' <%# Eval("ID") %>' runat="server">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Text='<%# Eval("OBSERVACIONES")%>' CssClass="form-control " ID="txtobservacion"></asp:TextBox>

                                    </td>
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
        </div>




    </asp:Panel>

    <script type="text/javascript">
        function ModalDetalles() {
            $('#detalles').modal('show');
        }
    </script>

    <script type="text/javascript">
        function ModalPrefactura() {
            $('#prefactura').modal('show');
        }
    </script>

    <script type="text/javascript">
        function ModalUsuarios() {
            $('#usuarios').modal('show');
        }
    </script>

    <script type="text/javascript">

        function showProgressGeneral() {
            var progressBar = document.getElementById('progressGeneral');
            var Background = document.getElementById('BackgroundGeneral');

            // Guardar los estilos originales del elemento
            var originalDisplay = progressBar.style.display;
            var originalStyles = progressBar.getAttribute('style');

            var originalDisplay2 = Background.style.display;
            var originalStyles2 = Background.getAttribute('style');

            // Mostrar la barra de progreso
            progressBar.style.display = 'block';
            Background.style.display = 'block';

            // Ocultar la barra de progreso cuando la página haya terminado de cargar
            window.addEventListener('load', function () {
                progressBar.style.display = 'none';
                Background.style.display = 'none';

                // Restaurar los estilos originales del elemento
                progressBar.style.display = originalDisplay;
                progressBar.setAttribute('style', originalStyles);


                Background.style.display = originalDisplay2;
                Background.setAttribute('style', originalStyles2);
            });
        }


    </script>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div allowoutsideclick: false class="modal fade" id="detalles" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class=" modal-xl   modal-dialog ">
                    <div class="modal-xl modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabelsss">Detalles</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <asp:Panel runat="server" Visible="false" ID="panelEstadosMuestras">

                                <table id="tablecotizacionesMuestras" class="table table-sm rouded shadow table-striped mg-b-1 text-md-nowrap border table-sm">
                                    <thead style="background-color: #565A5D;">
                                        <tr>

                                            <th>Estados</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater runat="server" ID="DetallecotizacionMuestras">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label Visible="false" ID="IDEstadoMuestra" Text=' <%# Eval("ESTADO_MUESTRA") %>' runat="server">
                                                        </asp:Label>
                                                    </td>


                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </asp:Panel>

                            <div class="card">
                                <div class="card-header pb-0">
                                    <div class="d-flex justify-content-between">
                                        <h4 class="card-title mb-2 mt-2">Detalle Cotización</h4>
                                    </div>
                                </div>

                                <div class="row small">
                                    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12 small">

                                        <div>
                                            <div class="card-body ">
                                                <p class="tx-12 text-muted ">Información del contacto</p>
                                                <hr class="m-0" />
                                                <div class="pd-15  bg-gray-200 formlayout">
                                                    <div class="row row-sm ">
                                                        <div class="col-lg-6">
                                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre  *</span> </div>
                                                            <asp:TextBox runat="server" Enabled="false" ID="txtNombreCompleto" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Nombre completo" type="text" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                ControlToValidate="txtNombreCompleto" Display="Dynamic" ForeColor="Red"
                                                                ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Identificación  *</span> </div>
                                                            <asp:TextBox runat="server" Enabled="false" ID="txtIdentificacion" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Identificación" type="text" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                ControlToValidate="txtIdentificacion" Display="Dynamic" ForeColor="Red"
                                                                ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon3">Telefono  *</span> </div>
                                                            <asp:TextBox runat="server" Enabled="false" ID="txtTelefono" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Telefono" type="number" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                ControlToValidate="txtTelefono" Display="Dynamic" ForeColor="Red"
                                                                ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon4">Correo  *</span> </div>
                                                            <asp:TextBox runat="server" Enabled="false" ID="txtCorreo" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Correo" type="text" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                ControlToValidate="txtCorreo" Display="Dynamic" ForeColor="Red"
                                                                ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" BorderColor="Red" ValidationGroup="CrearSolicitud" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo" ErrorMessage="<i class='fa fa-info-circle'></i> Formato de Correo Invalido"></asp:RegularExpressionValidator>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon5">Universidad /Institución *</span> </div>
                                                            <asp:TextBox runat="server" Enabled="false" ID="txtUniversidad" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control" placeholder="Universidad /Institución" type="text" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                                ControlToValidate="txtUniversidad" Display="Dynamic" ForeColor="Red"
                                                                ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="card-header m-0 pb-0">
                                                <p class="tx-12 text-muted mb-0">Servicios Seleccionados <span class="badge badge-secondary">(Selección múltiple)</span></p>
                                                <hr />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:ListView ID="ListaDetalleCotizacion" runat="server" GroupPlaceholderID="groupPlaceHolder1"
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
                                                <div class="main-content-breadcrumb">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<b class="text-bold"><%#Eval("NOMBRESERVICIO")%></b> </div>
                                            </div>

                                            <div class=" m-0">

                                                <div class="table-responsive table-card mt-3 mb-1">
                                                    <div class=" pb-0">
                                                        <p class="tx-12 text-muted mb-0"><span class="badge badge-primary">(Detalles)</span></p>
                                                    </div>
                                                    <table id="tablecotizaciones" class="table table-sm rouded shadow table-striped mg-b-1 text-md-nowrap border table-sm">
                                                        <thead style="background-color: #565A5D;">
                                                            <tr>

                                                                <th>Nombre de la unidad</th>
                                                                <th>Cantidad</th>
                                                                <th>Tipo de unidad</th>
                                                                <th>Valor unitario</th>

                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <asp:Repeater runat="server" ID="Detallecotizacion">
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

                                                                                <asp:TextBox runat="server" ID="txtCantidadService" TextMode="Number" Text='<%# Eval("CANTIDAD")%>' CssClass="form-control" />

                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label1" Text='<%# Eval("UNIDAD_MEDIDA") %>' runat="server"> </asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <div class="handle-counter" id="valorunt">
                                                                                <asp:TextBox ID="txtvalorunitario" Enabled="false" format="{0:N}" Text='<%# Eval("VALOR_UNITARIO") %>' runat="server" CssClass="form-control">  </asp:TextBox>
                                                                            </div>
                                                                        </td>

                                                                        <td>

                                                                            <asp:Label runat="server" ID="txtestado" Text='<%# Eval("ESTADO")%>' CssClass="alert form-control-sm small alert-primary" />

                                                                            <label runat="server" class="badge badge-pill badge-secondary" id="MensajeClass">
                                                                                <asp:Label runat="server" ID="MensajeText"></asp:Label>

                                                                            </label>
                                                                            <asp:UpdatePanel runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:LinkButton runat="server" Visible='<%# Eval("plantillas") %>' OnClientClick="showProgressGeneral();" CssClass="btn btn-warning btn-sm" data-toggle="tooltip" title="Plantilla" ID="lbn_PlantillaT" OnCommand="btnrevisar_Command" CommandArgument='<%#Eval("ID")%>'><div class="avatar avatar-xs bg-warning rounded-circle"><i class="fa fa-plus-circle fa-2x"></i> </div></asp:LinkButton>
                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="lbn_PlantillaT" />
                                                                                </Triggers>

                                                                            </asp:UpdatePanel>

                                                                        </td>
                                                                        <td>

                                                                            <asp:UpdatePanel runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:LinkButton runat="server" ID="btnValidarMuestras" OnClientClick="showProgressGeneral();" OnCommand="btnValidarMuestras_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-indigo btn-rounded btn-block">Notificar Cliente</asp:LinkButton>

                                                                                    <asp:LinkButton runat="server" ID="btnContinuarProceso" OnClientClick="showProgressGeneral();" OnCommand="btnContinuarProceso_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-secondary btn-rounded btn-block">Continuar Procesamiento</asp:LinkButton>

                                                                                </ContentTemplate>
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="btnValidarMuestras" />
                                                                                    <asp:PostBackTrigger ControlID="btnContinuarProceso" />
                                                                                </Triggers>

                                                                            </asp:UpdatePanel>

                                                                        </td>
                                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                            <ContentTemplate>

                                                                                <%-- <asp:LinkButton ID="btnDetallePlatilla" runat="server" Visible="false">
                                                        <tr class="child">
                                                            <td class="child" colspan="4">
                                                                <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                                    <div class="card card-warning">
                                                                        <div class="card-header pb-0">
                                                                            <h5 class="card-title mb-0 pb-0">Adjuntar plano</h5>
                                                                        </div>
                                                                        <div class="card-body text-warning">

                                                                            <ul data-dtr-index="18" class="dtr-details">
<%--                                                                                <li data-dtr-index="4" data-dt-row="18" data-dt-column="4"><span class="dtr-title">PLANO:</span> <span class="dtr-data">Nombre de la Plantilla</span></li>--%>
                                                                                <%--                                                                                <li data-dtr-index="5" data-dt-row="18" data-dt-column="5"><span class="dtr-title">PLANO:</span> <span class="dtr-data">-Descargar Plantilla para diligenciar</span></li>--%>
                                                                                <%-- </ul>
                                                                        </div>
                                                                        <div class="card-footer">

                                                                        </div>
                                                                    </div>
                                                                </div>


                                                            </td>
                                                        </tr>
                                                            </asp:LinkButton>--%>
                                                                            </ContentTemplate>
                                                                            <%-- <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="lbn_PlantillaT" />
                                                        </Triggers>--%>
                                                                        </asp:UpdatePanel>

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
                                <div class="row text-center">
                                    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <br />

                                                <asp:LinkButton runat="server" ID="BtnConfirmarRevision" OnClientClick="showProgressGeneral();" OnClick="BtnConfirmarRevision_Click" class="btn btn-success btn-rounded ">
                                Confirmar Procesamiento
                                                </asp:LinkButton>

                                                <br />

                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BtnConfirmarRevision" />
                                            </Triggers>

                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="pd-30 pb-5 pd-sm-40 bg-gray-200 formlayout">
                                        <div class="row row-xs align-items-center mg-b-20">
                                            <div class="col-md-4">
                                                <label class="form-label font-weight-bold mg-b-0">Asunto *</label>
                                            </div>
                                            <div class="col-md-8 mg-t-5 mg-md-t-0">
                                                <asp:TextBox runat="server" Enabled="false" ID="txtTituloSolicitud" CssClass="form-control" placeholder="Asunto" type="text" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                    ControlToValidate="txtTituloSolicitud" Display="Dynamic" ForeColor="Red"
                                                    ValidationGroup="CrearSolicitud"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row row-xs align-items-center mg-b-20">
                                            <div class="col-md-4">
                                                <label class="form-label font-weight-bold mg-b-0">Comentarios</label>
                                            </div>
                                            <div class="col-md-8 mg-t-5 mg-md-t-0">
                                                <asp:TextBox runat="server" Enabled="false" ID="txtComentariosSolicitud" Rows="5" TextMode="MultiLine" CssClass="form-control" placeholder="Comentarios" type="text" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div allowoutsideclick: false class="modal fade" id="prefactura" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class=" modal-xl   modal-dialog ">
                    <div class="modal-xl modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Enviar prefactura</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">

                            <asp:Panel runat="server" Height="320px" ID="panel1">


                                <iframe name="iframe" id="pdfViewer" src='<%= Session["PRE_FACT"] %>' onscroll="true" style="width: 100%; height: 320px; border: none"></iframe>

                            </asp:Panel>



                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <br />

                                    <asp:LinkButton runat="server" ID="BtnEnviarPRefactura" OnClientClick="showProgressGeneral();" OnClick="BtnEnviarPRefactura_Click" class="btn btn-success btn-rounded ">
                                        Enviar y continuar 
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="Btncerrar" data-dismiss="modal" aria-label="Close" class="btn btn-danger btn-rounded ">
                                     Cancelar 
                                    </asp:LinkButton>

                                    <br />

                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="BtnEnviarPRefactura" />
                                </Triggers>

                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>

    </asp:UpdatePanel>

    <div allowoutsideclick: false class="modal fade" id="usuarios" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-lg   modal-dialog ">
            <div class="modal-lg modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabels">Usuarios</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="card-body ">
                        <p class="tx-12 text-muted ">Configurar Revisores</p>
                        <hr class="m-0" />
                        <div class="pd-15  bg-gray-200 small formlayout">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row row-sm ">
                                        <div class="col-lg-6">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0">Perfil  *</span> </div>
                                            <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="txtperil_SelectedIndexChanged" ID="txtperil" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control select2 form-contol-sm" placeholder="Perfil" type="text"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtperil" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="AgregarRevisores"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0">Usuario  *</span> </div>
                                            <asp:DropDownList runat="server" ID="txtusuario" aria-describedby="basic-addon1" aria-label="Username" CssClass="form-control select2 form-contol-sm" placeholder="Usuario" type="text"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtusuario" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="AgregarRevisores"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="txtperil" />
                                </Triggers>
                            </asp:UpdatePanel>



                            <hr />
                            <div class="col-md-12 text-center">
                                <asp:LinkButton runat="server" ID="btnAgregar" ValidationGroup="AgregarRevisores" OnClick="btnAgregar_Click" class="btn btn-primary btn-rounded "> <i class="fa fa-arrow-down"></i> Configurar
                                </asp:LinkButton>
                            </div>

                            <div class="col-md-12">
                                <asp:GridView ID="tablaconsultar" runat="server" OnRowDeleting="tablaconsultar_RowDeleting" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NOMBRE" ItemStyle-CssClass="small" HeaderText="Usuario Revisor" ReadOnly="True" SortExpression="NOMBRE" />


                                        <asp:TemplateField HeaderText="Acciones" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <div class="text-center">
                                                    <asp:LinkButton runat="server" OnClientClick="if (!window.confirm('Desea eliminar el servicio seleccionado?')) return false;" ToolTip="Eliminar" CssClass="btn btn-outline-danger btn-sm" CommandName="delete"><i class='fa fa-trash  fa-2x'></i> </asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnAsignarMuestrasUSuario" ToolTip="Asignar Muestras" OnClientClick="showProgressGeneral();" OnCommand="btnAsignarMuestrasUSuario_Command" CommandArgument='<%#Eval("ID")%>' CssClass="btn btn-outline-warning btn-sm"><i class='fa fa-flask fa-2x'></i> </asp:LinkButton>
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
    </div>


</asp:Content>
