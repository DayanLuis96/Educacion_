<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargueMasivo.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Procesamiento.CargueMasivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://www.spruko.com/demo/admix/Admix/assets/plugins/fileuploads/css/fileupload.css" rel="stylesheet" type="text/css" />
    <link href="https://www.spruko.com/demo/admix/Admix/assets/plugins/fancyuploder/fancy_fileupload.css" rel="stylesheet" type="text/css" />


    <link rel="stylesheet" type="text/css" media="all" href=" https://www.spruko.com/demo/admix/Admix/assets/css/style.css" />

</head>


<body class="main-body">
    <form id="form1" runat="server">
        <div class="page">

            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <div class="main-content horizontal-content">
                <!-- Container-fluid -->
                <div class="container">
                    <!-- Main-content-body -->
                    <div class="main-content-body">

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div>
                                                    <h6 class="card-title mb-1">File Upload</h6>
                                                    <p class="text-muted card-sub-title">Dropify is a jQuery plugin to create a beautiful file uploader that converts a standard <code>input type="file"</code> into a nice drag &amp; drop zone with previews and custom styles.</p>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-sm-12 col-md-4">
                                                        <div class="dropify-wrapper has-preview" style="height: 212.5px;">
                                                            <div class="dropify-message">
                                                                <span class="file-icon">
                                                                    <p>Drag and drop a file here or click</p>
                                                                </span>
                                                                <p class="dropify-error">Ooops, something wrong appended.</p>
                                                            </div>
                                                            <div class="dropify-loader" style="display: none;"></div>
                                                            <div class="dropify-errors-container">
                                                                <ul></ul>
                                                            </div>
                                                            <input type="file" class="dropify" data-height="200">
                                                            <button type="button" class="dropify-clear">Remove</button><div class="dropify-preview" style="display: block;">
                                                                <span class="dropify-render"><i class="dropify-font-file"></i><span class="dropify-extension">emz</span></span><div class="dropify-infos">
                                                                    <div class="dropify-infos-inner">
                                                                        <p class="dropify-filename"><span class="dropify-filename-inner">image006.emz</span></p>
                                                                        <p class="dropify-infos-message">Drag and drop or click to replace</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-4 mg-t-10 mg-sm-t-0">
                                                        <div class="dropify-wrapper" style="height: 212.5px;">
                                                            <div class="dropify-message">
                                                                <span class="file-icon">
                                                                    <p>Drag and drop a file here or click</p>
                                                                </span>
                                                                <p class="dropify-error">Ooops, something wrong appended.</p>
                                                            </div>
                                                            <div class="dropify-loader" style="display: none;"></div>
                                                            <div class="dropify-errors-container">
                                                                <ul></ul>
                                                            </div>
                                                            <input type="file" class="dropify" data-default-file="../../assets/img/photos/1.jpg" data-height="200">
                                                            <button type="button" class="dropify-clear">Remove</button><div class="dropify-preview" style="display: none;">
                                                                <span class="dropify-render"></span>
                                                                <div class="dropify-infos">
                                                                    <div class="dropify-infos-inner">
                                                                        <p class="dropify-filename"><span class="dropify-filename-inner">Anexo4_Purif_Extracción_ANuc_PCR (1).xlsx</span></p>
                                                                        <p class="dropify-infos-message">Drag and drop or click to replace</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 col-md-4 mg-t-10 mg-sm-t-0">
                                                        <div class="dropify-wrapper disabled">
                                                            <div class="dropify-message">
                                                                <span class="file-icon">
                                                                    <p>Drag and drop a file here or click</p>
                                                                </span>
                                                                <p class="dropify-error">Ooops, something wrong appended.</p>
                                                            </div>
                                                            <div class="dropify-loader"></div>
                                                            <div class="dropify-errors-container">
                                                                <ul></ul>
                                                            </div>
                                                            <input type="file" class="dropify" disabled="disabled"><div class="dropify-preview">
                                                                <span class="dropify-render"></span>
                                                                <div class="dropify-infos">
                                                                    <div class="dropify-infos-inner">
                                                                        <p class="dropify-filename"><span class="dropify-filename-inner"></span></p>
                                                                        <p class="dropify-infos-message">Drag and drop or click to replace</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="ff_fileupload_dropzone_wrap">
                                                    <asp:HiddenField ID="campo_nombre_tabla" runat="server" />

                                                    <asp:FileUpload runat="server" ID="demo" OnChange="modificarEstilo()" type="file" name="files" class="ff_fileupload_hidden alert-danger ff_fileupload_dropzone" Multiple="Multiple"></asp:FileUpload>

                                                    <%--                                                    <input id="demo" type="file" name="files" accept=".jpg, .png, image/jpeg, image/png, html, zip, css,js" multiple="" class="ff_fileupload_hidden"><div class="ff_fileupload_wrap">--%>
                                                    <script language="javascript" type="text/javascript">
                                                        function metodo(obj) {
                                                            __doPostBack(obj.name.substring(obj.name.indexOf("$") + 1), obj.value);
                                                        }

                                                        function modificarEstilo() {
                                                            document.getElementById("<%=campo_nombre_tabla.ClientID%>") = document.getElementById("<%=datatables.ClientID%>");
                                                        }
                                                    </script>
                                                    <table runat="server" id="datatables" class="ff_fileupload_uploads"></table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>
                                </div>

                                <%--<div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div>
                                                    <h6 class="card-title mb-1">Cargar Archivos</h6>
                                                </div>

                                                <div>

                                                    <div>
                                                        <asp:FileUpload runat="server" ID="demo"  CssClass="form-control ff_fileupload_dropzone  alert-danger" Multiple="Multiple"></asp:FileUpload>
                                                        <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                                            ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                            ValidationExpression="^.+\.(xlsx|jpg|png)$" ValidationGroup="CargarArchivos" ControlToValidate="demo" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                </div>

                                <div class="col-md-12 col col-sm-12 col-xs-12 my-auto text-right">
                                    <asp:LinkButton runat="server" ID="btnguardarDetalle" ValidationGroup="CargarArchivos" OnClick="btnguardarDetalle_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Guardar </asp:LinkButton>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnguardarDetalle" />
                            </Triggers>
                        </asp:UpdatePanel>


                        <!-- /row -->
                    </div>
                    <!-- Main-content-body closed -->
                </div>
                <!-- Container-fluid closed -->
            </div>

        </div>
    </form>

    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/jquery/jquery.min.js"></script>
    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/popper/popper.min.js"></script>
    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/jquery-ui/ui/widgets/datepicker.js"></script>
    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/fancyuploder/jquery.ui.widget.js"></script>
    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/fancyuploder/jquery.fileupload.js"></script>

    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/fancyuploder/jquery.fancy-fileupload.js"></script>
    <script src="https://www.spruko.com/demo/admix/Admix/assets/plugins/fancyuploder/fancy-uploader.js"></script>

</body>


</html>
