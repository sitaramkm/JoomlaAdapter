function guide(){

  this.targetElementsCount = 0;
  this.currentStep = 0;
  this.totalSteps = 0;
  this.targetElements = [];
  this.views = [];
  this.mode = 'single';
  this.stepsMap = [
    '',
    '.nav .item-113',
    '.itemid-113.view-records a.new-recorder',
    '.view-form.itemid-113 #adminForm .btn-submit:first-child',
    '.view-record.itemid-113 .requestKeyBtn',
    '.nav .item-108 a',
    '#asg-view-by-cats ul.products-list>li',
    '.plans-list>div:first .openapi-send-request:first',
    '.selected_apps_for_plan:visible',
    '.agree_term:visible',
    '.submit-plan-request:visible',
    '.plan .modal-header .close:visible',
    'a[href="#tab-api-explorer"]:visible',
    '#apps:visible'
  ];

  this.getTotalSteps = function(){
    return this.stepsMap.length;
  }

  this.setUpTotalSteps = function(){
      this.totalSteps = this.getTotalSteps();
      return this;
  };


  this.setUpTargetElements = function(){
    this.targetElements = this.getTargetElements();
    return this;
  };

  this.getTargetElements = function(){

    var elements = jQuery(this.stepsMap[this.currentStep]);
    var elementsCount = elements.length;
    var targetElementsArray=[];

    this.targetElementsCount = elementsCount;

    for(var i=0;i<this.targetElementsCount;i++)
    { 
      targetElementsArray.push(this.getTargetElement(elements,i));
    }

    return targetElementsArray;
  };

  this.getTargetElement = function(jQueryElements,eleNum){
    if(this.targetElementsCount && this.targetElementsCount > eleNum){
      var that = this;
      var ele = jQueryElements.get(eleNum);
      if(ele.tagName == "A" && jQuery(ele).not("[href^='#']").length){
        var targetLink = jQuery(ele);

        targetLink.attr("orig-href",targetLink.attr("href"));
        targetLink.attr("href","javascript:void();");

        targetLink.on("click",function(){
          window.tip.updateCurrentStep();
          window.location.href = targetLink.attr("orig-href");
        });
        
      }else if(ele.tagName == "SELECT"){
 
    	            jQuery(ele).on("change",function(){
    	                if(jQuery(this).val())
    	                {
    	                  that.rebuild();
    	                }
    	              console.log(ele.checked);
    	            });
    	  
      }else{
        jQuery(ele).on("click",function(){
          if(that.currentStep == 3 || that.currentStep == 4 || that.currentStep == 11)
          {
            if(that.currentStep !== 11)
            {
              that.updateCurrentStep();
            }else{
              jQuery(jQuery(".plan-modal").attr("href")).modal('hide');
            }
          } else {
            that.rebuild();
          }
        });

      }

      return ele;
    }
  };


  this.setUpCurrentStep = function(){
     this.currentStep = this.getCurrentStep();
     return this;
  };


  this.getCurrentStep = function(){
    var cookieValue =  DeveloperPortal.getCookieValues();
        _USER_ID    = _USER_ID || 0;

     return cookieValue[this.cookieName] || 0;
  };

  this.updateCurrentStep = function(i){
    var step = i ? i : (parseInt(this.currentStep)+1);
    DeveloperPortal.setCookieValue(this.cookieName,step,365);
    return this;
  };


  this.getView = function(i){
    var that = this,view;
    view =  jQuery('<div class="guide-component step'+this.currentStep+'">\
                      <div class="arrow arXYb">\
                            <span class="inside aiXYb">&diams;</span>\
                            <span class="out">&diams;</span>\
                      </div>\
                      <a id="close-guide-step" class="guide-close pull-right" href="javascript:void(0)">&nbsp;</a>\
                      <div class="guide-container">' + Joomla.JText._('PLG_SYSTEM_USEGUIDE_GUIDE_CONTENT_STEP' + this.currentStep) + '</div>\
                      <div class="clearfix"></div>\
                    </div>');
    this.whenClose(view.find("#close-guide-step"));
    return view;
  };



  this.getStepViews = function(){
    var stepViewsArray = [];
    if(this.mode == 'single' && this.targetElementsCount)
    {
      stepViewsArray.push(this.getView(0));
    }else{
      for(var i=0;i<this.targetElementsCount;i++){
        stepViewsArray.push(this.getView(i));
      }
    }

    //update the views array
    this.views = stepViewsArray;

    return stepViewsArray;
  };

  this.whenClose = function(obj){
    var that = this;
    if(obj && typeof(obj) == "object" && obj.click && typeof(obj.click) === "function"){

      obj.click(function(){
        if(that.currentStep == 11)
        {
          jQuery(jQuery(".plan-modal").attr("href")).modal('hide');
        }else{
          obj.parents(".guide-component").remove();
          that.updateCurrentStep();
          that.rebuild();
        }
      });
    }
    return this;
  };


  this.render = function(){

    var views = this.getStepViews();
    for(var i=0; i<views.length; i++)
    {
      views[i].appendTo("body");
    }

    return this;
  };

  this.show = function(){
    var views = this.views;
    var lft = "+30";
    var btt = "-10";

    if(this.currentStep == 5){
      lft = "+5";
      btt = "-2";
    }


    if(this.currentStep == 7){
      btt = "+10px";
    }

    if(this.currentStep == 8){
      btt = "";
    }

    if(this.currentStep == 9){
      btt = "-10";
      lft="-20"
    }

    if(this.currentStep == 10){
      btt = "-10";
    }

    if(this.currentStep == 11){
      lft = "-20";
      btt = "";
    }

    if(this.currentStep && this.targetElementsCount){

      if(this.mode == 'single' && this.targetElementsCount)
      {
        views[0].position({
          of: this.targetElements[0],
          my: "left" + lft + " bottom" + btt,
          at: "left top",
          collision: "fit none"
        });


        var targetEleTop = jQuery(this.targetElements[0]).offset().top;
        var screenHeight = document.documentElement.clientHeight;
        if(targetEleTop > screenHeight ) {
          jQuery(document).scrollTop(targetEleTop - screenHeight + 100);
        }
      }else{
        for(var i=0;i<this.targetElementsCount;i++)
        {
          views[i].position({
            of: this.targetElements[i],
            my: "left" + lft + " bottom" + btt,
            at: "left top",
            collision: "fit none"
          });
        }
      }


    }

    return this;
  };

  this.bindExtraEvent = function () {
    if(this.currentStep >= 7 && this.currentStep<=11)
    {
      var modal_form = jQuery(".plan-modal").attr("href");
      var t = this;
      jQuery(modal_form).on('hidden',function(e){
        jQuery(".guide-component").remove();
        if(t.currentStep == 11){
          t.updateCurrentStep();
          window.location.reload();
        }
        jQuery("body").css("overflow","auto");
      });

      if(this.currentStep == 7)
      {
        jQuery(modal_form).on('show',function(e){
            jQuery("body").css("overflow","hidden");

          var request_button = jQuery(this).find(".submit-plan-request");
          var apps_box = jQuery(this).find(".selected_apps_for_plan");
          request_button.attr("disabled","true");
          apps_box.on("change",function(){
            var selected_apps = jQuery(this).val();
            selected_apps?request_button.removeAttr("disabled"):request_button.attr("disabled","true");
          });
        });
      }
    }
    return this;
  };

  this.init = function(){

    if(_USER_ID){
      jQuery(".guide-component").remove();
      this.cookieName = _USER_ID  + "_guide_step";
      that = this;
      
      this.setUpTotalSteps().setUpCurrentStep();

      if(parseInt(this.currentStep) < this.stepsMap.length){
        that.setUpTargetElements().bindExtraEvent().render().show();
      }else{
        this.finished();
      }
    }
  };

  this.finished = function(){
    this.updateCurrentStep(this.stepsMap.length + 1);
  };


  this.rebuild = function(){
    jQuery(".guide-component").remove();
    this.updateCurrentStep();
    setTimeout(function(){new guide()},200);
  };

  this.init();

}


