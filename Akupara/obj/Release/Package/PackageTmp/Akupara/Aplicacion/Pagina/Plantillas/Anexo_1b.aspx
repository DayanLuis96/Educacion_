<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anexo_1b.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Plantillas.Anexo_1b" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Akupara</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <!--- Favicon -->
    <link rel="icon" href="<%=ResolveClientUrl("../../../assets/img/LOGO.png")%>" type="image/x-icon">
    <!--- Icons css -->
    <link href="<%=ResolveClientUrl("../../../assets/css/icons.css")%>" rel="stylesheet">
    <!--- Right-sidemenu css -->
    <link href="<%=ResolveClientUrl("../../../assets/plugins/sidebar/sidebar.css")%>" rel="stylesheet">
    <!--- Custom Scroll bar -->
    <link href="<%=ResolveClientUrl("../../../assets/plugins/mscrollbar/jquery.mCustomScrollbar.css")%>" rel="stylesheet">
    <!--- Style css -->
    <link rel="stylesheet" type="text/css" media="all" href="<%=ResolveClientUrl("../../../assets/css/style.css")%>">
    <!-- Colors css -->
    <link id="theme" rel="stylesheet" type="text/css" media="all" href="<%=ResolveClientUrl("../../../assets/css/colors/color.css")%>">
    <!--- Skinmodes css -->
    <link href="<%=ResolveClientUrl("../../../assets/css/skin-modes.css")%>" rel="stylesheet">
    <!--- Darktheme css -->
    <link href="<%=ResolveClientUrl("../../../assets/css/style-dark.css")%>" rel="stylesheet">
    <!--- Sidemenu css -->
    <link rel="stylesheet" href="<%=ResolveClientUrl("../../../assets/css/sidemenu/sidemenu.css")%>">
    <!--  Map css-->
    <link href="<%=ResolveClientUrl("../../../assets/plugins/jqvmap/jqvmap.min.css")%>" rel="stylesheet">
    <!-- Sidemenu-respoansive-tabs css -->
    <link href="<%=ResolveClientUrl("../../../assets/css/sidemenu/sidemenu-responsive-tabs.css")%>" rel="stylesheet">
    <!-- Switcher css-->
    <link href="<%=ResolveClientUrl("../../../assets/switcher/css/switcher.css")%>" rel="stylesheet">
    <link href="<%=ResolveClientUrl("../../../assets/switcher/demo.css")%>" rel="stylesheet">

    <!--- Animations css -->
    <link href="<%=ResolveClientUrl("../../../assets/css/animate.css")%>" rel="stylesheet">
    <link href="<%=ResolveClientUrl("../../../assets/plugins/line-awesome/css/line-awesome.css")%>" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("../../../assets/plugins/simple-line-icons/simple-line-icons.css")%>" rel="stylesheet" />
    <link href="../../../assets/plugins/boxicons/css/boxicons.css" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("../../../../Content/Mensaje_Modal/sweetalert.min.css")%>" rel="stylesheet" />
    <script src="<%=ResolveClientUrl("../../../../Content/Mensaje_Modal/sweetalert.min.js")%>"></script>

    <style type="text/css">
        <!-- input, textarea {
            -webkit-touch-callout: default;
            -webkit-user-select: auto;
            -khtml-user-select: auto;
            -moz-user-select: text;
            -ms-user-select: text;
            user-select: text
        }

        * {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: -moz-none;
            -ms-user-select: none;
            user-select: none
        }
    </style>
    <style type="text/css" media="print">
        /*  <!-- body {
            display: none
        }
        -->*/
    </style>
    <!--[if gte IE 5]><frame></frame><![endif]-->
    <script src="<%=ResolveClientUrl("https://www.spruko.com/demo/admix/Admix/assets/plugins/ionicons/ionicons/ionicons.suuqn5vt.js")%>" type="module" crossorigin="true" data-resources-url="https://www.spruko.com/demo/admix/Admix/assets/plugins/ionicons/ionicons/" data-namespace="ionicons"></script>
    <style type="text/css">
        /* Chart.js */
        @-webkit-keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }

            to {
                opacity: 1
            }
        }

        @keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }

            to {
                opacity: 1
            }
        }

        .chartjs-render-monitor {
            -webkit-animation: chartjs-render-animation 0.001s;
            animation: chartjs-render-animation 0.001s;
        }
    </style>
    <style type="text/css">
        .jqstooltip {
            position: absolute;
            left: 0px;
            top: 0px;
            visibility: hidden;
            background: rgb(0, 0, 0) transparent;
            background-color: rgba(0,0,0,0.6);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
            color: white;
            font: 10px arial, san serif;
            text-align: left;
            white-space: nowrap;
            padding: 5px;
            border: 1px solid white;
            box-sizing: content-box;
            z-index: 10000;
        }

        .jqsfield {
            color: white;
            font: 10px arial, san serif;
            text-align: left;
        }
    </style>
    <link href="<%=ResolveClientUrl("../../../assets/plugins/boxicons/css/boxicons.css")%>" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("../../../assets/plugins/flag-icon-css/css/flag-icon.min.css")%>" rel="stylesheet" />
    <script src="<%=ResolveClientUrl("../../../assets/plugins/ionicons/ionicons.js")%>"></script>
    <link href="<%=ResolveClientUrl("../../../assets/plugins/ionicons/css/ionicons.min.css")%>" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("../../../assets/plugins/fontawesome-free/css/all.min.css")%>" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("../../../assets/font-awesome.css")%>" rel="stylesheet" />
    <script src="<%=ResolveClientUrl("../../../assets/fontawesome.js")%>"></script>
    <style>
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
</head>

