(function($) {
		jQuery.fn.videoYT = function(url) {
			var ID = '';
			url = url.replace(/(>|<)/gi,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
			if(url[2] !== undefined) {
				ID = url[2].split(/[^0-9a-z_\-]/i);
				ID = ID[0];
			}
			else {
				ID = url;
			}
	    $(this).html('<iframe width="100%" height="auto" src="https://www.youtube-nocookie.com/embed/'+ ID +'?rel=0&modestbranding=1&autohide=1&showinfo=0" frameborder="0" allowfullscreen>test</iframe>');
		};
	}
)(jQuery);

/*exemple d'appel: 
<script type="text/javascript" src="videoYT.js"></script>
<script>
	$('.video-container').videoYT('---inserer ici le lien youtube ---');
</script>
*/
