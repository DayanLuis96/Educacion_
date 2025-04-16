<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="Educacion.Educacion.Aplicacion.Pagina.Configuracion.Servicios.Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--- Favicon -->
    <link rel="icon" href="../../../../assets/img/LOGO.png" type="image/x-icon">
    <!--- Icons css -->
    <link href="../../../../assets/css/icons.css" rel="stylesheet">
    <!--- Right-sidemenu css -->
    <link href="../../../../assets/plugins/sidebar/sidebar.css" rel="stylesheet">
    <!--- Custom Scroll bar -->
    <link href="../../../../assets/plugins/mscrollbar/jquery.mCustomScrollbar.css" rel="stylesheet">
    <!--- Style css -->
    <link rel="stylesheet" type="text/css" media="all" href="../../../../assets/css/style.css">
    <!-- Colors css -->
    <link id="theme" rel="stylesheet" type="text/css" media="all" href="../../../../assets/css/colors/color.css">
    <!--- Skinmodes css -->
    <link href="../../../../assets/css/skin-modes.css" rel="stylesheet">
    <!--- Darktheme css -->
    <link href="../../../../assets/css/style-dark.css" rel="stylesheet">
    <!--- Sidemenu css -->
    <link rel="stylesheet" href="../../../../assets/css/sidemenu/sidemenu.css">
    <!--  Map css-->
    <link href="../../../../assets/plugins/jqvmap/jqvmap.min.css" rel="stylesheet">
    <!-- Sidemenu-respoansive-tabs css -->
    <link href="../../../../assets/css/sidemenu/sidemenu-responsive-tabs.css" rel="stylesheet">
    <!-- Switcher css-->
    <link href="../../../../assets/switcher/css/switcher.css" rel="stylesheet">
    <link href="../../../../assets/switcher/demo.css" rel="stylesheet">

    <!--- Animations css -->
    <link href="../../../../assets/css/animate.css" rel="stylesheet">
    <link href="../../../../assets/plugins/line-awesome/css/line-awesome.css" rel="stylesheet" />
    <link href="../../../../assets/plugins/simple-line-icons/simple-line-icons.css" rel="stylesheet" />

    <link href="../../../../assets/plugins/boxicons/css/boxicons.css" rel="stylesheet" />
    <link href="../../../../assets/plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" />
    <script src="../../../../assets/plugins/ionicons/ionicons.js"></script>
    <link href="../../../../assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="../../../../assets/plugins/fontawesome-free/css/all.min.css" rel="stylesheet" />
    <link href="../../../../assets/font-awesome.css" rel="stylesheet" />
    <script src="../../../../assets/fontawesome.js"></script>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <h4 class="mb-2">Configuración</h4>
            <div class="main-content-breadcrumb"><span>Servicios</span>  </div>
        </div>
    </div>

   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="main-content-body">
                <div class="row row-sm">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <div class="ecommerce-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <b>Nombre*:</b>
                                                <div class="small-group">
                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtnombre" class="form-control small  form-control-sm" type="text" required="true" placeholder="Ingrese el nombre del servicio " />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                            <div class="form-group">
                                                <p></p>
                                                <label class="custom-switch">
                                                    <input type="checkbox" runat="server" id="checActivo" name="custom-switch-checkbox1" class="custom-switch-input">
                                                    <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Activo</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                            <asp:LinkButton runat="server" ID="Btnguardar" OnClick="Btnguardar_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Guardar </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">

                <div class="card-body">
                    <div class="main-content-label mg-b-5">Servicios configurados </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Panel ID="Panel2" Width="100%" ScrollBars="Auto" runat="server">

                                        <asp:GridView ID="tablaconsultar" runat="server" OnRowUpdating="tablaconsultar_RowUpdating" OnRowDeleting="tablaconsultar_RowDeleting" OnSelectedIndexChanged="tablaconsultar_SelectedIndexChanged" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="NOMBRE" ItemStyle-CssClass="small" HeaderText="Servicio" ReadOnly="True" SortExpression="NOMBRE" />

                                                <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="txtestado" Enabled="false" CssClass="rounded check-box rounded-bottom" Checked='<%# Bind("ACTIVO") %>'></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Editar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:LinkButton runat="server" ToolTip="Editar" CssClass="btn btn-outline-success btn-sm" CommandName="Update"><i class='fa fa-pencil-square'></i> Editar </asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:LinkButton runat="server" OnClientClick="if (!window.confirm('Desea eliminar el servicio seleccionado?')) return false;" ToolTip="Eliminar" CssClass="btn btn-outline-danger btn-sm" CommandName="delete"><i class='fa fa-trash'></i> Eliminar </asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Detalle" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="btndetalle" ToolTip="Detalle" CssClass="btn btn-outline-primary btn-sm" CommandName="Select"><i class='fa fa-plus-square'></i> Detalle </asp:LinkButton>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btndetalle" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Protocolo" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:UpdatePanel ID="UpdatePanelAso" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="btnAsociarProtocolo" OnCommand="btnAsociarProtocolo_Command" CommandArgument='<%#Eval("ID")%>' ToolTip="Configurar Protocolo" CssClass="btn btn-outline-info btn-sm"><i class='fa fa-braille'></i> Protocolo</asp:LinkButton>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btnAsociarProtocolo" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="PDF" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="text-center">
                                                            <asp:UpdatePanel ID="UpdatePanelpdf" runat="server">
                                                                <ContentTemplate>
                                                                    <asp:LinkButton runat="server" ID="btnPdf" OnCommand="btnPdf_Command" CommandArgument='<%#Eval("ID")%>' ToolTip="Configurar Pdf" CssClass="btn btn-outline-dark btn-sm"><i class='fa fa-paperclip'></i> PDF</asp:LinkButton>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="btnPdf" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />

                                        </asp:GridView>
                                    </asp:Panel>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Btnguardar" />
        </Triggers>
    </asp:UpdatePanel>
    <div allowoutsideclick: false class="modal fade" id="detalle" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Detalles de la solicitud</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="content text-center">
                                <div class="row">
                                    <div runat="server" id="divNombreDetalle" class="col-md-6">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend  ">
                                                <span class="input-group-text small">Nombre Detalle*:</span>
                                            </div>
                                            <asp:TextBox runat="server" ID="txtDetalleservicio" CssClass="form-control small  form-control-sm  "></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtDetalleservicio" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearDetalleServicio"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend  ">
                                                <span class="input-group-text small">Valor unitario:</span>
                                            </div>
                                            <asp:TextBox runat="server" ID="txtvalorunitario" TextMode="Number" class="form-control small  form-control-sm" type="text" placeholder="$0.00 " />
                                        </div>
                                    </div>

                                    <div class=" col-md-3">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend  ">
                                                <span class="input-group-text small">Unidad medida*:</span>
                                            </div>
                                            <asp:DropDownList runat="server" ID="txtunidadmedida" CssClass="form-control small drop-down-profile select2 form-control-sm  "></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="txtunidadmedida" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearDetalleServicio"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div runat="server" visible="false" id="divAnexo" class=" col-md-2">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend  ">
                                                <span class="input-group-text small">Anexo *:</span>
                                            </div>
                                            <asp:DropDownList runat="server" ID="ddl_anexos" CssClass="form-control small drop-down-profile select2  form-control-sm  "></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                                ControlToValidate="ddl_anexos" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                                ValidationGroup="CrearDetalleServicio"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="input-group-prepend  ">
                                                <span class="input-group-text small">Metodos:</span>
                                            </div>
                                        <asp:ListBox ID="ddl_Metodo" runat="server" data-select2-id="7" TabIndex="-1" aria-hidden="true" CssClass="form-control js-example-basic-multiple" SelectionMode="Multiple"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
                                            ControlToValidate="ddl_Metodo" InitialValue="0" Display="Dynamic" ForeColor="Red"
                                            ValidationGroup="CrearDetalleServicio"></asp:RequiredFieldValidator>
                                    </div>



                                    <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                        <div class="form-group">
                                            <p></p>
                                            <%--   <label class="custom-switch">
                                                <input type="checkbox" runat="server" id="CrekdetActivo" name="custom-switch-checkbox1" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Activo</span></label>--%>
                                            <label class="switch" data-toggle="tooltip" title="Activar/Desactivar">
                                                <asp:CheckBox ID="CrekdetActivo_" runat="server" />
                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>Activo
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-md-2 col col-sm-2 col-xs-2 my-auto">
                                        <div class="form-group">
                                            <p></p>
                                            <%--     <label class="custom-switch">
                                                <input type="checkbox" runat="server" id="Crekplantilla" name="custom-switch-checkbox1" class="custom-switch-input">
                                                <span class="custom-switch-indicator"></span><span class="custom-switch-description mr-2">Plantilla</span></label>--%>
                                            <label class="switch" data-toggle="tooltip" title="Plantilla">
                                                <asp:CheckBox ID="Crekplantillas" AutoPostBack="true" OnCheckedChanged="Crekplantillas_CheckedChanged" runat="server" />
                                                <span class="slider round form-check-input custom-switch-indicator"><span class="custom-switch-description mr-2"></span></span>Plantilla
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-3" runat="server" id="divFilePlantilla" visible="false">
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

                                    </div>
                                    <br />
                                    <div runat="server" id="divNombrePlantilla" visible="false" class="alert alert-success" role="alert">
                                        <span class="alert-inner--icon"><i class="fe fe-thumbs-up"></i></span><span class="alert-inner--text"><strong>Adjunto! -- </strong>
                                            <asp:Label runat="server" ID="NombreArchivoAdjunto"></asp:Label></span>
                                    </div>

                                    <div class="col-md-2 col col-sm-2 col-xs-2 my-auto text-right">
                                        <asp:LinkButton runat="server" ID="btnguardarDetalle" ValidationGroup="CrearDetalleServicio" OnClick="btnguardarDetalle_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Guardar </asp:LinkButton>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-12">
                                        <asp:Panel ID="PanelDetallesss" Width="100%" ScrollBars="Auto" runat="server">

                                            <asp:GridView ID="tabladetalle" runat="server" OnRowUpdating="tabladetalle_RowUpdating" OnRowDeleting="tabladetalle_RowDeleting" CssClass="table   table-active dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="txtiddet" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="txtidunidad" Visible="false" Text='<%# Bind("ID_UNIDAD_MEDIDA") %>'></asp:Label>
                                                            <asp:Label runat="server" ID="lblAnexoID" Visible="false" Text='<%# Bind("AnexoID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="NOMBRE" ItemStyle-CssClass="small" HeaderText="Detalle Servicio" ReadOnly="True" SortExpression="NOMBRE" />
                                                    <asp:BoundField DataField="VALOR_UNITARIO" DataFormatString="{0:N}" ItemStyle-CssClass="small" HeaderText="Valor unitario" ReadOnly="True" SortExpression="VALOR_UNITARIO" />

                                                    <asp:BoundField DataField="UNIDAD_MEDIDA" ItemStyle-CssClass="small" HeaderText="Unidad medida" ReadOnly="True" SortExpression="UNIDAD_MEDIDA" />
                                                    <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="txtestadodep" Enabled="false" CssClass="rounded check-box rounded-bottom" Checked='<%# Bind("ACTIVO") %>'></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Plantilla" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="txtplantilladep" Enabled="false" CssClass="rounded check-box rounded-bottom" Checked='<%# Bind("PLANTILLA") %>'></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Anexo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="txtANexo" Enabled="false" CssClass="rounded check-box rounded-bottom" Checked='<%# Bind("contieneAnexo") %>'></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Editar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <div class="text-center">
                                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:LinkButton ID="btnedidet" runat="server" ToolTip="Editar" CssClass="btn btn-outline-success btn-sm" CommandName="Update"><i class='fa fa-pencil-square'></i> Editar </asp:LinkButton>

                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:AsyncPostBackTrigger ControlID="btnedidet" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Eliminar" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <div class="text-center">
                                                                <asp:LinkButton runat="server" OnClientClick="if (!window.confirm('Desea eliminar el detalle seleccionado?')) return false;" ToolTip="Eliminar" CssClass="btn btn-outline-danger btn-sm" CommandName="delete"><i class='fa fa-trash'></i> Eliminar </asp:LinkButton>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                   <%-- <asp:TemplateField HeaderText="Artículos" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                </Columns>
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <HeaderStyle BackColor="#565A5D" Font-Bold="True" ForeColor="White" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnguardarDetalle" />
                        <asp:AsyncPostBackTrigger ControlID="Crekplantillas" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>

    <div allowoutsideclick: false class="modal fade" id="detalleProtocolo" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Configurar protocolo -
                        <label runat="server" id="NombreServicio" class="badge badge-primary"></label>
                    </h4>
                    <asp:LinkButton runat="server" ID="LinkButton1" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="content text-center">

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group">
                                            <label for="txb_Texto">(*) Protocolo:</label>

                                            <asp:TextBox ID="txb_Texto" runat="server" CssClass="form-control " TextMode="MultiLine" Rows="10"></asp:TextBox>
                                            <script>
                                                window.onload = function () {
                                                    CKEDITOR.replace('<%=txb_Texto.ClientID%>');
                                                };
                                            </script>

                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 text-center">
                            <asp:LinkButton runat="server" ID="BtnGuardarProtoccolo" Text="Guardar" OnClick="BtnGuardarProtoccolo_Click" class="btn btn-success btn-rounded ">
                            </asp:LinkButton>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnGuardarProtoccolo" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>


    <div allowoutsideclick: false class="modal fade" id="detalleProtocoloPDF" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Configurar protocolo - PDF
                        <label runat="server" id="Label2" class="badge badge-primary"></label>
                    </h4>
                    <asp:LinkButton runat="server" ID="LinkButton2" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>
                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <div class="content text-center">

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group " style="text-align: center;">

                                            <asp:FileUpload ID="ArchivoPdf" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                            <%--                                                        <asp:RequiredFieldValidator ValidationGroup="CrearDetalleServicio" Display="Dynamic" ID="RequiredFieldValidator74" runat="server" CssClass="alert-danger" ErrorMessage="<i class='bi bi-info-circle-fill'></i> El anexo es obligatorio .xlsx" ControlToValidate="ArchivoExcel" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                ValidationExpression="^.+\.(pdf)$" ValidationGroup="CarguePdf" ControlToValidate="ArchivoPdf" />
                                            <br />

                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="col-md-12 text-center">
                            <asp:LinkButton runat="server" ID="BtnGuardarPdf" Text="Guardar" OnClick="BtnGuardarPdf_Click" class="btn btn-success btn-rounded ">
                            </asp:LinkButton>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="BtnGuardarPDF" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>
        </div>
    </div>

    <script type="text/javascript">
        function Modaldetalle() {
            $('#detalle').modal('show');
        }

        function ModaldetalleProcolo() {
            $('#detalleProtocolo').modal('show');
        }
        function ModaldetallePDF() {
            $('#detalleProtocoloPDF').modal('show');
        }
    </script>



    <script src="../../../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../../../assets/plugins/popper/popper.min.js"></script>
    <script src="../../../../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../../../assets/plugins/moment/moment.js"></script>
    <script src="../../../../assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="../../../../assets/switcher/js/switcher.js"></script>
    <script src="../../../../assets/js/form-elements.js"></script>
</asp:Content>
