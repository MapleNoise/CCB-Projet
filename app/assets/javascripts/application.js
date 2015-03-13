(function($){

  var produits = [],
  FJS = null,
  etapes = [],
  categories = [];

  $('.button__filter').on('click', function(e){
		$(this).toggleClass('is-active');
	})

/***************************************************************/
// Gestion de l'affichage dynamique pour new produit
/***************************************************************/
  var div_extract_urlMultimedia, div_extract_urlFichier;

  if (document.getElementById("extract-urlMultimedia") != null)
  {
    div_extract_urlMultimedia = document.getElementById("extract-urlMultimedia").innerHTML;
    $("#extract-urlMultimedia").remove();
  }

  if (document.getElementById("extract-urlFichier") != null)
  {
    div_extract_urlFichier = document.getElementById("extract-urlFichier").innerHTML;
    $("#extract-urlFichier").remove();
  }

	// TODO : Pour changer la vue d'ajout des produits en fonction du type de produit.
	$('#jsTypeProduitSelect').on('change', function(e){
		var selectedType = $("#jsTypeProduitSelect option:selected ").text();

    if (selectedType == "Vidéo" || selectedType == "Fichier audio" || selectedType == "Ebook")
    {
      document.getElementById("placeToLoad").innerHTML = div_extract_urlMultimedia;
    }
    else
    {
      document.getElementById("placeToLoad").innerHTML = div_extract_urlFichier;
    }

	})

/***************************************************************/

	$('.button__categorie').on('click', function(e){
		$(this).toggleClass('is-active');
	})


  $.ajax('/listeProduit.json', {
      async: false,
      success: function(data){
        produits = data;
      }
  })

  FJS = FilterJS(produits, '#produits', {
      template: '#produitTemplate',
      search: { ele: '#toto'},
      callbacks: {
        beforeRecordRender: function(produit){
          produit.liste__item__class = '';
          if ( typeof produit.description == 'undefined' ) {
            produit.description = ''
          };

          if (produit.etape == 'Le constat') {
           produit.liste__item__class += 'liste__item--constat';
          }
          else if (produit.etape == "L'analyse") {
            produit.liste__item__class += 'liste__item--analyse';
          }
          else if (produit.etape == "La décision") {
            produit.liste__item__class += 'liste__item--decision';
          }
          else if (produit.etape == "L'action") {
            produit.liste__item__class += 'liste__item--action';
          }
          else if (produit.etape == "Cap vers la Cohérence") {
            produit.liste__item__class += 'liste__item--cap';
          }


          if (produit.categorie == "Formation") {
            produit.liste__item__class += ' liste__item--formation';
          }
          else if (produit.categorie == "Outil") {
            produit.liste__item__class += ' liste__item--outil';
          }
          else if (produit.categorie == "Bibliothèque") {
            produit.liste__item__class += ' liste__item--bibliotheque';
          }
          else if (produit.categorie == "Ebook") {
            produit.liste__item__class += ' liste__item--ebook';
          }


        },
      }
  });

  FJS.addCriteria({field: 'categorie', ele: '#filterCategories input:checkbox'});
  FJS.addCriteria({field: 'etape', ele: '#filterEtapes input:checkbox'});

  FJS.filter();

  $('.button__filter, .button__categorie').click(function(e){
      e.preventDefault();

      $target = $(this).data('target-filter');

      if ($target) {
        $target_is_checked = $('#filters').find('[data-filter='+ $target +']').first();
        if ($target_is_checked.prop('checked')) {
          $target_is_checked.trigger('click');
        }
        else {
          $target_is_checked.trigger('click');
        }
      }

  })

  categories = $.urlParam('categories') ? $.urlParam('categories').split(',') : [];
  etapes = $.urlParam('etapes') ? $.urlParam('etapes').split(',') : [];

  if (categories.length > 0) {
    for(var i=0;i<categories.length;i++) {

       $('.button__categorie--' + categories[i]).trigger('click');
    }
  }

  if (etapes.length > 0) {
    for(var i=0;i<etapes.length;i++) {
       $('.button__filter--' + etapes[i]).trigger('click');
    }
  }


})(jQuery);
