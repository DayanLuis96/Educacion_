<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Metodo.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.Metodo" %>


<div class="col-md-12 col-xl-12">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Metodo</h3>
        </div>
           <div class="table-responsive">
                    <table id="table" class=" table table-sm rouded shadow table-striped text-md-nowrap border table-sm">
                        <thead>
                            <tr>
                                <th class="text-dark">Metodo</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="tbmetodos">
                                <ItemTemplate>
                                    <tr>

                                        <td>
                                            <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                            <asp:LinkButton runat="server" OnCommand="BtnSelecId_Command" ID="BtnSelecId" OnClientClick="showProgressBar();" Text='<%# Eval("METODO")%>' CommandArgument='<%#Eval("ID")%>' ></asp:LinkButton>
<%--                                            <asp:Label ID="TemaDiscu" Text='<%# Eval("METODO")%>' runat="server"></asp:Label>--%>
                                        </td>

                                        
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
   </div>
</div>
