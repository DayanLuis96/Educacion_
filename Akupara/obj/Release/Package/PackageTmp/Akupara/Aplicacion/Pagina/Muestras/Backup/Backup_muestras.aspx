<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Backup_muestras.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Backup.Backup_muestras" %>

<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Backup/CargueResultadoMuestra.ascx" TagPrefix="uc1" TagName="CargueResultadoMuestra" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Backup/DetalleMuestras_.ascx" TagPrefix="uc1" TagName="DetalleMuestras_" %>
<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Backup/CargueFinalResultadosCrudos.ascx" TagPrefix="uc1" TagName="CargueFinalResultadosCrudos" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #UpdateProgressContainer {
            position: absolute;
            z-index: 9999;
        }

        #Background {
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

        #progressBar {
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

        .border-b1 {
            border-bottom: 1px solid;
        }

        #notiContent {
            height: 200px;
            overflow: auto;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
        }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                left: 2px;
                bottom: 2px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #94B43B;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #94B43B;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(20px);
            -ms-transform: translateX(20px);
            transform: translateX(20px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 30px;
        }

            .slider.round:before {
                border-radius: 50%;
            }

        .btn-redon {
            border-radius: 100%;
            height: 2.5rem;
            width: 2.5rem;
            font-size: 1rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="Background" style="display: none;"></div>
    <div id="progressBar" style="display: none;">
    </div>
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h4 class="mb-2">Muestras</h4>
            <div class="main-content-breadcrumb"><span>Backup de muestras</span>  </div>
        </div>
    </div>

    <div class="row row-sm" runat="server" id="divCajasnave">
        <div class="col-lg-6 col-xl-4 col-md-6 col-12" runat="server" id="divConsultar">
            <div class="card">
                <div class="card-body">
                    <div class="">
                        <h5 class="tx-13 mb-3">Consultar</h5>
                    </div>
                    <div class="d-flex">

                        <asp:LinkButton runat="server" OnClientClick="showProgressBar();" OnClick="BtnPest1_Click" ID="BtnPest1" CssClass="d-flex btn ripple btn-outline-light btn-lg btn-block">  Muestras Cargadas
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <!-- End col -->
        <div class="col-lg-6 col-xl-4 col-md-6 col-12" runat="server" id="divCargarMuestras">
            <div class="card">
                <div class="card-body">
                    <div class="">
                        <h5 class="tx-13 mb-3">Cargar</h5>
                    </div>
                    <div class="d-flex">
                        <asp:LinkButton runat="server" OnClientClick="showProgressBar();" ID="BtnPest2" OnClick="BtnPest2_Click" CssClass="d-flex btn ripple btn-outline-light btn-lg btn-block">   Muestras global
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <!-- End col -->
        <div class="col-lg-6 col-xl-4 col-md-6 col-12" runat="server" id="divCargarResultados" visible="false">
            <div class="card">
                <div class="card-body">
                    <div class="">
                        <h5 class="tx-13 mb-3">Cargar</h5>
                    </div>
                    <div class="d-flex">
                        <asp:LinkButton runat="server" OnClientClick="showProgressBar();" ID="BtnPest3" CssClass="d-flex btn ripple btn-outline-light btn-lg btn-block" OnClick="BtnPest3_Click"> Resultados masivos
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row row-sm">
        <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12">
            <div class="card">


                <div class="container-fluid">
                    <asp:MultiView runat="server" ID="vistas" ActiveViewIndex="0">

                        <asp:View runat="server">
                            <asp:Panel ID="PanelInformativo" runat="server">

                                <div class="row row-sm">

                                    <div class="col-lg-6 col-xl-6 col-md-6 col-12" runat="server" id="div1">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="">
                                                    <h5 class="tx-13 mb-3">CON RESULTADOS</h5>
                                                </div>
                                                <div class="d-flex">

                                                    <asp:TextBox runat="server" Enabled="false" CssClass="d-flex btn ripple btn-outline-light btn-lg btn-block" Text="#E8ED4C" TextMode="Color" Font-Size="20px"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-xl-6 col-md-6 col-12" runat="server" id="div2">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="">
                                                    <h5 class="tx-13 mb-3">SIN RESULTADOS</h5>
                                                </div>
                                                <div class="d-flex">

                                                    <asp:TextBox runat="server" CssClass="d-flex btn ripple btn-outline-light btn-lg btn-block" Enabled="false" Text="#F2F3F4" TextMode="Color" Font-Size="20px"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </asp:Panel>
                            <div class="row" runat="server" id="divPrincipalMuestras">
                                <div class="col-md-12">
                                    <h5>Resultado Muestras: </h5>


                                    <hr class="m-0" />
                                    <div class=" badge rounded bg-secondary text-center">
                                        <span class="text-white">FILTROS:</span>
                                    </div>
                                    <hr class="m-0" />

                                </div>

                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">ID_CAMPO </span></div>
                                        <asp:TextBox runat="server" ID="txtCampo" class="form-control form-control-sm " />

                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Fecha de muestra: </span></div>
                                        <asp:TextBox runat="server" ID="txtfechamuestra" class="form-control form-control-sm " />

                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Especie: </span></div>
                                        <asp:DropDownList runat="server" ID="ddlEspecie" class="form-control select2 form-control-sm "></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Sitio: </span></div>
                                        <asp:DropDownList runat="server" ID="ddlsitio" class="form-control select2 form-control-sm "></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Sitio Ljgm: </span></div>
                                        <asp:DropDownList runat="server" ID="ddlsitioLJGM" class="form-control select2 form-control-sm "></asp:DropDownList>

                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Tipo Resultado: </span></div>
                                        <asp:DropDownList runat="server" ID="ddlTipoRESULTADO" class="form-control select2 form-control-sm "></asp:DropDownList>

                                    </div>
                                </div>

                                <div class="col-md-12 text-center pb-2">
                                    <asp:LinkButton runat="server" ID="btnAplicarfil" OnClientClick="showProgressBar();" OnClick="btnAplicarfil_Click" CssClass=" btn-primary btn-rounded btn btn-sm"> Aplicar filtro</asp:LinkButton>
                                </div>
                                <div class="col-md-12 col-ms-12">
                                    <label class="m-0 font-weight-bold text-primary align-middle col-6">RESULTADOS: <span runat="server" id="spanCount" class="badge badge-danger">0</span></label>
                                    <div class="box-tools float-right">
                                        <div class="dropdown d-inline-block">
                                            <button type="button" aria-haspopup="true" aria-expanded="false"
                                                data-toggle="dropdown" class="mb-2 dropdown-toggle btn btn-primary">
                                                Descargar
                                            </button>
                                            <div tabindex="-1" role="menu" aria-hidden="false"
                                                class="dropdown-menu-right dropdown-menu-rounded dropdown-menu" style="width: 350px">
                                                <asp:LinkButton ID="btnPackExcel" runat="server" CssClass="dropdown-item btn-info" TabIndex="0" CommandArgument="1" OnClick="btnPackExcel_Click"> <i class="lnr-download dropdown-icon "></i>  <span>REPORTE RESULTADOS</span></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel runat="server" ID="panal1" ScrollBars="Auto" Height="500px" Width="100%">
                                      <div class="col-md-12 ">
                                    <div class="table-responsive">
                                        <table id="table" class=" table table-sm table-striped  text-md-nowrap border">
                                            <thead>
                                                <tr>
                                                    <th style="color: white; background: #565A5D;">ID CAMPO</th>
                                                    <th style="color: white; background: #565A5D;">FECHA MUESTRA</th>
                                                    <th style="color: white; background: #565A5D;">SITIO</th>
                                                    <th style="color: white; background: #565A5D;">SITIO LJGM</th>
                                                    <th style="color: white; background: #565A5D;">ESPECIE</th>
                                                    <th style="color: white; background: #565A5D;">ENTREGA</th>
                                                    <th style="color: white; background: #565A5D;">SECTOR</th>
                                                    <th style="color: white; background: #565A5D;"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater runat="server" ID="AdjuntosRepeter">
                                                    <ItemTemplate>
                                                        <tr style="background-color: <%# Eval("Color") %>">
                                                            <td>
                                                                <asp:Label ID="Tidmuestra" Text='<%# Eval("ID_CAMPO")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label4" Text='<%# Eval("FECHA_MUESTRA")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label2" Text='<%# Eval("SITIO")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label3" Text='<%# Eval("SITIO_LJGM")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1" Text='<%# Eval("ESPECIE")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label6" Text='<%# Eval("ENTRAGA")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label5" Text='<%# Eval("SECTOR")%>' runat="server"></asp:Label>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class=" text-left">
                                                                    <asp:LinkButton runat="server" ID="btncargarresultados" ToolTip="Cargarresultados" OnCommand="btncargarresultados_Command" OnClientClick="showProgressBar();" CommandArgument='<%#Eval("ID")+ ";" + Eval("ID_CAMPO")%>' class="btn btn-sm btn-primary"><i class="fa fa-doc fa-1x"></i>Detalle Muestra</asp:LinkButton>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                </asp:Panel>
                              
                            </div>

                            <div class="row" runat="server" id="divDetalleMuestras">
                                <div class="col-md-12 alert-info">
                                    <div class="row">
                                        <div class="col-md-11">
                                            <div class=" badge rounded bg-secondary text-center">
                                                <span class="text-white">DETALLE MUESTRA</span>
                                            </div>
                                        </div>

                                        <div class="col-md-1">
                                            <asp:LinkButton runat="server" OnClientClick="showProgressBar();" ID="btnAtras" OnClick="btnAtras_Click" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>

                                        </div>
                                    </div>
                                    <hr class="m-1" />
                                    <uc1:DetalleMuestras_ runat="server" ID="DetalleMuestras_" />
                                </div>
                                <div class="col-md-12">
                                    <%--                                    <h5>Cargar resultados Masivos</h5>--%>
                                    <div class=" badge rounded bg-secondary text-center">
                                        <span class="text-white">CARGAR RESULTADOS MUESTRA</span>
                                    </div>
                                    <hr class="m-1" />
                                    <uc1:CargueResultadoMuestra runat="server" ID="CargueResultadoMuestra1" />
                                </div>
                            </div>
                        </asp:View>
                        <asp:View runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <%--                                    <h5>Cargar resultados masivos</h5>--%>

                                    <div class=" badge rounded bg-secondary text-center">
                                        <span class="text-white">Cargar Soportes Generales</span>
                                    </div>
                                    <hr class="m-1" />
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>

                                            <div class="ff_fileupload_wrap">
                                                <div class="ff_fileupload_dropzone_wrap">
                                                    <div class="col-xs-12 col-sm-12" style="margin-bottom: 1%">

                                                        <div class="form-group " style="text-align: center;">
                                                            <asp:FileUpload ID="ArchivoExcel" Multiple="Multiple" AllowMultiple="true" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="BtnGuardarmuestras" />
                                        </Triggers>

                                    </asp:UpdatePanel>
                                    <asp:LinkButton runat="server" ID="BtnGuardarmuestras" OnClientClick="showProgressBar();" OnClick="BtnGuardarmuestras_Click" ValidationGroup="AdjuntosFile" class="btn btn-secondary btn-rounded btn-block">Adjuntar plano</asp:LinkButton>


                                </div>
                            </div>
                        </asp:View>
                        <%--CARGUE RESULTADOS POR MUESTRAS, MASIVO--%>
                        <asp:View runat="server">
                            <div class="row">
                                <div class="col-md-6 alert-danger">
                                    <%--                                    <h5>Cargar resultados Masivos</h5>--%>
                                    <div class=" badge rounded bg-secondary text-center">
                                        <span class="text-white">CARGAR RESULTADOS MASIVOS</span>
                                    </div>
                                    <hr class="m-1" />
                                    <uc1:CargueResultadoMuestra runat="server" ID="CargueResultadoMuestra" />
                                </div>

                                <div class="col-md-6 alert-info">
                                    <%--                                    <h5>Cargar resultados Masivos</h5>--%>
                                    <div class=" badge rounded bg-secondary text-center">
                                        <span class="text-white">CARGAR RESULTADOS MASIVOS FASE 2 - (CRUDOS)</span>
                                    </div>
                                    <hr class="m-1" />
                                    <uc1:CargueFinalResultadosCrudos runat="server" ID="CargueFinalResultadosCrudos" />
                                </div>
                            </div>

                        </asp:View>
                    </asp:MultiView>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">

        function showProgressBar() {
            var progressBar = document.getElementById('progressBar');
            var Background = document.getElementById('Background');

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


</asp:Content>
