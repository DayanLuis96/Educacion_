<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Punto_Chequeo.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.Punto_Chequeo" %>

<div class="row">
    <div class="col-md-12">
        <div>
            <div>
                <h3 class="card-title">Punto de Chequeo</h3>
            </div>
            <hr />
        </div>
    </div>
    <div class="col-md-6">
        <p>Resultado Agarosa</p>
       
        <asp:Image ID="imagen" runat="server" Height="100%" Width="100%" />
    </div>
    <div class="col-md-6">
        <p>Resultado NanoDrop</p>
         <hr />
        <span class="small"> Seleccione las muestras que no continuan a la siguiente fase. <asp:LinkButton runat="server" CssClass="btn btn-primary">Continuar</asp:LinkButton></span>
        <asp:Panel runat="server" ID="panelnano" ScrollBars="Auto" Height="450px">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table id="table" class=" table table-sm table-striped  text-md-nowrap border">
                        <thead>
                            <tr>
                                <th style="color: white; background: #565A5D;"></th>
                                <th style="color: white; background: #565A5D;">#</th>
                                <th style="color: white; background: #565A5D;">Sample ID</th>
                                <th style="color: white; background: #565A5D;">Nucleic Acid</th>
                                <th style="color: white; background: #565A5D;">A260 (Abs)</th>
                                <th style="color: white; background: #565A5D;">A280 (Abs)</th>
                                <th style="color: white; background: #565A5D;">260/280</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="tableprocesos">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:CheckBox runat="server" ID="checSeleccionar" />
                                        </td>
                                        <td>
                                            <asp:Label ID="txtid" Text='<%# Eval("ID")%>' runat="server"></asp:Label></b>

                                        </td>
                                        <td>
                                            <asp:Label ID="txtsampleID" Text='<%# Eval("SAMPLE_ID")%>' runat="server"></asp:Label></b>

                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" Text='<%# Eval("NUCLEIC_ACID")%>' runat="server"></asp:Label></b>

                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" Text='<%# Eval("A260_ABS")%>' runat="server"></asp:Label></b>

                                        </td>
                                         <td>
                                            <asp:Label ID="Label3" Text='<%# Eval("A280_ABD")%>' runat="server"></asp:Label></b>

                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" Text='<%# Eval("_260_280")%>' runat="server"></asp:Label></b>

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
</div>
