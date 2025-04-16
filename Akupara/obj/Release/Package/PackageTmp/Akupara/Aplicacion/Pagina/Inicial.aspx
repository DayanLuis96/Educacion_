<%@ Page Title="" Language="C#" MasterPageFile="~/Akupara/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicial.aspx.cs" Inherits="Akupara.Akupara.Aplicacion.Pagina.Inicial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-body">
        <!-- header-title -->
        <div class="header-title">
            <div class="mb-0 mb-lg-0 mb-xl-0">
                <h4 class="mb-2">Inicial</h4>
                <div class="main-content-breadcrumb"><span>Inicial</span> <span>Muestras</span> </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-12 col-xl-12">

            <div class="row">

                <asp:Panel ID="panelcliente" runat="server" CssClass="col-md-12 col-lg-6 col-xl-6">

                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <div class="ecommerce-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h4 class="card-title mg-b-15">Bienvenido de nuevo</h4>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-4 col col-sm-4 col-xs-4">
                                                <div class="ht-50 wd-50 bg-primary-transparent brround text-center">
                                                    <img src="../../assets/img/offer.svg" class="ht-45 ht-45" alt="revenue">
                                                </div>
                                            </div>
                                            <div class="col-md-8 col col-sm-8 col-xs-8 my-auto">
                                                <div class="float-right text-right tx-20 font-weight-bold my-auto">
                                                    <span class="tx-20">☉</span>
                                                    <asp:Label runat="server" ID="txtnombreusuario"></asp:Label><i class=""></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex month">
                                            <h5 class="float-left font-weight-normal text-muted tx-13">
                                                <p>¡Bienvenido a Akupara, solicita tus servicios aquí:</p>
                                            </h5>


                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-center">
                                            <br />
                                            <a id="btnsolicitar" href="Solicitudes/Solicitud.aspx" class="btn btn-sm btn-primary">Solicitar servicio</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <div class="ecommerce-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h4 class="card-title mg-b-15">Mis Cotizaciones </h4>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-4 col col-sm-4 col-xs-4">
                                                <div class="ht-50 wd-50 bg-primary-transparent brround text-center">
                                                    <img src="../../assets/img/sales.svg" class="ht-45 ht-45" alt="revenue">
                                                </div>
                                            </div>
                                            <div class="col-md-8 col col-sm-8 col-xs-8 my-auto">
                                                <div class="float-right text-right tx-20 font-weight-bold my-auto">
                                                    <span class="tx-20">☉</span>
                                                    <asp:Label runat="server" ID="Label2" Text="consultas"></asp:Label><i class=""></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h5 class="float-left font-weight-normal text-muted tx-13">
                                                <p>Consulta tus cotizaciones en un solo click aquí:</p>
                                            </h5>


                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-center">
                                            <br />
                                            <a id="btncotizaciones" href="Solicitudes/Mis_solicitudes.aspx" class="btn btn-sm btn-primary">Ver cotizaciones</a>

                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>
                <asp:Panel ID="panelAdministrador" runat="server" CssClass="col-md-12 col-lg-6 col-xl-6">

                    <div class="row">

                        <div class="col-md-12 col-lg-6 col-xl-6">
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">

                            <div class="ecommerce-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h4 class="card-title mg-b-15">Solicitudes generadas </h4>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-4 col col-sm-4 col-xs-4">
                                                <div class="ht-50 wd-50 bg-primary-transparent brround text-center">
                                                    <img src="../../assets/img/price.svg" class="ht-45 ht-45" alt="revenue">
                                                </div>
                                            </div>
                                            <div class="col-md-8 col col-sm-8 col-xs-8 my-auto">
                                                <div class="float-right text-right tx-20 font-weight-bold my-auto">
                                                    <span class="tx-20">☉</span>
                                                    <asp:Label runat="server" ID="Label1" Text="Consultas"></asp:Label><i class=""></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h5 class="float-left font-weight-normal text-muted tx-13">
                                                <p>Consulta las solicitudes en un solo click aquí:</p>
                                            </h5>


                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-center">
                                            <br />
                                            <a id="btngestionar" href="Solicitudes/Analisis/ListaSolicitudes.aspx" class="btn btn-sm btn-primary">Gestionar cotizaciones</a>

                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>

                <asp:Panel ID="panel1" runat="server" CssClass="col-md-12 col-lg-6 col-xl-6">


                    <div class="row">

                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <div class="ecommerce-card">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h4 class="card-title mg-b-15">Muestras rechazadas</h4>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-4 col col-sm-4 col-xs-4">
                                                <div class="ht-50 wd-50 bg-primary-transparent brround text-center">
                                                    <img src="../../assets/img/notificacion.png" class="ht-45 ht-45" alt="revenue">
                                                </div>
                                            </div>
                                            <div class="col-md-8 col col-sm-8 col-xs-8 my-auto">
                                                <div class="float-right text-right tx-20 font-weight-bold my-auto">
                                                    <span class="tx-20">☉</span>
                                                    <asp:Label runat="server" ID="Label3" Text="consultas"></asp:Label><i class=""></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h5 class="float-left font-weight-normal text-muted tx-13">
                                                <p>Consulta tus Notoficaciones en un solo click aquí:</p>
                                            </h5>


                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="text-center">
                                            <br />
                                            <asp:LinkButton runat="server" CssClass="btn btn-sm btn-primary" ID="btnVerNotificaciones" Text="Ver Notificaciones" OnClick="btnVerNotificaciones_Click">

                                            </asp:LinkButton>

                                            <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:Panel>
            </div>
        </div>
        <%--        <div class="col-12 col-sm-12 col-lg-12 col-xl-12  text-center">
            <div class="card card-success">
                <div class="card-header pb-0">
                    <h5 class="card-title mb-0 pb-0 text-center">Presentación</h5>
                </div>
                <div class="card-body text-secondary">
                    <div runat="server">
