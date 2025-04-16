<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Akupara.Registro" %>

<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Akupara</title>
    <link rel="stylesheet" href="assets/index.46ea01ae.css">
    <script src="js/jquery-1.12.4.min.js"></script>
    <link href="css/bootstrap-4.5.3-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="Content/Mensaje_Modal/sweetalert.min.js"></script>
</head>
<body>
    <div id="app" data-v-app="">
        <div class="-m-3 sm:-mx-8 p-3 sm:px-8 relative h-screen lg:overflow-hidden xl:bg-white dark:bg-darkmode-800 xl:dark:bg-darkmode-600 before:hidden before:xl:block before:content-[''] before:w-[57%] before:-mt-[28%] before:-mb-[16%] before:-ml-[13%] before:absolute before:inset-y-0 before:left-0 before:transform before:rotate-[-4.5deg] before:bg-primary/20 before:rounded-[100%] before:dark:bg-darkmode-400 after:hidden after:xl:block after:content-[''] after:w-[57%] after:-mt-[20%] after:-mb-[13%] after:-ml-[13%] after:absolute after:inset-y-0 after:left-0 after:transform after:rotate-[-4.5deg] after:bg-primary after:rounded-[100%] after:dark:bg-darkmode-700">
            <form runat="server">
                <div class="container relative z-10 sm:px-10">
                    <div class="block grid-cols-2 gap-4 xl:grid">
                        <div class="flex-col hidden min-h-screen xl:flex">
                            <a href="" class="flex items-center pt-5 -intro-x text-center">
                                <img alt="Midone Tailwind HTML Admin Template" class="w-32 text-center" src="Akupara/assets/img/escudoUnal.png"></a>
                            <div class="my-auto">
                                <img alt="Midone Tailwind HTML Admin Template" class="w-1/2 -mt-16 -intro-x" src="assets/illustration.bbfd1da0.svg"><div class="mt-10 text-4xl font-medium leading-tight text-white -intro-x">
                                    Bienvenido
                                <br>
                                    Akupara
                                </div>
                                <div class="mt-5 text-lg text-white -intro-x text-opacity-70 dark:text-slate-400">Sistema integrado de procesamiento de muestras </div>
                            </div>
                        </div>
                        <div class="flex h-screen py-5  xl:py-0  m-0 row">
                            <div class="w-full px-5 py-8 mx-auto my-auto bg-white rounded-md shadow-md xl:ml-20 dark:bg-darkmode-600 xl:bg-transparent sm:px-8 xl:p-0 xl:shadow-none sm:w-3/4 lg:w-2/4 xl:w-auto">
                                <div class=" row">
                                    <div class="col-md-12  w-52  rounded-full">
                                        <asp:Image runat="server" src="assets/Akup.png" />
                                    </div>
                                </div>
                                <div class="mt-2 text-center intro-x text-slate-400 xl:hidden">Ingrese sus datos para crear una cuenta y acceder </div>
                                <div>
                                    <div class="row ">


                                        <div class="col-md-6">
                                            <b>Tipo de persona *</b>
                                            <div class="small-group">
                                                <div class="input-group">
                                                    <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="txttipopersona_SelectedIndexChanged" ID="txttipoPersona" class="form-control select2 small  form-control-sm" type="text" required="true" placeholder="Seleccione" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <b>Tipo Identificación *</b>
                                            <div class="small-group">
                                                <div class="input-group">
                                                    <asp:DropDownList runat="server" ID="txttipoIdentificacion" class="form-control small select2 form-control-sm" type="text" required="true" placeholder="Seleccione" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <br />

                                            <div class="form-group">
                                                <b>Número de identificación *</b>
                                                <div>

                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtnumeroIdentificacion" class="form-control small form-control-sm" required="true" placeholder="Identificacion"></asp:TextBox>
                                                    </div>
                                                    <div class="row">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class=" m-1">
                                                            <asp:Panel runat="server" ID="PanelDv" Visible="false">
                                                                <div class="row">
                                                                    <div class="input-group  ">
                                                                        <asp:TextBox runat="server" ID="txtdigitoverificacion" class="form-control small  form-control-sm" required="true" placeholder="Dig. Verificación *"></asp:TextBox>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <br />
                                            <div class="form-group">
                                                <b>Nombre o Razon Social *</b>
                                                <div class="small-group">
                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtnombres" class="form-control small  form-control-sm" type="text" required="true" placeholder="Ingrese Aqui su Nombre o Razon Social " />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="form-group">
                                                <b>Teléfono *</b>
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txttelefono" class="form-control small  form-control-sm" TextMode="Phone" required=""></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <b>Email *</b>
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txtcorreo" class="form-control small  form-control-sm" type="email" required="" placeholder="correo@gmail.com"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <b>Usuario *</b>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtusuario" runat="server" class="form-control small  form-control-sm" name="txtusuario" required="" placeholder="Usuario"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <b>Contraseña *</b>
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txtclave" class="form-control small  form-control-sm" type="password" name="login[password]" required="" placeholder="*********"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <b>Confirmar Contraseña *</b>
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txtrepclave" class="form-control small  form-control-sm" type="password" name="login[password]" required="" placeholder="*********"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex mt-4 text-xs intro-x text-slate-600 dark:text-slate-500 sm:text-sm">
                                    <div class="flex items-center mr-auto">
                                        <asp:LinkButton OnClick="btnregistro_Click1" CausesValidation="true" runat="server" ID="btnRegistro" CssClass="transition duration-200 border shadow-sm inline-flex btn btn-info">Registrate</asp:LinkButton>
                                        <asp:LinkButton runat="server" OnClick="Unnamed_Click1" class="transition duration-200 border shadow-sm inline-flex btn btn-light">Acceder</asp:LinkButton>

                                    </div>
                                </div>

                                <div class="mt-10 text-center intro-x xl:mt-24 text-slate-600 dark:text-slate-500 xl:text-left"><a class="text-primary dark:text-slate-200" href="">Terminos y condiciones </a>&amp; <a class="text-primary dark:text-slate-200" href="">Privacy Policy </a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
</body>
</html>
