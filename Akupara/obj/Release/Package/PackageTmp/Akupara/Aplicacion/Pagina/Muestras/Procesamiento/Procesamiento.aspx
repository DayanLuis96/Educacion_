<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Procesamiento.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Procesamiento.Procesamiento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="header-title">
        <div class="mb-0 mb-lg-0 mb-xl-0">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h4 class="mb-2">Muestras</h4>
            <div class="main-content-breadcrumb"><span>Procesamiento de muestras</span>  </div>
        </div>
    </div>

      <div runat="server" visible="true" id="divSolicitudes">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableS" class="table table-striped border  form-control-sm">
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
                                                    <asp:LinkButton runat="server" ID="btnDetalleServicio" data-toggle="tooltip" title="Gestionar Procesamiento" OnCommand="btnDetalleServicio_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-sm btn-success"><i class="typcn typcn-document-text"></i> Gestionar procesamiento</asp:LinkButton>

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