function showTips(){

  if(window.tip)
  {
    window.tip.views[0].remove();
    window.tip.updateCurrentStep();
    window.tip.init();
  }else{
    window.tip = new guide();
  }
  
}


  jQuery(window).load(function(){

//    DeveloperPortal.setCookieValue("129_guide_step",7,365);
    var cookieValue =  DeveloperPortal.getCookieValues();
        _USER_ID    = _USER_ID || 0;
    var cookieStep = parseInt(cookieValue[_USER_ID  + "_guide_step"]) || 0;
    var fps = 1000/4;
    if(cookieStep){
      if(cookieStep == 6){
        var targetLinkParent = jQuery("#asg-view-by-cats ul>li:first");
        var targetLink = targetLinkParent.find("a").not("[href^='#']");

        targetLinkParent.attr("orig-href",targetLinkParent.find(".description>a").attr("href"));
        targetLink.each(function(i,ele){
          jQuery(this).attr("href","javascript:void(0);");
        })

        targetLinkParent.on("click",function(){
          window.tip.updateCurrentStep();
          window.location.href = targetLinkParent.attr("orig-href");
        });
      }


      if(cookieStep == 10){
        jQuery(".openapi-send-request").on("click",function(){
          jQuery(".guide-component").hide();
         setTimeout("showTips()",2000);
        });

        jQuery("#sbox-window .control-group button:last").on('click',function(){
          setTimeout("showTips()",2000);
        });

        jQuery("#tabs-list").on("click",function(){
          setTimeout("showTips()",2000);
        });

      }else if(cookieStep == 7){
        window.tip = new guide();
        jQuery(".openapi-send-request").on("click",function(){
          jQuery(".guide-component").remove();
         setTimeout("showTips()",700);
        });

        jQuery("#sbox-window .control-group button:last").on('click',function(){
          setTimeout("showTips()",2000);
        });

      }else{
        window.tip = new guide();
      }


			if(cookieStep == 12){
        jQuery('a[href="#tab-api-explorer"]').click(function(){
          jQuery(".guide-component").remove();
          setTimeout("showTips()",2000);
        });
      }

    }

  });


