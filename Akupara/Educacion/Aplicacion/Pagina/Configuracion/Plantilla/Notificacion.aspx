<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Notificacion.aspx.cs" Inherits="Educacion.Educacion.Aplicacion.Pagina.Configuracion.Plantilla.Notificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header-title">
        <div class="text-center">
            <h4 class="mb-2">Plantillas</h4>
        </div>
    </div>
    <hr />
    <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">

        <div class="card">
            <div class="card-body ">
                <hr class="m-0" />
                <div class="pd-15  bg-gray-200 small formlayout">
                    <div class="row row-sm">
                        <div class="col-md-12">
                            <div class="box box-success">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Notificación: </label>
                                            <asp:DropDownList ID="ddl_Notificacion" AutoPostBack="true" CssClass="form-control select2" runat="server" OnSelectedIndexChanged="ddl_Notificación_SelectedIndexChanged"></asp:DropDownList>
                                            <br />
                                            <br />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="main-card mb-3 card">
                                                <div class="card-header"></div>
                                                <div class="card-body">
                                                    <asp:Panel runat="server">


                                                        <asp:TextBox ID="txb_Texto" runat="server" CssClass="form-control " TextMode="MultiLine" Rows="15"></asp:TextBox>
                                                        <script>
                                                            window.onload = function () {
                                                                CKEDITOR.replace('<%=txb_Texto.ClientID%>');
                                                            };
                                                        </script>

                                                    </asp:Panel>

                                                    <div class="col-md-12 text-center">
                                                        <asp:LinkButton runat="server" ID="BtnGuardarPlantilla" Visible="false" OnClick="BtnGuardarPlantilla_Click" Text="Guardar" class="btn btn-success btn-rounded ">
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>

                                            </div>



                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