<h2 style="text-align: center;" class="pb_10">Laboratorio de Biolog&iacute;a Molecular y Celular</h2>
<p style="text-align: justify;">El Laboratorio de Biolog&iacute;a Molecular y Celular sirve de apoyo a la investigaci&oacute;n de&nbsp;diversos grupos de investigaci&oacute;n tales como Biotecnolog&iacute;a Vegetal, Biotecnolog&iacute;a&nbsp;Animal, Biotecnolog&iacute;a Microbiana, Biodiversidad y Gen&eacute;tica Molecular (BIOGEM),&nbsp;Microbiodiversidad y Bioprospeccci&oacute;n (MICROBIOP), Diagn&oacute;stico y Manejo de&nbsp;Enfermedades. Adicionalmente participa en la formaci&oacute;n de estudiantes de pregrado,&nbsp;maestr&iacute;a y doctorado de la Universidad Nacional de Colombia que trabajan en esta&nbsp;&aacute;rea del conocimiento y establece convenios con otras instituciones para la&nbsp;realizaci&oacute;n de pasant&iacute;as de estudiantes de pregrado y posgrado. Est&aacute; adscrito a la&nbsp;Escuela de Biociencias, Facultad de Ciencias, Sede Medell&iacute;n.</p>
<p style="text-align: justify;">Cuenta con una adecuada infraestructura f&iacute;sica y equipos para la implementaci&oacute;n de&nbsp;distintas t&eacute;cnicas moleculares, adem&aacute;s del talento humano id&oacute;neo para la&nbsp;implementaci&oacute;n de diferentes t&eacute;cnicas moleculares en el desarrollo de las&nbsp;investigaciones.</p>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">

                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <asp:LinkButton runat="server" ID="BTN1" CommandArgument="1" OnClick="mOSTARMODAL_Click" class="btn btn-outline-indigo btn-rounded btn-block">Objetivos</asp:LinkButton>

                        </div>
                        <div class="col-md-2">
                            <asp:LinkButton runat="server" ID="BTN2" CommandArgument="2" OnClick="mOSTARMODAL_Click" class="btn btn-outline-indigo btn-rounded btn-block">Misión</asp:LinkButton>

                        </div>
                        <div class="col-md-2">
                            <asp:LinkButton runat="server" ID="BTN3" CommandArgument="3" OnClick="mOSTARMODAL_Click" class="btn btn-outline-indigo btn-rounded btn-block">Visión</asp:LinkButton>

                        </div>

                        <div class="col-md-2">
                            <asp:LinkButton runat="server" ID="BTN4" CommandArgument="4" OnClick="mOSTARMODAL_Click" class="btn btn-outline-indigo btn-rounded btn-block">Políticas de calidad</asp:LinkButton>

                        </div>
                        <div class="col-md-2">
                            <asp:LinkButton runat="server" ID="BTN5" CommandArgument="5" OnClick="mOSTARMODAL_Click" class="btn btn-outline-indigo btn-rounded btn-block">Servicios</asp:LinkButton>

                        </div>

                        <div class="col-md-1"></div>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>


    <div allowoutsideclick: false class="modal fade" id="Objetivos" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Objetivos</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>

                <div class="modal-body">
                </div>



            </div>
        </div>
    </div>

    <div allowoutsideclick: false class="modal fade" id="Mision" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Misión</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal2" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>

                <div class="modal-body">
                </div>

            </div>
        </div>
    </div>
    <div allowoutsideclick: false class="modal fade" id="Vision" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Visión</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal3" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>

                <div class="modal-body">
                </div>

            </div>
        </div>
    </div>
    <div allowoutsideclick: false class="modal fade" id="Politicas" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Políticas de Calidad
                    </h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal4" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>

                <div class="modal-body">
                </div>

            </div>
        </div>
    </div>
    <div allowoutsideclick: false class="modal fade" id="servicios" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class=" modal-xl   modal-dialog ">
            <div class="modal-xl modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelsss">Servicios</h4>
                    <asp:LinkButton runat="server" ID="BtnCerrarModal5" class="close ">
                            <span aria-hidden="true">&times;</span>
                    </asp:LinkButton>
                </div>

                <div class="modal-body">
                </div>

            </div>
        </div>
    </div>


    <script type="text/javascript">
        function ModalObjetivos() {
            $('#Objetivos').modal('show');
        }

        function ModalMision() {
            $('#Mision').modal('show');
        }

        function ModalVision() {
            $('#Vision').modal('show');
        }

        function ModalPolitica() {
            $('#Politicas').modal('show');
        }

        function ModalServicio() {
            $('#servicios').modal('show');
        }
    </script>

</asp:Content>
