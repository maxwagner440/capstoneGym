<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<title>Trainer Profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/trainerProfile.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="fontawesome-stars.css">

<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" 
    href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <!-- <img class="logo" src="/Users/annakurchak/workspace/exercises/untitled folder/RaisetheBarLogo.png" alt="RaiseTheBarLogo" width="150" height="150"> -->
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
      <img src="/Users/annakurchak/workspace/exercises/untitled folder/RaisetheBarLogo.png" 
      class="w3-circle" style="height:25px;width:25px" alt="RaiseTheBarLogo"></a>
   <c:url var="clientHome" value="/clientDashboard"/>
  <a href="${clientHome}" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
  
    <c:url var="getToMessage" value="/replyMessage"/>
  <form action="${getToMessage}" method="GET">
<input type="hidden" name="receiverId" value="${profileToView.id }"/>
<button type="submit" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></button>
</form>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
    <c:url var="logo" value="img/RaiseTheBarLogo.png"/>
    <img src="${logo }" class="w3-circle" style="height:50px;width:50px" alt="RaiseTheBarLogo"></a>
 </div> 
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Trainer Name</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center"><c:out value="${profileToView.getFullName() }"/></h4>
         <c:url value="/img/manHoldingWeight.jpg" var="manHoldingWeightPic"/>
                <img class="manHoldingWeightPic" src="${manHoldingWeightPic}" alt="Man holding free weight" style="height:106px;width:106px">
         <!-- <p class="w3-center"><img src="/w3images/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p> -->
         <hr>
         <p><i class="fa-fw w3-margin-right w3-text-theme"></i> Personal Trainer</p>
         <p><i class="fa-fw w3-margin-right w3-text-theme"></i> Cleveland, OH</p>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
         
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/fjords.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Training Specialties</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">Running</span>
            <span class="w3-tag w3-small w3-theme-d4">Soccer</span>
            <span class="w3-tag w3-small w3-theme-d3">Lacrosse</span>
            <span class="w3-tag w3-small w3-theme-d2">Polo</span>
            <span class="w3-tag w3-small w3-theme-d1">Baseball</span>
            <span class="w3-tag w3-small w3-theme">Hiking</span>
            <span class="w3-tag w3-small w3-theme-l1">Fitness</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Cooking</span>
            <span class="w3-tag w3-small w3-theme-l4">Camping</span>
          </p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
     
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Trainer Philosophy</h6>
              <p><c:out value="${profileToView.exercisePhilosophy}"/></p>
              <!-- <p contenteditable="true" class="w3-border w3-padding">Trainer posts text here</p> -->
              <p><c:out value="${profileToView.pastExperience}"/></p>
           <!--    <p contenteditable="true" class="w3-border w3-padding">Trainer posts motivational goodies here</p> -->
              
            </div>
          </div>
        </div>
      </div> 

      <!-- <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Rate This Trainer</h6>

              <select id="br-theme-fontawesome-stars" name="rating" autocomplete="off">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
              <script src="jquery.barrating.min.js"></script>
              <script type="text/javascript">
                 $(function() {
                    $('#example').barrating({
                      theme: 'fontawesome-stars'
                    });
                 });
              </script>
            </select>  

             <p contenteditable="true" class="w3-border w3-padding">MAYBE put clickable stars on this row</p>
              <button type="button" class="w3-button w3-theme"><i class="fa fa"></i>Post</button> 
            </div>
          </div>
        </div>
      </div> -->

      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>Trainer Posting on Wall</h4><br>
        <hr class="w3-clear">
        <p>Text for article.</p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="/w3images/lights.jpg" style="width:100%" alt="Image" class="w3-margin-bottom">
            </div>
            <div class="w3-half">
              <img src="/w3images/nature.jpg" style="width:100%" alt="image" class="w3-margin-bottom">
          </div>
        </div> 
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar5.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">16 min</span>
        <h4>Trainer Posting on Wall</h4><br>
        <hr class="w3-clear">
        <p>Text for article.</p>
        <!-- <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>Maybe allow a Comment</button>  -->
      </div>  

    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Upcoming Events:</p>
          <c:url value="/img/backViewHoldingBar.jpg" var="backViewHoldingBarPic"/>
                <img class="backViewHoldingBar" src="${backViewHoldingBarPic}" alt="Back View Muscles" style="height:106px;width:106px">
          <!-- <img src="/w3images/forest.jpg" alt="Image here" style="width:100%;"> -->
          <p><strong>Get a jumpstart on New Year Fitness Goals!</strong></p>
          <p>Friday 4:00pm</p>
        </div>
      </div>
      <br>
      
