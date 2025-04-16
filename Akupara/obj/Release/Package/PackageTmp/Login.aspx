<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Akupara.Login" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Akupara</title>
     <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="assets/index.46ea01ae.css">
    <script src="js/jquery-1.12.4.min.js"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="Content/Mensaje_Modal/sweetalert.min.css" rel="stylesheet" />
    <script src="Content/Mensaje_Modal/sweetalert.min.js"></script>
</head>
<body>
    <div id="app" data-v-app="">
        <div class="-m-3 sm:-mx-8 p-3 sm:px-8 relative h-screen lg:overflow-hidden bg-primary xl:bg-white dark:bg-darkmode-800 xl:dark:bg-darkmode-600 before:hidden before:xl:block before:content-[''] before:w-[57%] before:-mt-[28%] before:-mb-[16%] before:-ml-[13%] before:absolute before:inset-y-0 before:left-0 before:transform before:rotate-[-4.5deg] before:bg-primary/20 before:rounded-[100%] before:dark:bg-darkmode-400 after:hidden after:xl:block after:content-[''] after:w-[57%] after:-mt-[20%] after:-mb-[13%] after:-ml-[13%] after:absolute after:inset-y-0 after:left-0 after:transform after:rotate-[-4.5deg] after:bg-primary after:rounded-[100%] after:dark:bg-darkmode-700">
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
                        <div class="flex h-screen py-5 my-10 xl:h-auto xl:py-0 xl:my-0">
                            <div class="w-full px-5 py-8 mx-auto my-auto bg-white rounded-md shadow-md xl:ml-20 dark:bg-darkmode-600 xl:bg-transparent sm:px-8 xl:p-0 xl:shadow-none sm:w-3/4 lg:w-2/4 xl:w-auto">
                                <div class=" row-start-4">
                                    <div class="col-span-12  w-52  rounded-full">
                                        <asp:Image runat="server" src="assets/Akup.png" />
                                    </div>
                                </div>
                                <div class="mt-2 text-center intro-x text-slate-400 xl:hidden">Accede al Sistema integrado de procesamiento de muestras </div>
                                <div class="mt-8 intro-x">
                                    <asp:TextBox runat="server" ID="txtusuario" CssClass="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&amp;[readonly]]:bg-slate-100 [&amp;[readonly]]:cursor-not-allowed [&amp;[readonly]]:dark:bg-darkmode-800/50 [&amp;[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 block px-4 py-3 intro-x login__input min-w-full xl:min-w-[350px]" placeholder="Usuario"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="txtclave"  OnTextChanged="txtclave_TextChanged" CssClass="disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&amp;[readonly]]:bg-slate-100 [&amp;[readonly]]:cursor-not-allowed [&amp;[readonly]]:dark:bg-darkmode-800/50 [&amp;[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 block px-4 py-3 mt-4 intro-x login__input min-w-full xl:min-w-[350px]" type="password" placeholder="Contraseña"></asp:TextBox>

                                </div>
                                <div class="flex mt-4 text-xs intro-x text-slate-600 dark:text-slate-500 sm:text-sm">
                                    <div class="flex items-center mr-auto">
                                        <input class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&amp;[type='radio']]:checked:bg-primary [&amp;[type='radio']]:checked:border-primary [&amp;[type='radio']]:checked:border-opacity-10 [&amp;[type='checkbox']]:checked:bg-primary [&amp;[type='checkbox']]:checked:border-primary [&amp;[type='checkbox']]:checked:border-opacity-10 [&amp;:disabled:not(:checked)]:bg-slate-100 [&amp;:disabled:not(:checked)]:cursor-not-allowed [&amp;:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&amp;:disabled:checked]:opacity-70 [&amp;:disabled:checked]:cursor-not-allowed [&amp;:disabled:checked]:dark:bg-darkmode-800/50 mr-2 border" type="checkbox" id="remember-me"><label class="cursor-pointer select-none" for="remember-me"> Recordar</label>
                                    </div>
                                    <a href="">Olvidaste tu Contraseña?</a>
                                </div>
                                <div class="mt-5 text-center intro-x xl:mt-8 xl:text-left">
                                    <asp:LinkButton runat="server" OnClick="Button1_Click" ID="btnAcceder" CssClass="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&amp;:hover:not(:disabled)]:bg-opacity-90 [&amp;:hover:not(:disabled)]:border-opacity-90 [&amp;:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed bg-primary border-primary text-white dark:border-primary w-full px-4 py-3 align-top xl:w-32 xl:mr-3">Acceder</asp:LinkButton>

                                    <asp:LinkButton runat="server" OnClick="Unnamed_Click" class="transition duration-200 border shadow-sm inline-flex items-center justify-center rounded-md font-medium cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&amp;:hover:not(:disabled)]:bg-opacity-90 [&amp;:hover:not(:disabled)]:border-opacity-90 [&amp;:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed border-secondary text-slate-500 dark:border-darkmode-100/40 dark:text-slate-300 [&amp;:hover:not(:disabled)]:bg-secondary/20 [&amp;:hover:not(:disabled)]:dark:bg-darkmode-100/10 w-full px-4 py-3 mt-3 align-top xl:w-32 xl:mt-0">Registrate</asp:LinkButton>
                                </div>
                                <div class="mt-10 text-center intro-x xl:mt-24 text-slate-600 dark:text-slate-500 xl:text-left"><a class="text-primary dark:text-slate-200" href="">Terminos y condiciones </a>&amp; <a class="text-primary dark:text-slate-200" href="">Privacy Policy </a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

