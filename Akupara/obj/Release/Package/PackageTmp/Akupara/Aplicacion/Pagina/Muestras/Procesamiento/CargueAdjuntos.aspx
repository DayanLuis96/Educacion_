<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="CargueAdjuntos.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Procesamiento.CargueAdjuntos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <br />


    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="ff_fileupload_wrap">
                <div class="ff_fileupload_dropzone_wrap">
                    <div class="col-xs-12 col-sm-12" style="margin-bottom: 1%">

                        <div class="form-group " style="text-align: center;">


                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<span class='badge rounded-pill bg-danger text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Seleccione un Documento</span>"
                                ControlToValidate="files" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="AdjuntosFile"></asp:RequiredFieldValidator>
                            <asp:FileUpload ID="files" Multiple="Multiple" AllowMultiple="true" CssClass="form-control ff_fileupload_dropzone alert-danger" runat="server" />
                            <asp:RegularExpressionValidator ID="FileUploadRegex" runat="server"
                                ErrorMessage="<span class='badge rounded-pill bg-primary text-white ms-auto'><i class='fa fa-info-circle fa-2x'></i> Formato Invalido</span>"
                                ValidationExpression="^.+\.(xlsx|jpg|png)$" ValidationGroup="AdjuntosFile" ControlToValidate="files" />
                            <br />

                        </div>
                    </div>
                </div>
            </div>

            <%--            <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" OnChange="metodo(this)"></asp:FileUpload>--%>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Btnguardar" />
        </Triggers>

    </asp:UpdatePanel>



    <asp:LinkButton runat="server" ID="Btnguardar" OnClick="btnguardarDetalle_Click" ValidationGroup="AdjuntosFile" class="btn btn-secondary btn-rounded btn-block">Adjuntar Archivos</asp:LinkButton>


    <div runat="server" visible="false" id="divAdjuntos">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableS" class="table table-striped border   form-control-sm">
                            <thead>
                                <tr>

                                    <th>Nombre Archivo</th>

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

                                                    <asp:LinkButton runat="server" ID="btnEliminar" data-toggle="tooltip" title="Eliminar Adjunto" OnCommand="btnEliminar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-danger"><i class="fa fa-trash-o fa-1x"></i></asp:LinkButton>
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

</asp:Content>
