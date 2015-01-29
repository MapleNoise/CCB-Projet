(function($){
	$('.button-filter').on('click', function(e){
		$(this).toggleClass('is-active');
	})
	
	// TODO : Pour changer la vue d'ajout des produits en fonction du type de produit.
	$('#jsTypeProduitSelect').on('change', function(e){
		var selectedType = $("#jsTypeProduitSelect option:selected ").text();
	})

})(jQuery)