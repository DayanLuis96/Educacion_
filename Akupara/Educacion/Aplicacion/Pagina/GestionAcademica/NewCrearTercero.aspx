<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewCrearTercero.aspx.cs" Inherits="Akupara.Educacion.Aplicacion.Pagina.GestionAcademica.NewCrearTercero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Stilos_JS_Boostrapp_5/css/bootstrap.css" rel="stylesheet" />
    <link href="../../../Stilos_JS_Boostrapp_5/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Stilos_JS_Boostrapp_5/js/bootstrap.js"></script>
    <script src="../../../Stilos_JS_Boostrapp_5/js/bootstrap.min.js"></script>
    <link href="../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="../../../Stilos_JS_Boostrapp_5/Mensaje_Modal/sweetalert.min.js"></script>
    <!-- jQuery primero -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h5 class="text-primary">📄 Datos básicos
    </h5>
    <hr class="mb-4">
    <div class=" row">
        <div class=" col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Tipo*</span>
                    </div>
                    <asp:DropDownList ID="txttipodocumento" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Documento*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtdocumento" />
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <asp:Button Text="Guardar Datos" ID="btnguardardatos" CssClass="btn btn-outline-success btn-sm form-control form-control-sm" OnClick="btnguardardatos_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" runat="server" />
            </div>
        </div>
        <div class="col-md-3">
            <div class="form-group">
                <asp:Button Text="Cancelar" ID="btncancelar" CssClass="btn btn-outline-danger btn-sm form-control form-control-sm" OnClick="btncancelar_Click" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" runat="server" />
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Primer Nombre -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Primer Nombre*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtprimernombre" />
                </div>
            </div>
        </div>

        <!-- Segundo Nombre -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Segundo Nombre</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtsegundonombre" />
                </div>
            </div>
        </div>

        <!-- Primer Apellido -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Primer Apellido*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtprimerapellido" />
                </div>
            </div>
        </div>

        <!-- Segundo Apellido -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Segundo Apellido</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtsegundoapellido" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Fecha de Nacimiento -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha Nacimiento*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtfechanacimiento" TextMode="Date" />
                </div>
            </div>
        </div>

        <!-- Lugar de Nacimiento -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Lugar Nacim.</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtlugarnacimiento" />
                </div>
            </div>
        </div>

        <!-- Género -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Género*</span>
                    </div>
                    <asp:DropDownList ID="txtgenero" runat="server" CssClass="form-control form-control-sm">
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- Grupo Sanguíneo -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Grupo Sanguíneo</span>
                    </div>
                    <asp:DropDownList ID="txtgruposanguineo" runat="server" CssClass="form-control form-control-sm" />
                    <asp:DropDownList ID="txtfactorrh" runat="server" CssClass="form-control form-control-sm" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Correo Electrónico -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Correo*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtcorreo" TextMode="Email" />
                </div>
            </div>
        </div>

        <!-- Teléfono Celular -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Celular*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtcelular" />
                </div>
            </div>
        </div>

        <!-- Teléfono Fijo -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Teléfono Fijo</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txttelefonofijo" />
                </div>
            </div>
        </div>
        <!-- Estrato Socioeconómico -->
        <div class="col-md-3">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Estrato*</span>
                    </div>
                    <asp:DropDownList ID="txtestrato" runat="server" CssClass="form-control form-control-sm">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Municipio -->
        <div class="col-md-6">
            <div class="form-group">
                <asp:DropDownList ID="txtmunicipio" runat="server" CssClass="select2 form-control   form-control-sm " />
            </div>
        </div>
        <!-- Dirección -->
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Dirección*</span>
                    </div>
                    <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtdireccion" />
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div clas="col-md-12" runat="server" id="paneldatosestudiantes">
        <hr class="my-4">
        <h5 class="text-primary">👨‍👩‍👧 Datos Familiares / Acudiente
        </h5>
        <hr class="mb-4">

        <div class="row">
            <!-- Nombre Completo del Acudiente -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nombre Acudiente*</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtnombreacudiente" />
                    </div>
                </div>
            </div>

            <!-- Parentesco -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Parentesco*</span>
                        </div>
                        <asp:DropDownList ID="txtparentesco" runat="server" CssClass="form-control form-control-sm">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- Número de Documento del Acudiente -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Doc. Acudiente*</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtdocumentoacudiente" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Teléfono de contacto -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Teléfono*</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txttelefonoacudiente" />
                    </div>
                </div>
            </div>

            <!-- Correo del acudiente -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Correo</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtcorreoacudiente" TextMode="Email" />
                    </div>
                </div>
            </div>

            <!-- Dirección (si es diferente) -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Dirección Acudiente</span>
                        </div>
                        <asp:TextBox runat="server" CssClass="form-control form-control-sm" ID="txtdireccionacudiente" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Responsable Matrícula -->
            <div class="col-md-6">
                <div class="form-group">
                    <asp:CheckBox Text="Responsable Matrícula" ID="responmatricula" CssClass=" badge badge-info" runat="server" />
                    <asp:CheckBox Text="Responsable Financiero" ID="responfinanciero" CssClass=" badge badge-success" runat="server" />
                </div>
            </div>
        </div>
        <hr class="my-4">
        <h5 class="text-primary">❤️ Datos Médicos y de Bienestar
        </h5>
        <hr class="mb-4">

        <div class="row">
            <!-- EPS o Seguro Médico -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">EPS / Seguro*</span>
                        </div>
                        <asp:TextBox ID="txteps" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Condiciones médicas especiales -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Condiciones Médicas</span>
                        </div>
                        <asp:TextBox ID="txtcondicionesmedicas" runat="server" CssClass="form-control form-control-sm" placeholder="Alergias, discapacidades, medicamentos..." />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Personas autorizadas para recoger al alumno -->
            <div class="col-md-12">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Personas Autorizadas</span>
                        </div>
                        <asp:TextBox ID="txtpersonasautorizadas" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="2" placeholder="Ingrese nombres de personas autorizadas para recoger al alumno..." />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Vacunas Actualizadas -->
            <div class="col-md-4">
                <div class="form-group">
                    <asp:CheckBox Text="Esquema Vacunacion Actualizado" ID="checesquemavacunacion" CssClass="badge badge-info" runat="server" />
                </div>
            </div>
        </div>


        <hr class="my-4">
        <h5 class="text-primary">🏫 Datos Académicos
        </h5>
        <hr class="mb-4">
        <div class="row">
            <!-- Año lectivo de matrícula -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Año Lectivo*</span>
                        </div>
                        <asp:DropDownList ID="txtaniolectivos" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Grado a cursar -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Grado*</span>
                        </div>
                        <asp:DropDownList ID="txtgrados" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Jornada -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Jornada*</span>
                        </div>
                        <asp:DropDownList ID="txtjornada" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Estado de Matrícula -->
            <div class="col-md-3">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Estado Matrícula*</span>
                        </div>
                        <asp:DropDownList ID="txtestadomatricula" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Modalidad -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Modalidad*</span>
                        </div>
                        <asp:DropDownList ID="txtmodalidad" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Sede -->
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Sede</span>
                        </div>
                        <asp:DropDownList ID="txtsedes" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>
        </div>

        <hr class="my-4">
        <h5 class="text-primary">🛡️ Datos de Control Interno (Uso del Colegio)
        </h5>
        <hr class="mb-4">

        <div class="row">
            <!-- Código interno del estudiante -->
            <div class="col-md-4">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Código Interno</span>
                        </div>
                        <asp:TextBox ID="txtcodigointerno" Enabled="false" runat="server" CssClass="form-control form-control-sm" />
                    </div>
                </div>
            </div>

            <!-- Fecha de inscripción -->
            <div class="col-md-4">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Fecha Inscripción*</span>
                        </div>
                        <asp:TextBox ID="txtfechainscripcion" runat="server" CssClass="form-control form-control-sm" TextMode="Date" />
                    </div>
                </div>
            </div>

            <!-- Fecha de matrícula -->
            <div class="col-md-4">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Fecha Matrícula*</span>
                        </div>
                        <asp:TextBox ID="txtfechamatricula" runat="server" CssClass="form-control form-control-sm" TextMode="Date" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Observaciones -->
            <div class="col-md-12">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Observaciones</span>
                        </div>
                        <asp:TextBox ID="txtobservaciones" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine" Rows="3" placeholder="Ingrese aquí cualquier observación adicional..." />
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-4">
        <h5 class="text-primary">📎 Documentos Requeridos (Subida de Archivos)
        </h5>
        <hr class="mb-4">
    </div>
        </div>
    <script type="text/javascript">
        function aplicarSelect2() {
            var control = $('#<%= txtmunicipio.ClientID %>');
            control.select2({
                placeholder: "Seleccione un municipio",
                allowClear: true,
                width: '100%' // Se adapta al ancho
            });
        }

        // Para que funcione con PostBack parcial
        if (typeof Sys !== 'undefined' && Sys.Application) {
            Sys.Application.add_load(function () {
                aplicarSelect2();
            });
        } else {
            $(document).ready(function () {
                aplicarSelect2();
            });
        }
    </script>


</asp:Content>