<div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
            <style>
                /* The Modal (background) */
                .modal {
                    display: none; /* Hidden by default */
                    position: fixed; /* Stay in place */
                    z-index: 1; /* Sit on top */
                    padding-top: 100px; /* Location of the box */
                    left: 0;
                    top: 0;
                    width: 100%; /* Full width */
                    height: 100%; /* Full height */
                    overflow: auto; /* Enable scroll if needed */
                    background-color: rgb(0,0,0); /* Fallback color */
                    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                }
                
                /* Modal Content */
                .modal-content {
                    background-color: #7d97a5;
                    margin: auto;
                    padding: 20px;
                    border: 1px solid #7d97a5;
                    width: 80%;
                }
                
                /* The Close Button */
                .close {
                    color: #fdfafa;
                    float: right;
                    font-size: 28px;
                    font-weight: bold;
                }
                
                .close:hover,
                .close:focus {
                    color: #222a2e;
                    text-decoration: none;
                    cursor: pointer;
                }
                </style>
                </head>
                <body>
                
                <h3>Request a trainer to contact you</h3>
                
                <!-- Trigger/Open The Modal -->
                <c:url var="signupWithTrainer" value="/signUpWithTrainer"/>
		<form action="${signupWithTrainer}" method="POST">
		<input type="hidden" name="trainerId" value="${profileToView.id }"/>
		<input id="myBtn" type="submit" value="Request Trainer"/>
		</form>
                
                
                <!-- The Modal -->
            
        </div>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <p>Starting at $<c:out value="${profileToView.trainerHourlyPrice }"/>/hour</p>
        <p>Add an icon/add fine print</p>
      </div>
      <br>

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d5">
  <p>Copyright &copy; Raise the Bar 2017</p>
</footer>

<footer class="w3-container w3-theme-d5">
  <p><a href="https://www.w3schools.com/w3css/default.asp" target="_blank">Raise the Bar 2017</a></p>
</footer>
 
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