<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-12">
                <div class="mb-0 mb-lg-0 mb-xl-0 alert alert-success">
                    <small>En este apartado debes diligenciar la información de la muestra, tienes dos opciones para hacerlo, de forma manual o a traves del adjunto en excel, es indispensable que la información este debidamente diligenciada y completa, para que no sea causa de devolución, este es el anexo <span class="h4">1B</span></small>
                </div>
            </div>
        </div>
        <div class="card-header">
            <div class="row pb-0">

                <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">

                    <b>Información muestra</b>

                    <div class=" bx-border">
                        <div class="row">
                            <div class="col-md-3">
                                <div class=" input-group">
                                    <label class="switch" data-toggle="tooltip" title="plano">
                                        <asp:CheckBox ID="Crekplantillas" AutoPostBack="true" OnCheckedChanged="Crekplantillas_CheckedChanged" runat="server" />
                                        <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2 small"></span></span>

                                    </label>
                                    <b class="m-2">Adjuntar archivo</b>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class=" input-group">
                                    <label class="switch" data-toggle="tooltip" title="plano">
                                        <asp:CheckBox ID="Checkmanual" AutoPostBack="true" OnCheckedChanged="Checkmanual_CheckedChanged" runat="server" />
                                        <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2 small"></span></span>
                                    </label>
                                    <b class="m-2">Cargue manual</b>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-12" runat="server" id="divFilePlantilla" visible="false">
                            <br />
                            <div class="ff_fileupload_wrap">
                                <div class="ff_fileupload_dropzone_wrap">
                                    <div class="col-xs-12 col-sm-12" style="margin-bottom: 1%">

                                        <div class="form-group " style="text-align: center;">

                                            <asp:FileUpload ID="ArchivoExcel" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                            <%--                                                        <asp:RequiredFieldValidator ValidationGroup="CrearDetalleServicio" Display="Dynamic" ID="RequiredFieldValidator74" runat="server" CssClass="alert-danger" ErrorMessage="<i class='bi bi-info-circle-fill'></i> El anexo es obligatorio .xlsx" ControlToValidate="ArchivoExcel" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                                ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                ValidationExpression="^.+\.(xlsx)$" ValidationGroup="CrearDetalleServicio" ControlToValidate="ArchivoExcel" />
                                            <br />

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:LinkButton runat="server" OnCommand="Unnamed_Command" CssClass="btn btn-sm btn-success"> <i class="spinner-border spinner-border-sm"></i> Cargar</asp:LinkButton>


                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="cargManual" runat="server" visible="false">
                        <hr class="bg-success m-1" />
                        <div class="pd-15  bg-gray-200 small formlayout">
                            <h6 class="card-title mb-0 pb-0">
                                <div class="row row-sm">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre plato *</span> </div>
                                            <asp:TextBox runat="server" ID="txtnombreplato" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Nombre del plato" type="text" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtnombreplato" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Pozo *</span> </div>
                                            <asp:TextBox runat="server" ID="txtpozo" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Pozo" type="text" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtpozo" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">ID muestra *</span> </div>
                                            <asp:TextBox runat="server" ID="txtIDmuestra" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Identificador de la muestra" type="text" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtIDmuestra" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Organismo *</span> </div>
                                            <asp:DropDownList runat="server" ID="txtorganismo" class="form-control select2 form-control-sm" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtorganismo" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Especie *</span> </div>
                                            <asp:TextBox runat="server" ID="txtespecie" class="form-control form-control-sm"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtespecie" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Tipo muestra *</span> </div>
                                            <asp:DropDownList runat="server" ID="txttipomuestra" class="form-control select2 form-control-sm" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txttipomuestra" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class=" font-weight-bold mg-b-0" id="basic-addon2">Estado *</span> </div>
                                            <asp:DropDownList runat="server" ID="txtestado" class="form-control select2 form-control-sm" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtestado" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Conc (ng/uL) *</span> </div>
                                            <asp:TextBox runat="server" ID="txtconc" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Concentración (ng/uL)" type="text" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtconc" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Volumen (uL) *</span> </div>
                                            <asp:TextBox runat="server" ID="txtvolumenUl" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" placeholder="Volumen (uL)" type="text" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtvolumenUl" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearArticulo"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </h6>
                        </div>

                        <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                            <div class="pd-15  bg-gray-200 small formlayout">
                                <div class="card card-warning">
                                    <div class="card-header pb-0">
                                        <div class="pd-15  bg-gray-200 small formlayout">
                                            <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                <b>Secuenciación</b>

                                                <div class="card card-secondary">
                                                    <div class="card-header pb-0">
                                                        <h6 class="card-title mb-0 pb-0">
                                                            <div class="row row-sm">
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Rango</span> </div>
                                                                        <asp:TextBox runat="server" ID="txtrango" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Secuencia interés</span> </div>
                                                                        <asp:TextBox runat="server" ID="txtsecuenciaInteres" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre Forward </span></div>
                                                                        <asp:TextBox runat="server" ID="txtnombreForward" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Secuencia Forward (5´-3´) </span></div>
                                                                        <asp:TextBox runat="server" ID="txtsecuenciaForward5_3" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre Reverese </span></div>
                                                                        <asp:TextBox runat="server" ID="txtNombreReverse" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Secuencia Reverse (5´-3´) </span></div>
                                                                        <asp:TextBox runat="server" ID="txtSecuenciaReverse" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Concentración (ng/uL)</span> </div>
                                                                        <asp:TextBox runat="server" ID="txtconsentracion" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm " type="text" />

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </h6>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                                                <b>Análisis Fragmentos</b>

                                                <div class="card card-secondary">
                                                    <div class="card-header pb-0">

                                                        <h6 class="card-title mb-0 pb-0">
                                                            <div class="row row-sm">
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">#Loci</span> </div>
                                                                        <asp:TextBox runat="server" ID="txtloci" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Tamaño (pb)</span> </div>
                                                                        <asp:TextBox runat="server" ID="txttamaño" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" type="text" />

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Nombre set </span></div>
                                                                        <asp:TextBox runat="server" ID="txtnombreSet" aria-describedby="basic-addon1" aria-label="Username" class="form-control form-control-sm" type="text" />

                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </h6>
                                                    </div>

                                                </div>


                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-lg-12 col-xl-12" runat="server" id="panelAgregar" visible="false">
                        <div class="pd-15  bg-gray-200 small formlayout">
                            <div class="card card-warning">
                                <div class="card-body text-warning">
                                    Secuenciación y/o separación de fragmentos

                              <div class="col-md-12 text-center ">
                                  <asp:LinkButton runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" ValidationGroup="CrearArticulo" class="btn btn-primary btn-rounded "> <i class="fa fa-arrow-down"></i> Agregar
                                  </asp:LinkButton>
                                  <asp:LinkButton runat="server" ID="btnGuardar" OnClick="btnGuardar_Click" class="btn btn-success btn-rounded "> Guardar
                                  </asp:LinkButton>
                              </div>
                                </div>

                                <div class="card-footer text-center">
                                    <div class="table-responsive" runat="server" visible="true" id="tablaANexo">
                                        <table id="tableS" class="table table-sm table-striped  text-md-nowrap border">
                                            <thead style="background-color: #565A5D; color: white">
                                                <tr class="text-center">
                                                    <th style="background-color: #1C2833; color: white;" colspan="9">Información muestra</th>
                                                    <th style="background-color: #B2BABB; color: white;" colspan="7">Secuenciación</th>
                                                    <th style="background-color: #808B96; color: white;" colspan="4">Análisis Fragmentos</th>
                                                </tr>
                                                <tr>
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
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater runat="server" ID="tbanexo">
                                                    <ItemTemplate>
                                                        <tr>
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
                                                            <td class="text-center">
                                                                <asp:LinkButton runat="server" ID="btnEditar" data-toggle="tooltip" title="Editar" OnCommand="btnEditar_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-pencil text-info fa-2x"></i></asp:LinkButton>
                                                                <asp:LinkButton runat="server" ID="lbn_Eliminar" data-toggle="tooltip" title="Eliminar" OnCommand="lbn_Eliminar_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa  fa-trash text-danger fa-2x"></i></asp:LinkButton>
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


        <!-- JQuery min js -->
        <%-- <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery/jquery.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/popper/popper.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/ionicons/ionicons.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/moment/moment.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery-sparkline/jquery.sparkline.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/peity/jquery.peity.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/perfect-scrollbar/p-scroll.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery.flot/jquery.flot.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery.flot/jquery.flot.pie.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery.flot/jquery.flot.resize.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/jquery.flot/jquery.flot.categories.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/chart.js/Chart.bundle.min.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/sidemenu-responsive-tabs/js/sidemenu-responsive-tabs.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/side-menu/sidemenu.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/left-menu.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/color-change.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/sidebar/sidebar.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/sidebar/sidebar-custom.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/rating/jquery.rating-stars.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/rating/jquery.barrating.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/plugins/echart/echart.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/tooltip.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/color-change.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/index.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/dashboard.sampledata.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/chart.flot.sampledata.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/js/custom.js")%>"></script>
            <script src="<%=ResolveClientUrl("../../../assets/switcher/js/switcher.js")%>"></script>
        --%>
        <%--  Estilo para datatable filtros--%>
        <script src="<%=ResolveClientUrl("../../../assets/jquery.dataTables.min.js")%>"></script>

        <link href="<%=ResolveClientUrl("../../../assets/fileupload/fancy_fileupload.css")%>" rel="stylesheet" />
        <script src="<%=ResolveClientUrl("../../../assets/fileupload/jquery.fancy-fileupload.js")%>"></script>
        <script src="<%=ResolveClientUrl("../../../assets/fileupload/fancy-uploader.js")%>"></script>
        <script src="<%=ResolveClientUrl("../../../assets/fileupload/jquery.fileupload.js")%>"></script>
        <script src="<%=ResolveClientUrl("../../../assets/fileupload/jquery.iframe-transport.js")%>"></script>
        <script src="<%=ResolveClientUrl("../../../assets/fileupload/jquery.ui.widget.js")%>"></script>
        <%--Codigo JavaScript--%>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#tableS').DataTable();
            });

        </script>
    </form>
</body>
