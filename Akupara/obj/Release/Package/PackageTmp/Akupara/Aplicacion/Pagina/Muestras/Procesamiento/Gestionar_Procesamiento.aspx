<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Gestionar_Procesamiento.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Muestras.Procesamiento.Gestionar_Procesamiento" %>

<%@ Register Src="~/Akupara/Aplicacion/Pagina/Muestras/Navg/GestionResultados.ascx" TagPrefix="uc1" TagName="GestionResultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #UpdateProgressContainer {
            position: absolute;
            z-index: 9999;
        }

        #Background {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Fondo semitransparente */
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100002;
        }

        #progressBar {
            position: fixed;
            top: 20%;
            left: 20%;
            left: 20%;
            height: 50%;
            width: 50%;
            z-index: 100001;
            background-image: url('../../../../../assets/images/loading.gif');
            background-repeat: no-repeat;
            background-position: center;
        }

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
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="page-header d-sm-flex d-block">

        <!-- End breadcrumb -->
        <div class="ms-auto">
            <div>
                <a href="javascript:void(0);" class="btn bg-success-transparent text-success btn-sm" data-bs-toggle="tooltip" title="" data-bs-placement="bottom" data-bs-original-title="Rating"><span><i class="fa fa-star"></i></span></a>
                <a href="lockscreen.html" class="btn bg-info-transparent text-info mx-2 btn-sm" data-bs-toggle="tooltip" title="" data-bs-placement="bottom" data-bs-original-title="lock"><span><i class="fa fa-lock"></i></span></a>
                <a href="javascript:void(0);" class="btn bg-primary-transparent text-primary btn-sm" data-bs-toggle="tooltip" title="" data-bs-placement="bottom" data-bs-original-title="Add New"><span><i class="fa fa-plus"></i></span></a>
            </div>
        </div>
    </div>

    <div id="Background" style="display: none;"></div>
    <div id="progressBar" style="display: none;">
    </div>

    <uc1:GestionResultados runat="server" ID="GestionResultados" />


    <script type="text/javascript">

        function showProgressBar() {
            var progressBar = document.getElementById('progressBar');
            var Background = document.getElementById('Background');

            // Guardar los estilos originales del elemento
            var originalDisplay = progressBar.style.display;
            var originalStyles = progressBar.getAttribute('style');

            var originalDisplay2 = Background.style.display;
            var originalStyles2 = Background.getAttribute('style');

            // Mostrar la barra de progreso
            progressBar.style.display = 'block';
            Background.style.display = 'block';

            // Ocultar la barra de progreso cuando la página haya terminado de cargar
            window.addEventListener('load', function () {
                progressBar.style.display = 'none';
                Background.style.display = 'none';

                // Restaurar los estilos originales del elemento
                progressBar.style.display = originalDisplay;
                progressBar.setAttribute('style', originalStyles);


                Background.style.display = originalDisplay2;
                Background.setAttribute('style', originalStyles2);
            });
        }


    </script>

    <script type="text/javascript">


        function ModaldetalleProcolo() {
            $('#detalleProtocolo').modal('show');
        }

    </script>

</asp:Content>
