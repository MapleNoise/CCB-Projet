(function($){

$.urlParam = function(name){
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
    results = regex.exec(location.search);

    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

})(jQuery);