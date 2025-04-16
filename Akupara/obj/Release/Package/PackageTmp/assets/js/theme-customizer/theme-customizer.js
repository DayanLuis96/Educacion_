
  //* Theme-Customizer *//
  var windowsize = $(document ).width() + 17
  var themePrimary = localStorage.getItem('themeColorPrimary');
  var themeSecondary = localStorage.getItem('themeColorSecondary');
  var themeFontColor = localStorage.getItem('themeFontColor');
  var themeLightFont = localStorage.getItem('themeLight_fontColor');


  //*** DEFAULT COLOR VARIABLE
  var themeDefaultPrimary_color = JSON.parse(themePrimary) || '#115173'; //theme-primary
  var themeDefaultSecondary_color = JSON.parse(themeSecondary) ||'#ff6768'; //theme-secondary
  var defaultFont_color = JSON.parse(themeFontColor) || '#262626'; //codex-font-color
  var themefontLight = JSON.parse(themeLightFont) || '#8392a5'; //font-light-color


  $( document ).ready(function() {

    //*** LOCALSTORAGE-SET-THEME-COLOR - START 
    $("body").get(0).style.setProperty("--theme-primary", themeDefaultPrimary_color); 
    $("body").get(0).style.setProperty("--theme-secondary", themeDefaultSecondary_color);


    //*** HEXA TO RGBA CONVERT FUNCTION
    function hexToRGBA (hex, opacity){    
      let hexArray =[];    
      let sliceIndex=0;
      hex = hex.substring(1);      
      for (let i=0;i<3;i++){
        hexArray.push(hex.slice(sliceIndex,sliceIndex+2));
        sliceIndex = sliceIndex + 2;
      }
      let rgbArray=[];
        for (let i=0;i<3;i++){
        let rgbValue = parseInt(hexArray[i],16);
        rgbArray.push(rgbValue);
      }  
      return "rgba("+rgbArray[0] + ", " + rgbArray[1] + ", " + rgbArray[2]+", 0." + opacity+")";
    }
    
    //*** HEXA TO RGB CONVERT FUNCTION
    function convertRGB(setProperty,e){
      var rgbConvert = hexToRGB(e);                                                                                           
      var rgbStore = rgbConvert.replace('rgb(', '').replace(')','');
      $("body").get(0).style.setProperty(setProperty, rgbStore); 
    }

    //*** HEXA TO RGBA "THEME-*-1" TO "THEME-*-9" CONVERT FUNCTION
    function convertRGBA_func(property, liveVal){      
      for (i = 1; i <= 9; i++) {
      let theme_ = hexToRGBA(liveVal, +[i]);                 
      $("body").get(0).style.setProperty(property +[i], theme_)       
      }        
    }

    //*** HEXA TO RGB Function 
    function hexToRGB (hex){    
      let hexArray =[];    
      let sliceIndex=0;
      hex = hex.substring(1);      
      for (let i=0;i<3;i++){
        hexArray.push(hex.slice(sliceIndex,sliceIndex+2));
        sliceIndex = sliceIndex + 2;
      }
      let rgbArray=[];
      for (let i=0;i<3;i++){
        let rgbValue = parseInt(hexArray[i],16);
        rgbArray.push(rgbValue);
      }  
      return "rgb("+rgbArray[0] + ", " + rgbArray[1] + ", " + rgbArray[2]+")";
    }

    
    //*** STORE ALL COLOR VARIABLE 
    var LocalStoreColor = [   
      {'--theme-success': '#83C31B'},
      {'--theme-info': '#18a0fb'},
      {'--theme-warning': '#FFC261'},
      {'--theme-danger': '#E3291D'},
      {'--theme-border': '#dce0e5'},
      {'--theme-dark': '#333333'},
      {'--input-border': '#edecec'},
      {'--card-bg': '#ffffff'},
      {'--black-color': '#000000'},
      {'--white-color': '#ffffff'},
      {'--font-light': themefontLight},
      {'--codex-body-color': '#f6f7f9'},
      {'--codex-font-color': defaultFont_color},
      {'--fb-color': '#385196'},
      {'--twt-color': '#00a8ff'},
      {'--insta-color': '#e2215d'},
      {'--whp-color': '#4aec61'},
      {'--dark-body': '#0c162e'},
      {'--dark-card': '#18223a'},
      {'--extradark-card': '#223050'},
      {'--dark-font': '#cdc9c9'},
      {'--dark-small-font': '#cdc9c9'},
      {'--dark-border': '#1b305e'}
    ]
    
    //*** ALL COLOR VARIABLE CONVERT LOOP - START
    var htmlRGB='';     
    LocalStoreColor.forEach(obj => {              
        for(let ans in obj) {
          var oldHexBGColor = obj[ans];         
          var oldBGColor = hexToRGB(oldHexBGColor);                                                                                           
          var rgbStore = oldBGColor.replace('rgb(', '').replace(')','');
          htmlRGB+= ans +'-rgb'+ ':' + rgbStore + ';';  
        }  
    });
    //PRINT ALL RGB COLOR STYLE IN HEAD TAG
    $('head').append(`<style type="text/css">:root { ${htmlRGB} }</style>`).eq(0);  


    // COLOR-BOX-JS - START //
    $(".theme_cutomizer .color_bTn").on('click', function() {  
        let colorCode;
        colorCode = $(this).attr('value');      
        $("body").get(0).style.setProperty("--theme-primary", colorCode);
        localStorage.setItem('themeColorPrimary', JSON.stringify(colorCode));           
        convertRGBA_func("--theme-primary-", colorCode);  
        convertRGB("--theme-primary-rgb", colorCode)             
    });  


    $('.theme_color').on('click','.colorBox',function() {
        $('.colorBox').addClass("focus");      
    });

   
    //*** COLOR-PICKER-1 - START
    var colorPicker_1 = document.getElementById('themeColor_1');
    if(colorPicker_1 != null){
      colorPicker_1.addEventListener("input", watchColourPicker_1, false);    
      colorPicker_1.value = JSON.parse(themePrimary) || themeDefaultPrimary_color;
    }  
    function watchColourPicker_1(event) {        
      convertRGBA_func("--theme-primary-", event.target.value);  
      convertRGB("--theme-primary-rgb", event.target.value)    

      $("body").get(0).style.setProperty("--theme-primary", event.target.value);     
      localStorage.setItem('themeColorPrimary', JSON.stringify(event.target.value));                  
    }  
    convertRGBA_func("--theme-primary-", themeDefaultPrimary_color);    
    convertRGB("--theme-primary-rgb", themeDefaultPrimary_color)          



    //*** COLOR PICKER-2 - START 
    var colorPicker_2 = document.getElementById('themeColor_2');
    if(colorPicker_2 != null){
      colorPicker_2.addEventListener("input", watchColourPicker_2, false);           
      colorPicker_2.value = JSON.parse(themeSecondary) || themeDefaultSecondary_color;
    } 

    function watchColourPicker_2(event) {               
      convertRGBA_func("--theme-secondary-", event.target.value);     
      convertRGB("--theme-secondary-rgb", event.target.value)  

      $("body").get(0).style.setProperty("--theme-secondary", event.target.value);   
      localStorage.setItem('themeColorSecondary', JSON.stringify(event.target.value));
    }
    convertRGBA_func("--theme-secondary-", themeDefaultSecondary_color); 
    convertRGB("--theme-secondary-rgb", themeDefaultSecondary_color)  
    

    
    //*** BODY BG SET GRADIENT COLOR - START
    var gradientBg = localStorage.getItem('gradientBg');
    var gradient1_local = localStorage.getItem('gradient1'); 
    var gradient2_local = localStorage.getItem('gradient2'); 
    var transparentMode = $('body').hasClass('gradient_bgLayout');  

    if(gradientBg != null || transparentMode == true){    
      $("body").get(0).style.setProperty("background-image", JSON.parse(gradientBg));  
      $('body').addClass('gradient_bgLayout');               
    }

    var gradientColor_1 = document.getElementById('gradient1');
    var gradientColor_2 = document.getElementById('gradient2');
    if(gradientColor_1 != null){
      gradientColor_1.addEventListener("input", gradienPicker_1, false);   
      gradientColor_1.value = JSON.parse(gradient1_local) || '#a3e0b6';
    }  
    if(gradientColor_2 != null){
      gradientColor_2.addEventListener("input", gradienPicker_2, false);   
      gradientColor_2.value =  JSON.parse(gradient2_local) || '#65ecd5';
    }  
    function DefaultRun_gradientFunc(){
      localStorage.removeItem('imgData');  
      localStorage.removeItem('bgUpload_file'); 
      localStorage.setItem('gradientBg', JSON.stringify(setGradient));  
      $("body").get(0).style.setProperty("background-image", setGradient);        
      $('body').addClass('gradient_bgLayout');            
    }
    function gradienPicker_1(event) {            
      localStorage.setItem('gradient1', JSON.stringify(event.target.value));
      setGradient = "linear-gradient(to right, " + event.target.value + ", " + gradientColor_2.value + ")"
      DefaultRun_gradientFunc();
    }
    function gradienPicker_2(event) {                  
      localStorage.setItem('gradient2', JSON.stringify(event.target.value));         
      setGradient = "linear-gradient(to right, " + gradientColor_1.value + ", " + event.target.value + ")"
      DefaultRun_gradientFunc();
    }  
    

    
    //***BODY BG SET IMAGE -(UPLOAD IMAGE) - START
    var bodyBg = document.getElementById('bannerImg');
    var body = document.body;
    var dataImage = localStorage.getItem('imgData');
    var transparentModeImg = $('body').hasClass('image_bgLayout');  

    if(dataImage != null || transparentModeImg == true){
      $('body').addClass('image_bgLayout');          
      localStorage.removeItem('gradientBg');  
      localStorage.removeItem('theme-mode');  
      uploadBody_bg();    
    }

    if(bodyBg != null && dataImage == null && transparentModeImg == true){    
      body.style.backgroundImage = "url('https://wallpaper.dog/large/20459074.jpg')";  
    }

    function uploadBody_bg(){            
      bodyBg.addEventListener('change', function() {                            
        var file = this.files[0];
        if (file.type.indexOf('image') < 0) {              
          return;
        }      
        body.style.backgroundImage = "url(" + dataImage + ")"; 
        $('body').addClass('image_bgLayout');  
        var fReader = new FileReader();
        fReader.onload = function() {
          body.style.backgroundImage =  "url(" + fReader.result + ")";
          localStorage.setItem("imgData", fReader.result);
        };
        fReader.readAsDataURL(file);
      });
      function fetchimage () {
        body.style.backgroundImage = "url(" + dataImage + ")";   
      }
      fetchimage();
    }
    $('#bannerImg').on('click',function(){
      uploadBody_bg();
    })  

    //* FILE NAME STORE LOCALSTORAGE
    var bgImg_file = localStorage.getItem('bgUpload_file');
    if(bgImg_file != null){
      $(".file-upload-wrapper").children('span').text(bgImg_file)
    }
    $("form").on("change", "#bannerImg", function(){ 
      event.preventDefault();
      $(this).parent(".file-upload-wrapper").children('span').text($(this).val().replace(/.*(\/|\\)/, ''));
      localStorage.setItem("bgUpload_file", $(this).val().replace(/.*(\/|\\)/, ''));
      location.reload();
    });    
    //* CLEAR FILTER
    if(gradientBg != null ){
      $('#gradientRemove').on('click',function(){
        localStorage.removeItem('gradientBg');
        localStorage.removeItem('sideBar_default'); 
        location.reload();      
      });
    }    
    if(dataImage != null){
      $('#bgRemove').on('click',function(){
        localStorage.removeItem('imgData');           
        localStorage.removeItem('sideBar_default');    
        localStorage.removeItem('bgUpload_file');      
        location.reload();      
      });
    }
    

    //*** THEME FONT COLOR-PRIMARY - START
    $("body").get(0).style.setProperty("--codex-font-color", defaultFont_color);     

    var fontColorPicker = document.getElementById('theme_fontColor');
    if(fontColorPicker != null){
      fontColorPicker.addEventListener("input", font_color_primary, false);    
      fontColorPicker.value = defaultFont_color;
    }  
    function font_color_primary(event) {        
      $("body").get(0).style.setProperty("--codex-font-color", event.target.value);      
      localStorage.setItem('themeFontColor', JSON.stringify(event.target.value));      
    }  
    
    //*** THEME FONT COLOR-LIGHT - START    
    $("body").get(0).style.setProperty("--font-light", themefontLight); 
    
    var lightFont_color = document.getElementById('theme_fontLight');
    if(lightFont_color != null){
      lightFont_color.addEventListener("input", font_color_light, false);    
      lightFont_color.value = themefontLight;
    }  
    function font_color_light(event) {        
      $("body").get(0).style.setProperty("--font-light", event.target.value);     
      localStorage.setItem('themeLight_fontColor', JSON.stringify(event.target.value));      
    }  

    //*** RTL Mode - START
    var layoutDirection = localStorage.getItem('theme-layout');    
    if(layoutDirection != null){
      $('body').addClass(JSON.parse(layoutDirection));
    }
    var rtl = $('body').hasClass('theme-layout-rtl');  
    if (rtl == true) {     
      layoutDirection = 'theme-layout-rtl';
      $("#rtlCheck").prop( "checked", true );          
    }
    if($('body').hasClass('theme-layout-ltr')){
      $('body').removeClass('theme-layout-rtl');
      $("#ltrCheck").prop( "checked", true );  
    }
    $(document).on('click',"input[name='RTL']",function(){                
      if($("#rtlCheck").is(':checked')){        
        layoutDirection = 'theme-layout-rtl';      
      }else if($("#ltrCheck").is(':checked')){      
        layoutDirection = 'theme-layout-ltr';          
      }         
      localStorage.setItem('theme-layout', JSON.stringify(layoutDirection));      
      localStorage.removeItem('leftScroll');               
      location.reload();
    })          
    
    //*** Theme Mode Dark - START
    var themeModeStore = localStorage.getItem('theme-mode');    
    if(themeModeStore != null){
      $('body').addClass(JSON.parse(themeModeStore)); 
    }
    var darkMode = $('body').hasClass('theme-mode-dark');  
    if (darkMode == true) {     
      themeModeStore = 'theme-mode-dark';        
      $("#darkCheck").prop( "checked", true );    
      localStorage.removeItem('gradientBg');      
      localStorage.removeItem('imgData');  
    } 
    if($('body').hasClass('theme-mode-light')){
      $('body').removeClass('theme-mode-dark');
      $("#lightCheck").prop( "checked", true );  
    }
    $(document).on('click',"input[name='layoutMode']",function(){       
      if($('#lightCheck').is(':checked')){      
        themeModeStore = 'theme-mode-light';   
        $('body').removeClass('theme-mode-dark');              
      }else if($('#darkCheck').is(':checked')){      
        themeModeStore = 'theme-mode-dark';  
        $('body').removeClass('theme-mode-light');          
        localStorage.removeItem('gradientBg');
        localStorage.removeItem('bgImg_file');        
      }  
      $('body').addClass(themeModeStore); 
      localStorage.setItem('theme-mode', JSON.stringify(themeModeStore));    
      // location.reload();             
    }) 




    //*** SIDEBAR HORIZONTAL/VERICALE - START 
    var sideBarType = localStorage.getItem('sidebar-type');    
    if(sideBarType != null){
      $('body').addClass(JSON.parse(sideBarType));
    }
    var sidebarType = $('body').hasClass('sidebar-type-horizontal');  
    if (sidebarType == true) {     
      sideBarType = 'sidebar-type-horizontal';      
      horizontal_sidebar_fun();     
    }
    if($('body').hasClass('sidebar-type-vertical')){
      $('body').removeClass('sidebar-type-horizontal');
      $("#verSideCheck").prop( "checked", true ); 
      if(windowsize > 1199){
        $('.codex-menu').addClass('myCustomScrollbar');
        $('.codex-menu').removeClass('tblCustomScrollbar');         
      } 
    }
    $(document).on('click',"input[name='sidebar']",function(){   
      if($("#verSideCheck").is(':checked')){              
        $('body').removeClass('sidebar-type-vertical');    
        sideBarType = 'sidebar-type-vertical';                                     
      }else if($("#horiSideCheck").is(':checked')){
        $('body').removeClass('sidebar-type-vertical');    
        sideBarType = 'sidebar-type-horizontal';    
        horizontal_sidebar_fun();
      } 
      $('body').addClass(sideBarType); 
      localStorage.setItem('sidebar-type', JSON.stringify(sideBarType));  
      location.reload();      
    })     
    function horizontal_sidebar_fun(){
      $("#horiSideCheck").prop( "checked", true );                        
      if(windowsize > 1199){
        $('.codex-menu').removeClass('myCustomScrollbar');
        $('.codex-menu').addClass('tblCustomScrollbar');         
      }         
    }
    

    //*** Sidebar Show & Hide Js
    var sideBar_default = localStorage.getItem('sideBar_default');
    $('.theme_cutomizer,.customizer-layer').addClass(JSON.parse(sideBar_default));   
    $(".theme_cutomizer").on('click','.customizer-action',function() {
      $('.theme_cutomizer').toggleClass('active');
      $('.customizer-layer').toggleClass('active');
      localStorage.setItem('sideBar_default', JSON.stringify('active')); 
    });

    $(".theme_cutomizer").on('click','.close-customzier',function() {
      $(".theme_cutomizer").removeClass("active"); 
      $('.customizer-layer').removeClass('active');     
      localStorage.setItem('sideBar_default', JSON.stringify('')); 
    });  
    
    //*** Remove LocalStorage Data
    $(document).on('click','#removeAll',function(){
      localStorage.clear();
      location.reload();
    });

    // Header-Sticky-JS
    var siderBarType = $('body').hasClass('sidebar-type-horizontal');      
    if(siderBarType == true){
      var heightScroll =$('.cdxnav').height()
      $(window).scroll(function() {    
        var sticky = $('.cdxnav');
        scroll = $(window).scrollTop();             
        if (scroll >= heightScroll && windowsize >= 1200) { 
          sticky.addClass('fixed'); 
        }
        if (scroll == 0){ 
          sticky.removeClass('fixed');
        }  
      });
    }  
  });

  //*** Check Class and Lode Page
  $(document).on('click','.theme-body',function() {
    if($('.colorBox').hasClass("focus")){
      $('.colorBox').removeClass("focus");        
      location.reload();             
    }  
  });

  // CHART-COLOR_CONFIG - START //
  var style = getComputedStyle(document.body);
  var primary = JSON.parse(themePrimary) || themeDefaultPrimary_color;
  var secondary = JSON.parse(themeSecondary) || themeDefaultSecondary_color;
  var success = style.getPropertyValue('--theme-success').trim();
  var info = style.getPropertyValue('--theme-info').trim();
  var warning = style.getPropertyValue('--theme-warning').trim();

  window.Codexcrowen = {
   themeprimary: primary,
   themesecondary: secondary,
   themesuccess: success,
   themeinfo: info,
   themewarning: warning,
  };

  // CHART-COLOR_CONFIG - END //


