<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Informe.ascx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Navg.FasesMuestra.Informe" %>
<div class="col-md-12 col-xl-12">
    <div class="card">
        <div class="row">
            <div class="col-md-10">
                <h3 class="card-title">Generar Informe</h3>
            </div>
            <div class="col-md-2 text-right">
                <asp:LinkButton runat="server" ID="btnSig" Visible="false" OnClick="btnSig_Click" ToolTip="Siguiente" class="btn btn-primary">Siguiente<i class="fa  fa-arrow-right"></i></asp:LinkButton>

            </div>
        </div>
        <asp:LinkButton runat="server" ID="btnCargar" OnClick="btnCargar_Click" CssClass="btn bg-primary-transparent text-primary "> <i class="fa fa-arrow-dowm"></i> Cargar Informe</asp:LinkButton>

    </div>
    <script type="text/javascript">
        function MostrarInforme() {
            var frame = $('#iframe1');
            var url = '<%= Session["FORMIMPRIMIR"] %>';
            frame.attr('src', url).show();
        }
    </script>
    <iframe name="iframe" id="iframe1" onscroll="true" style="width: 100%; height: 390px; border: none"></iframe>

</div>
