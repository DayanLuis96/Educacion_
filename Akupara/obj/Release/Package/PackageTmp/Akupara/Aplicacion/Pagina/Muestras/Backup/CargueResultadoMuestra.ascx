<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CargueResultadoMuestra.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Backup.CargueResultadoMuestra" %>

<div class="col-lg-12">
    <div class="form-group">
        <div class="input-group-prepend"><span class="font-weight-bold mg-b-0" id="basic-addon1">Tipo resultado: </span></div>
        <asp:DropDownList runat="server" ID="ddl_TipoResultado" class="form-control select2 form-control-sm "></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<i class='fa fa-info-circle'></i> Campo obligatorio"
            ControlToValidate="ddl_TipoResultado" InitialValue="0" Display="Dynamic" ForeColor="Red"
            ValidationGroup="AdjuntosFileResul"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="ff_fileupload_wrap">
    <div class="ff_fileupload_dropzone_wrap">
        <div class="col-xs-12 col-sm-12" style="margin-bottom: 1%">

            <div class="form-group " style="text-align: center;">
                <asp:FileUpload ID="ArchivoResultados" Multiple="Multiple" AllowMultiple="true" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Debe seleccionar al menos un archivo</span>"
                    ClientValidationFunction="validateFiles" ControlToValidate="ArchivoResultados" Display="Dynamic"
                    ValidationGroup="AdjuntosFileResul"></asp:CustomValidator>

                <br />
            </div>
        </div>
    </div>
</div>

<asp:LinkButton runat="server" ID="BtnGuardarmuestras" OnClick="BtnGuardarmuestras_Click" OnClientClick="showProgressBar();" ValidationGroup="AdjuntosFileResul" class="btn btn-secondary btn-rounded btn-block">Cargar</asp:LinkButton>

