<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Resultado.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.FaseFinalRedis" %>

<div class="col-md-12 col-xl-12">
    <div>
        <div class="row">
            <div class="col-md-10">
                 <h3 class="card-title">Cargar Resultado</h3>
            </div>
           <div class="col-md-2 text-right">
                           <asp:LinkButton runat="server" ID="btnSig" Visible="false" OnClick="btnSig_Click" ToolTip="Siguiente" class="btn btn-primary">Siguiente<i class="fa  fa-arrow-right"></i></asp:LinkButton>

           </div>
        </div>
        <hr />
        <div class="container m-0">
            <div runat="server" id="DivMuestras" visible="false">

                <div class="row">
                    <div class="col-md-6">
                        <p class="badge badge-success">Resultado Gel Agarosa</p>
                        <span class="small">Cargar Aqui Archivo .Tif</span>
                        <div runat="server" id="divImagen">
                            <div class="ff_fileupload_wrap">
                                <div class="ff_fileupload_dropzone_wrap">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12" style="margin-bottom: 0%">

                                            <div class="form-group " style="text-align: center;">

                                                <asp:FileUpload ID="FileUpload1" AllowMultiple="false" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                                <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                                    ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                    ValidationExpression="^.+\.(Tif)$" ValidationGroup="Validation" ControlToValidate="FileUpload1" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 text-center">
                            <asp:LinkButton runat="server" ID="BtnGuardaImagen" OnClientClick="showProgressBar();" OnClick="BtnGuardaImagen_Click" CssClass="btn btn-sm btn-primary"><i class="fa "></i>Cargar y Guardar </asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Image ID="imgRest" runat="server" Height="100%" Width="100%" />
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <hr />
            </div>
            <div runat="server" id="divCargarArchivos" visible="false">

                <div class="row">
                    <div class="col-md-6">
                        <p class="badge badge-success">Resultado NanoDrop</p>

                        <div class="ff_fileupload_wrap">
                            <div class="ff_fileupload_dropzone_wrap">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12" style="margin-bottom: 0%">

                                        <div class="form-group " style="text-align: center;">

                                            <asp:FileUpload ID="files" AllowMultiple="false" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                                            <%--                                                        <asp:RequiredFieldValidator ValidationGroup="CrearDetalleServicio" Display="Dynamic" ID="RequiredFieldValidator74" runat="server" CssClass="alert-danger" ErrorMessage="<i class='bi bi-info-circle-fill'></i> El anexo es obligatorio .xlsx" ControlToValidate="ArchivoExcel" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            <%--   <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                                ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                                ValidationExpression="^.+\.(xlsx)$" ValidationGroup="CrearDetalleServicio" ControlToValidate="ArchivoExcel" />--%>
                                            <br />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            <asp:LinkButton runat="server" ID="Btnguardar" OnClientClick="showProgressBar();" OnClick="Btnguardar_Click" CssClass="btn btn-sm btn-primary"><i class="fa fa-save"></i>Cargar y Guardar </asp:LinkButton>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <asp:Panel runat="server" ScrollBars="Auto" Width="100%" Height="400px">
                             <asp:GridView ID="GridViewXML" runat="server" CssClass="table text-md-nowrap dataTable no-footer table-active shadow table-hover table-primary form-control-sm " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
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


