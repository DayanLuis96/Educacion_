<%@ Page Title="" Language="C#" MasterPageFile="~/Educacion/Aplicacion/Principal/MasterPage.Master" AutoEventWireup="true" CodeBehind="Config_Institucion.aspx.cs" Inherits="Akupara.Educacion.Aplicacion.Pagina.Config_Institucion.Config_Institucion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">
       <div class="col-12">
           <div class="page-title-box d-sm-flex align-items-center justify-content-between">
               <h4 class="mb-sm-0">Configurar Institución</h4>

               <div class="page-title-right ">
                  <div class="row">
                      <div class="col-md-7">
                           <div class="input-group input-group-sm">
                       <ol class="breadcrumb m-1">
                           <li class="breadcrumb-item"><a href="javascript: void(0);">Institución</a></li>
                           <li class="breadcrumb-item active">Configurar Intitución  </li>
                       </ol>
                      
                   </div>
                      </div>
                      <div class="col-md-5">
                           <asp:LinkButton runat="server" OnClick="Unnamed_Click" CssClass="btn btn-success btn-sm"><i class="bi bi-save"></i> Guardar</asp:LinkButton>
                       <asp:LinkButton runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" CssClass="btn btn-danger btn-sm"><i class="bi bi-exclude"></i> Cancelar</asp:LinkButton>
                      </div>
                   
                  </div>
                  
               </div>

           </div>
       </div>
   </div>



   <div class="row">
       <div class="col-lg-12">
           <div class="card">
               <div class="card-body">

                   <!-- Nav tabs -->
                   <ul class="nav nav-tabs nav-tabs-custom nav-success nav-justified mb-3" role="tablist">
                       <li class="nav-item" role="presentation">
                            <asp:Button runat="server" class=" btn btn-primary  " data-bs-toggle="tab" href="#home1" role="tab" aria-selected="true" Text="Información Basica" /> 
                       </li>
                       <li class="nav-item" role="presentation">
                            <asp:Button runat="server" class=" btn btn-primary" data-bs-toggle="tab" href="#profile1" role="tab" aria-selected="false" tabindex="-1" Text="Escudo" />
                       </li>
                       <li class="nav-item" role="presentation">
                           <asp:Button runat="server" class=" btn btn-primary" data-bs-toggle="tab" href="#messages1" role="tab" aria-selected="false" tabindex="-1" Text="Bandera" />
                       </li>
                      
                   </ul>

                   <!-- Tab panes -->
                   <div class="tab-content text-muted">
                       <asp:MultiView runat="server" ActiveViewIndex="0" ID="multi">
                           <asp:View runat="server" >
                                <div class="tab-pane active show" id="home1" role="tabpanel">
                           <%--Datos basicos--%>
                           <div>
                               <div class="row">
                                   <div class="col-md-12">
                                       <h5 class="mb-3">Datos Basicos</h5>
                                       <div class="card">
                                           <div class="card-body">
                                               <div class="row ">
                                                   <div class="col-lg-2 ">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text bg-body-secondary" id="inputGroup-sizing-sm"><b>NIT</b> </span>
                                                           <asp:TextBox runat="server" ID="txtnit" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-6">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text" id="inputGroup-sizing-sm"><b>Nombre de la Institución</b></span>
                                                           <asp:TextBox runat="server" ID="txtnombreInstitucion" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-4">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text" id="inputGroup-sizing-sm"><b>Abreviatura</b> </span>
                                                           <asp:TextBox runat="server" ID="txtAbreviatura" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                               <br />
                                               <div class="row">

                                                   <div class="col-lg-2">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text" id="inputGroup-sizing-sm"><b>Código DANE</b></span>
                                                           <asp:TextBox runat="server" ID="txtCodDane" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-2">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Código ICFES</b> </span>
                                                           <asp:TextBox runat="server" ID="txtCodIcfes" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-2">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Calendario</b> </span>
                                                           <asp:DropDownList runat="server" ID="txtcalendario" CssClass="form-control choices"></asp:DropDownList>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-2">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Sector</b> </span>
                                                           <asp:DropDownList runat="server" ID="txtsector" CssClass="form-control choices"></asp:DropDownList>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-4">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Telefonos</b> </span>
                                                           <asp:TextBox runat="server" ID="txtTelefonos" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                               <br />
                                               <div class="row">
                                                   <div class="col-lg-4">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Pagina Web</b> </span>
                                                           <asp:TextBox runat="server" ID="txtPaginaWeb" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   <div class="col-lg-4">
                                                       <div class="input-group input-group-sm">
                                                           <span class="input-group-text " id="inputGroup-sizing-sm"><b>Fax</b> </span>
                                                           <asp:TextBox runat="server" ID="txtFax" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>

                                       </div>
                                       <!-- end card-body -->
                                   </div>
                                   <!-- end card -->
                               </div>
                               <div class="col-md-12">
                                   <h5 class="mb-3">Ubicacion</h5>
                                   <div class="card">
                                       <div class="card-body">
                                           <div class="row">
                                               <div class="col-lg-2">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><b>Departamento</b> </span>
                                                       <asp:DropDownList runat="server" ID="txtdepartamento" AutoPostBack="true" OnTextChanged="txtdepartamento_TextChanged" CssClass="form-control choices"></asp:DropDownList>
                                                   </div>
                                               </div>
                                               <div class="col-lg-2">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><b>Municipio</b> </span>
                                                       <asp:DropDownList runat="server" data-choices ID="txtmunicipio" CssClass="form-control "></asp:DropDownList>
                                                   </div>
                                               </div>
                                               <div class="col-lg-2">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><b>Zona</b> </span>
                                                       <asp:DropDownList runat="server" ID="txtzona" CssClass="form-control choices"></asp:DropDownList>
                                                   </div>
                                               </div>
                                               <div class="col-lg-6">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><b>Dirección</b> </span>
                                                       <asp:TextBox runat="server" ID="txtdireccion" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                   </div>
                                               </div>

                                           </div>
                                           <br />
                                           <div class="row">
                                               <div class="col-lg-6">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><b>Barrio - Corregimiento</b> </span>
                                                       <asp:TextBox runat="server" ID="txtBarrio" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                                   </div>
                                               </div>


                                           </div>

                                       </div>
                                       <!-- end card-body -->
                                   </div>
                                   <!-- end card -->
                               </div>

                               <div class="col-md-12">
                                   <h5 class="mb-3">Parametrización del Rector y Secretario</h5>
                                   <div class="card">
                                       <div class="card-body">
                                           <div class="row">
                                               <div class="col-md-6 card card-body">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><i class="bi bi-search"></i><b>Buscar</b> </span>
                                                       <asp:TextBox type="text" class="form-control" runat="server" ID="txtbuscarRector" placeholder="Buscar Rector"></asp:TextBox>
                                                       <asp:Button runat="server" class="btn btn-primary" type="button" Text="Buscar" OnClick="Unnamed_Click1" />
                                                       <button class="btn btn-success" type="button">Limpiar</button>
                                                   </div>

                                                   <asp:TextBox type="text" class="form-control form-control-sm " Font-Bold="true" Enabled="false" runat="server" ID="txtRector" placeholder="Rector Seleccionado"></asp:TextBox>

                                                   <asp:Panel runat="server" Visible="false" ID="PanelTerceroRector">
                                                       <asp:GridView ID="TablaTerceroR" runat="server" OnSelectedIndexChanged="TablaTerceroR_SelectedIndexChanged" CssClass="small  table-sm table-special-green rounded shadow text-center" HeaderStyle-Height="30" HeaderStyle-BackColor="#dedee4" Width="100%" AutoGenerateColumns="false">
                                                           <Columns>
                                                               <asp:TemplateField Visible="false">
                                                                   <ItemTemplate>
                                                                       <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="NUMERO_IDENTIFICACION" Visible="false" Text='<%# Bind("NUMERO_IDENTIFICACION") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_TIPO_IDENTIFICACION" Visible="false" Text='<%# Bind("ID_TIPO_IDENTIFICACION") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="NOMBRE_COMPLETO" Visible="false" Text='<%# Bind("NOMBRE_COMPLETO") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_DEPARTAMENTO" Visible="false" Text='<%# Bind("ID_DEPARTAMENTO") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_CIUDAD" Visible="false" Text='<%# Bind("ID_CIUDAD") %>'></asp:Label>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:BoundField DataField="REGISTRO_COMPLETO" ItemStyle-CssClass="font-weight-bold " HeaderText="Cliente" SortExpression="REGISTRO_COMPLETO" />
                                                               <asp:BoundField DataField="EMAIL" HeaderText="Correo" SortExpression="EMAIL" />
                                                               <asp:BoundField DataField="TELEFONO1" HeaderText="Teléfono" SortExpression="TELEFONO1" />
                                                               <asp:BoundField DataField="DIRECCION" HeaderText="Dirección" SortExpression="DIRECcION" />


                                                               <asp:TemplateField ItemStyle-CssClass="text-center  " HeaderStyle-CssClass="text-center table-hover">
                                                                   <ItemTemplate>
                                                                       <asp:LinkButton runat="server" CommandName="Select" CssClass="btn btn-success"><i class='bi bi-check'></i></asp:LinkButton>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                           </Columns>
                                                       </asp:GridView>

                                                   </asp:Panel>

                                               </div>
                                               <div class="col-md-6 card card-body">
                                                   <div class="input-group input-group-sm">
                                                       <span class="input-group-text " id="inputGroup-sizing-sm"><i class="bi bi-search"></i><b>Buscar</b> </span>
                                                       <asp:TextBox type="text" class="form-control" OnTextChanged="txtbuscarAux_TextChanged" runat="server" ID="txtbuscarAux" placeholder="Buscar Auxiliar administrativo"></asp:TextBox>
                                                       <asp:Button runat="server" ID="btnBuscarAux" OnClick="btnBuscarAux_Click" class="btn btn-primary" type="button" Text="Buscar" />
                                                       <button class="btn btn-success" type="button">Limpiar</button>
                                                   </div>
                                                   <asp:TextBox type="text" class="form-control form-control-sm " Font-Bold="true" Enabled="false" runat="server" ID="txtAuxiliar" placeholder="Auxiliar administrativo Seleccionado"></asp:TextBox>
                                                   <asp:Panel runat="server" Visible="false" ID="PanelTerceroAuxiliar">
                                                       <asp:GridView ID="TablaTerceroAux" runat="server" OnSelectedIndexChanged="TablaTerceroAux_SelectedIndexChanged" CssClass="small  table-sm table-special-green rounded shadow text-center" HeaderStyle-Height="30" HeaderStyle-BackColor="#dedee4" Width="100%" AutoGenerateColumns="false">
                                                           <Columns>
                                                               <asp:TemplateField Visible="false">
                                                                   <ItemTemplate>
                                                                       <asp:Label runat="server" ID="txtid" Visible="false" Text='<%# Bind("ID") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="NUMERO_IDENTIFICACION" Visible="false" Text='<%# Bind("NUMERO_IDENTIFICACION") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_TIPO_IDENTIFICACION" Visible="false" Text='<%# Bind("ID_TIPO_IDENTIFICACION") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="NOMBRE_COMPLETO" Visible="false" Text='<%# Bind("NOMBRE_COMPLETO") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_DEPARTAMENTO" Visible="false" Text='<%# Bind("ID_DEPARTAMENTO") %>'></asp:Label>
                                                                       <asp:Label runat="server" ID="ID_CIUDAD" Visible="false" Text='<%# Bind("ID_CIUDAD") %>'></asp:Label>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:BoundField DataField="REGISTRO_COMPLETO" ItemStyle-CssClass="font-weight-bold " HeaderText="Cliente" SortExpression="REGISTRO_COMPLETO" />
                                                               <asp:BoundField DataField="EMAIL" HeaderText="Correo" SortExpression="EMAIL" />
                                                               <asp:BoundField DataField="TELEFONO1" HeaderText="Teléfono" SortExpression="TELEFONO1" />
                                                               <asp:BoundField DataField="DIRECCION" HeaderText="Dirección" SortExpression="DIRECcION" />


                                                               <asp:TemplateField ItemStyle-CssClass="text-center  " HeaderStyle-CssClass="text-center table-hover">
                                                                   <ItemTemplate>
                                                                       <asp:LinkButton runat="server" CommandName="Select" CssClass="btn btn-success"><i class='bi bi-check'></i></asp:LinkButton>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                           </Columns>
                                                       </asp:GridView>
                                                   </asp:Panel>
                                               </div>
                                           </div>

                                       </div>
                                       <!-- end card-body -->
                                   </div>
                                   <!-- end card -->
                               </div>
                           </div>






                       </div>
                           </asp:View>
                           <asp:View runat="server" >
                                                      <div class="tab-pane" id="profile1" role="tabpanel">
                           <div class="row">
                               <div class="col-md-12">
                                   <div class="card-body">
                                       <div class="card-body">

                                           <div class="dropzone">
                                               <div class="fallback">
                                                   <div class="row">
                                                       <div class="col-md-4">

                                                           <div class="input-group input-group-sm">
                                                               <asp:FileUpload runat="server" ID="fileEscudo" accept=".jpg,.png" CssClass=" form-control form-control-sm" />
                                                               <asp:Button class="btn btn-primary" runat="server" OnClick="btnGuardarEscudoo_Click" ID="btnGuardarEscudoo" Text="Cargar" />
                                                           </div>

                                                       </div>
                                                   </div>

                                               </div>
                                               <div class="dz-message needsclick">
                                                   <div class="mb-3">

                                                       <asp:Image ID="imgEscudo" runat="server" CssClass="display-4 text-muted ri-upload-cloud-2-fill" Height="300px" Width="300px" />
                                                   </div>

                                                   <h4 runat="server" id="txtNohayEscudo">Escudo de la Institución</h4>
                                               </div>
                                           </div>


                                           <!-- end dropzon-preview -->
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>

                           </asp:View>
                           <asp:View runat="server" >
                                                      <div class="tab-pane" id="messages1" role="tabpanel">
                           <div class="row">
                               <div class="col-md-12">
                                   <div class="card-body">
                                       <div class="card-body">

                                           <div class="dropzone">
                                               <div class="fallback">
                                                   <div class="row">
                                                       <div class="col-md-4">

                                                           <div class="input-group input-group-sm">
                                                               <asp:FileUpload runat="server" ID="Filebandera" accept=".jpg,.png" CssClass=" form-control form-control-sm" />
                                                               <asp:Button class="btn btn-primary" runat="server" OnClick="Btncargarbandera_Click" ID="Btncargarbandera" Text="Cargar" />
                                                           </div>

                                                       </div>
                                                   </div>

                                               </div>
                                               <div class="dz-message needsclick">
                                                   <div class="mb-3">

                                                       <asp:Image ID="ImgBandera" runat="server" CssClass="display-4 text-muted ri-upload-cloud-2-fill" Height="300px" Width="300px" />
                                                   </div>

                                                   <h4>Bandera de la Institución</h4>
                                               </div>
                                           </div>


                                           <!-- end dropzon-preview -->
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>

                           </asp:View>
                       </asp:MultiView>

                      



                       <div class="tab-pane" id="settings1" role="tabpanel">
                           <div class="row">
                               <div class="col-md-12">
                                   <div class="card-body">
                                       <div class="card-body">

                                           <div class="dropzone">
                                               <div class="fallback">
                                                   <div class="row">
                                                       <div class="col-md-4">

                                                           <div class="input-group input-group-sm">
                                                               <asp:FileUpload runat="server" CssClass="form-control form-control-sm" name="file" type="file" multiple="multiple" />
                                                               <button class="btn btn-primary" type="button">Cargar</button>
                                                           </div>

                                                       </div>
                                                   </div>

                                               </div>
                                               <div class="dz-message needsclick">
                                                   <div class="mb-3">
                                                       <i class="display-4 text-muted ri-upload-cloud-2-fill"></i>
                                                   </div>

                                                   <h4>Cargar manual de convivencia de la Institución</h4>
                                               </div>
                                           </div>


                                           <!-- end dropzon-preview -->
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>

           </div>
       </div>
       <!--end col-->
   </div>
</asp:Content>
