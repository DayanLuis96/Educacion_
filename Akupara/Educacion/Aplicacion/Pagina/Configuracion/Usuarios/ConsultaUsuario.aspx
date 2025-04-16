<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="ConsultaUsuario.aspx.cs" Inherits="Educacion.Educacion.Aplicacion.Pagina.Configuracion.Usuarios.ConsultaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header-title">



        <div class="row">
            <div class="col-md-10">
                <div class="mb-0 mb-lg-0 mb-xl-0">
                    <h4 class="mb-2">Usuarios</h4>
                    <div class="main-content-breadcrumb"><span>Admin usuarios</span>  </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="mb-0 mb-lg-12 mb-xl-12">
                    <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="lbn_NuevoUsuario_Click" data-toggle="tooltip" title="Nuevo" ID="lbn_NuevoUsuario"><i class="fa fa-plus"> Nuevo Usuario</i></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnAtrasDetalle" OnClick="btnAtrasDetalle_Click" Visible="false" class="btn btn-danger btn-icon " data-toggle="tooltip" title="Atras"><i class="typcn typcn-arrow-back-outline"></i></asp:LinkButton>
                </div>

            </div>
        </div>

    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div runat="server" visible="true" id="divUsuarios">
        <div class="card">
            <div class="card-header">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tableS" class="table table-striped border   form-control-sm">
                            <thead>
                                <tr>

                                    <th>Tipo Identificacion</th>
                                    <th>Documento</th>
                                    <th>Nombre Completo</th>
                                    <th>Usuario</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater runat="server" ID="UsuariosRepeter">
                                    <ItemTemplate>
                                        <tr>

                                            <td>
                                                <asp:Label Visible="false" ID="IDTema" Text=' <%# Eval("ID") %>' runat="server"></asp:Label>

                                                <asp:Label ID="TemaDiscu" Text='<%# Eval("CODIGO")%>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label1" Text='<%# Eval("NUMERO_IDENTIFICACION") %>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label3" Text='<%# Eval("nombre") %>' runat="server"></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label ID="Label2" Text='<%# Eval("nombreUsuario") %>' runat="server"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="txtestados" Text='<%# Eval("ESTADO") %>' runat="server"></asp:Label>
                                            </td>
                                            <td class="text-center">
                                                <div class=" text-left">

                                                    <asp:LinkButton runat="server" ID="btnEditar" data-toggle="tooltip" title="Editar Usuario" OnCommand="btnEditar_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-info"><i class="fa fa-pencil-square-o fa-1x"></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" ID="btnCredenciales" data-toggle="tooltip" title="Credenciales" OnCommand="btnCredenciales_Command" CommandArgument='<%#Eval("ID")%>' class="btn btn-warning"><i class="fa fa-user-circle fa-1x"></i></asp:LinkButton>
                                                    <asp:LinkButton runat="server" CssClass='<%# Eval("class") %>' data-toggle="tooltip" title="Cambiar Estado" ID="lbn_EstadoT" OnCommand="lbn_EstadoT_Command" CommandArgument='<%#Eval("ID")%>'><i class="fa fa-refresh fa-1x"></i></asp:LinkButton>
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


    <asp:Panel ID="panelNuevoUsuario" runat="server" Visible="false">
        <div class="col-md-12 col-xl-12 col-xs-12 col-sm-12">

            <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
                <div class="card card-info">

                    <div class="card-body text-secondary">
                        <div class="card">
                            <div class="card-body ">
                                <hr class="m-0" />
                                <div class="pd-15  bg-gray-200 small formlayout">
                                    <div class="row row-sm">

                                        <div class="row ">


                                            <div class="col-md-6">
                                                <b>Tipo de persona *</b>
                                                <div class="small-group">
                                                    <div class="input-group">
                                                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="txttipopersona_SelectedIndexChanged" ID="txttipoPersona" class="form-control small select2 form-control-sm" type="text" required="true" placeholder="Seleccione" />
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

                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <b>Usuario *</b>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txtusuario" runat="server" class="form-control small  form-control-sm" name="txtusuario" required="" placeholder="Usuario"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <b>Perfil</b>
                                                    <asp:DropDownList ID="ddlPerfil" CssClass="form-control select2 small  form-control-sm" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-3" runat="server" id="divContrasena">
                                                <div class="form-group">
                                                    <b>Contraseña *</b>
                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtclave" class="form-control small  form-control-sm" type="password" name="login[password]" required="" placeholder="*********"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3" runat="server" id="divConfirContrasena">
                                                <div class="form-group">
                                                    <b>Confirmar Contraseña *</b>
                                                    <div class="input-group">
                                                        <asp:TextBox runat="server" ID="txtrepclave" class="form-control small  form-control-sm" type="password" name="login[password]" required="" placeholder="*********"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="col-md-12 text-center">
                            <asp:LinkButton OnClick="btnregistro_Click1" CausesValidation="true" runat="server" ID="btnRegistro" Text="Guardar Usuario" CssClass="transition duration-200 border shadow-sm inline-flex btn btn-info"></asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>


        </div>


    </asp:Panel>



    <%--Codigo JavaScript--%>

    <script type="text/javascript">



        function MostrarMensajeEliminar() {

            $('#NuevoElemento').modal('show');

        }


        function MostrarMensajeEliminar2() {

            $('#NuevoUsuario').modal('show');

        }

    </script>

    <div class="modal fade" id="NuevoUsuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Usuario</h5>

                </div>

                <div class="modal-body">

                    <div class="box box-primary box-group">
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>Cargar Foto</label>
                                                <div class="form-group">
                                                    <asp:Image ID="imgpaciente" runat="server" CssClass="auto-style2" Height="115px" Width="150px" ImageUrl="~/images/NingunProducto.png" />
                                                    <asp:FileUpload ID="filefotousuario" runat="server" accept=".jpg" CssClass=" form-control" />
                                                    <asp:Button ID="btnadjuntarfoto" runat="server" CssClass="btn btn-primary" Text="Adjuntar" Width="144px" OnClick="btnadjuntarfoto_Click"></asp:Button>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="box box-primary">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label>Cargar Firma</label>
                                                <div class="form-group">
                                                    <asp:Image ID="imgfirma" runat="server" CssClass="auto-style2" Height="115px" Width="150px" ImageUrl="~/images/NingunProducto.png" />
                                                    <asp:FileUpload ID="filefirma" runat="server" accept=".jpg" CssClass=" form-control" />
                                                    <asp:Button ID="btnadjuntarfirma" runat="server" CssClass="btn btn-primary" Text="Adjuntar" Width="144px" OnClick="btnadjuntarfirma_Click"></asp:Button>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Perfil</label>
                                        <asp:DropDownList ID="DropDownrol" CssClass="form-control select2" runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <br />
                                        <asp:LinkButton ID="btnresetearclave" CssClass="btn btn-success" data-toggle="modal" data-target="#BuscarTErcero1" runat="server">Resetear Clave</asp:LinkButton>
                                    </div>
                                </div>

                            </div>



                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <asp:LinkButton CssClass="btn btn-danger form-control" data-dismiss="modal" runat="server" Text="Cerrar" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="box-body">
                                <div class="form-group">
                                    <asp:LinkButton CssClass="btn btn-primary form-control fa fa-plus-circle" ID="btnGuardarUsuario" OnClick="btnGuardarUsuario_Click" runat="server" Text="Guardar" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>


    <%--resetear clave--%>

    <div allowoutsideclick: false class="modal fade" id="BuscarTErcero1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="form">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel1">Reestablecer clave…</h4>
                </div>
                <div class="modal-body">
                    <div class="content">
                        <label>Nueva Clave</label>
                        <asp:TextBox ID="txtnuevaclave" placeholder="Ingrese Clave" MaxLength="8" TextMode="Password" runat="server" Enabled="true" CssClass="form-control"></asp:TextBox>
                        <label>Confirmar Clave</label>
                        <asp:TextBox ID="txtconfirmenuevaclave" placeholder="Confirme su clave" MaxLength="8" TextMode="Password" runat="server" Enabled="true" CssClass="form-control"></asp:TextBox>

                    </div>
                    <br />

                    <asp:Button ID="btnguardarrest" runat="server" Text="Actualizar" CssClass="btn btn-success" OnClick="btnguardarrest_Click" />

                </div>
            </div>
        </div>
    </div>

</asp:Content>
