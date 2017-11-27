<%-- import com.cloudinary
<%@taglib uri="https://cloudinary.com/jsp/taglib" prefix="cl" %> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:url value="/javascripts" var="jsUrl"/>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.iframe-transport.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.fileupload.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/vendor/jquery.ui.widget.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cloudinary-jquery-file-upload/2.3.0/cloudinary-jquery-file-upload.min.js"></script>
<script type='text/javascript'>

$.cloudinary.config({
    "cloud_name" : "raisethebar",
    "api_key" : "983532536329527",
    "private_cdn" : false,
    "cdn_subdomain" : false
});

$(document).ready(function() {
      if($.fn.cloudinary_fileupload !== undefined) {
        $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
      }
    });
</script>

<form:form method="POST" action="${formAction}" modelAttribute="newBrewery">
<div class="form-group">
<label for="breweryLogoUrl">Current Picture: </label>
<form:input path="breweryLogoUrl" class="form-control" />

            <input name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="breweryLogoUrl" 
data-form-data= "{"upload_preset": "brewery_images" }" ></input>
<form:errors path="breweryLogoUrl"></form:errors>
</div>
</form:form>


<!-- //controller -->
@RequestMapping(path="/breweries", method=RequestMethod.POST) <!-- //MUST BE PUT IN THE POST, NOT THE GET!!! -->
public String createBrewery(@Valid @ModelAttribute("newBrewery") Brewery newBrewery, BindingResult result, RedirectAttributes flash) {
flash.addFlashAttribute("newBrewery", newBrewery);

    if(result.hasErrors()) {
        flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newBrewery", result);
        return "redirect:/breweries/new";
    }
    if(!breweryDAO.searchForBrewery(newBrewery.getName())) { 
    
  <!--   //NEXT LINE IS THE VIP- MUST BE LINKED TO THE OBJECT -->
        newBrewery.setBreweryLogoUrl("http://res.cloudinary.com/teclebrew/" + newBrewery.getBreweryLogoUrl());  
        
        
        breweryDAO.saveBrewery(newBrewery.getName(), newBrewery.getAddress(), newBrewery.getCity(), newBrewery.getZipcode(), 
        newBrewery.getPhoneNumber(), newBrewery.getDescription(), newBrewery.getBreweryLogoUrl(), newBrewery.getImgUrl(), 
        newBrewery.getWebsiteUrl(), newBrewery.getBusinessHours());
        return "redirect:/breweries";
    } else {
        flash.addFlashAttribute("message", "This brewery alreadys exists");
        return "redirect:/breweries/new";
    }
}
