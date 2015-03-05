$.fn.soundCloudURL = function (url){
    var self = this;
    $.get('http://api.soundcloud.com/resolve.json?url='+url+'&client_id=YOUR_CLIENT_ID', function(data) { 
      $(self).html('<iframe width="100%" height="166" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/'+data.id+'&color=ff5500&auto_play=false&hide_related=false&show_comments=false&show_user=false&show_reposts=false&show_artwork=false"></iframe>');
    });
  };