//rating stars
!function(t){"function"==typeof define&&define.amd?define(["jquery"],
      t):"object"==typeof module&&module.exports?module.exports=t(require("jquery")):t(jQuery)}
      (function(t){var e=function(){function e(){var e=this,n=function(){var n=["br-wrapper"];
      ""!==e.options.theme&&n.push("br-theme-"+e.options.theme),e.$elem.wrap(t("<div />",
      {"class":n.join(" ")}))},i=function(){e.$elem.unwrap()},a=function(n){return t.isNumeric(n)&&(n=Math.floor(n)),
      t('option[value="'+n+'"]',e.$elem)},r=function(){var n=e.options.initialRating;
      return n?a(n):t("option:selected",e.$elem)},o=function(){var n=e.$elem.find('option[value="'+e.options.emptyValue+'"]');
      return!n.length&&e.options.allowEmpty?(n=t("<option />",{value:e.options.emptyValue}),n.prependTo(e.$elem)):n},
      l=function(t){var n=e.$elem.data("barrating");return"undefined"!=typeof t?n[t]:n},
      s=function(t,n){null!==n&&"object"==typeof n?e.$elem.data("barrating",n):e.$elem.data("barrating")[t]=n},
      u=function(){var t=r(),n=o(),i=t.val(),a=t.data("html")?t.data("html"):t.text(),
      l=null!==e.options.allowEmpty?e.options.allowEmpty:!!n.length,u=n.length?n.val():null,d=n.length?n.text():null;
      s(null,{userOptions:e.options,ratingValue:i,ratingText:a,originalRatingValue:i,originalRatingText:a,
      allowEmpty:l,emptyRatingValue:u,emptyRatingText:d,readOnly:e.options.readonly,ratingMade:!1})},
      d=function(){e.$elem.removeData("barrating")},c=function(){return l("ratingText")},f=function(){return l("ratingValue")},
      g=function(){var n=t("<div />",
      {"class":"br-widget"});return e.$elem.find("option").each(function(){var i,a,r,o;i=t(this).val(),
      i!==l("emptyRatingValue")&&(a=t(this).text(),r=t(this).data("html"),r&&(a=r),o=t("<a />",
      {href:"#","data-rating-value":i,"data-rating-text":a,html:e.options.showValues?a:""}),n.append(o))}),
      e.options.showSelectedRating&&n.append(t("<div />",{text:"","class":"br-current-rating"})),
      e.options.reverse&&n.addClass("br-reverse"),e.options.readonly&&n.addClass("br-readonly"),n},
      p=function(){return l("userOptions").reverse?"nextAll":"prevAll"},h=function(t){a(t).prop("selected",!0),
      l("userOptions").triggerChange&&e.$elem.change()},m=function(){t("option",e.$elem).prop("selected",
      function(){return this.defaultSelected}),l("userOptions").triggerChange&&e.$elem.change()},
      v=function(t){t=t?t:c(),t==l("emptyRatingText")&&(t=""),
      e.options.showSelectedRating&&e.$elem.parent().find(".br-current-rating").text(t)},
      y=function(t){return Math.round(Math.floor(10*t)/10%1*100)},
      b=function(){e.$widget.find("a").removeClass(function(t,e){return(e.match(/(^|\s)br-\S+/g)||[]).join(" ")})},
      w=function(){var n,i,a=e.$widget.find('a[data-rating-value="'+f()+'"]'),
      r=l("userOptions").initialRating,o=t.isNumeric(f())?f():0,s=y(r);if(b(),
      a.addClass("br-selected br-current")[p()]().addClass("br-selected"),
      !l("ratingMade")&&t.isNumeric(r)){if(o>=r||!s)return;n=e.$widget.find("a"),
      i=a.length?a[l("userOptions").reverse?"prev":"next"]():n[l("userOptions").reverse?"last":"first"](),
      i.addClass("br-fractional"),i.addClass("br-fractional-"+s)}},
      $=function(t){return l("allowEmpty")&&l("userOptions").deselectable?f()==t.attr("data-rating-value"):!1},
      x=function(n){n.on("click.barrating",function(n){var i,a,r=t(this),o=l("userOptions");
      return n.preventDefault(),i=r.attr("data-rating-value"),a=r.attr("data-rating-text"),
      $(r)&&(i=l("emptyRatingValue"),a=l("emptyRatingText")),s("ratingValue",i),s("ratingText",a),
      s("ratingMade",!0),h(i),v(a),w(),o.onSelect.call(e,f(),c(),n),!1})},C=function(e){e.on("mouseenter.barrating",
      function(){var e=t(this);b(),e.addClass("br-active")[p()]().addClass("br-active"),v(e.attr("data-rating-text"))})},
      O=function(t){e.$widget.on("mouseleave.barrating blur.barrating",function(){v(),
      w()})},R=function(e){e.on("touchstart.barrating",function(e){e.preventDefault(),e.stopPropagation(),
      t(this).click()})},V=function(t){t.on("click.barrating",function(t){t.preventDefault()})},S=function(t){x(t),
      e.options.hoverState&&(C(t),O(t))},T=function(t){t.off(".barrating")},j=function(t){var n=e.$widget.find("a");
      l("userOptions").fastClicks&&R(n),t?(T(n),V(n)):S(n)};this.show=function(){l()||(n(),u(),e.$widget=g(),
      e.$widget.insertAfter(e.$elem),w(),v(),j(e.options.readonly),e.$elem.hide())},
      this.readonly=function(t){"boolean"==typeof t&&l("readOnly")!=t&&(j(t),s("readOnly",t),
      e.$widget.toggleClass("br-readonly"))},this.set=function(t){var n=l("userOptions");
      0!==e.$elem.find('option[value="'+t+'"]').length&&(s("ratingValue",t),
      s("ratingText",e.$elem.find('option[value="'+t+'"]').text()),s("ratingMade",!0),h(f()),v(c()),w(),
      n.silent||n.onSelect.call(this,f(),c()))},this.clear=function(){var t=l("userOptions");
      s("ratingValue",l("originalRatingValue")),s("ratingText",l("originalRatingText")),
      s("ratingMade",!1),m(),v(c()),w(),t.onClear.call(this,f(),c())},
      this.destroy=function(){var t=f(),n=c(),a=l("userOptions");
      T(e.$widget.find("a")),e.$widget.remove(),d(),i(),e.$elem.show(),a.onDestroy.call(this,t,n)}}
      return e.prototype.init=function(e,n){return this.$elem=t(n),this.options=t.extend({},t.fn.barrating.defaults,e),
      this.options},e}();t.fn.barrating=function(n,i){return this.each(function(){var a=new e;if(t(this).is("select")||t.error
      ("Sorry, this plugin only works with select fields."),a.hasOwnProperty(n)){if(a.init(i,this),"show"===n)return a.show(i);
      if(a.$elem.data("barrating"))return a.$widget=t(this).next(".br-widget"),
      a[n](i)}else{if("object"==typeof n||!n)return i=n,a.init(i,this),a.show();
      t.error("Method "+n+" does not exist on jQuery.barrating")}})},
      t.fn.barrating.defaults={theme:"",initialRating:null,allowEmpty:null,emptyValue:"",showValues:!1,
      showSelectedRating:!0,deselectable:!0,reverse:!1,readonly:!1,fastClicks:!0,hoverState:!0,silent:!1,
      triggerChange:!0,onSelect:function(t,e,n){},onClear:function(t,e){},onDestroy:function(t,e){}},t.fn.barrating.BarRating=e});
      //# sourceMappingURL=jquery.barrating.min.js.map
</script>

</body>
</html> 