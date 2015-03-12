	
  jQuery(document).ready(function($) {
    $(function () {
    $.jstree.defaults.core.themes.variant = "large";
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree({  "core" : {
      "animation" : 200,
      "check_callback" : function (operation, node, node_parent, node_position) {return true;},
      "data": [{
            'text': "Module 1",
            "icon": false,
            'children': [{
              'text': 'Chapitre 1',
              "icon": false,
            },{
              'text': 'Chapitre 2',
              "icon": false,
            }]
          },{
            'text': 'Module 2',
            "icon": false,
            'children': [{
              'text': 'Chapitre 1',
              "icon": false,
              'data' : {
                  'info': 'plop',
                }
              },{
                'text': 'Chapitre 2',
                "icon": false,
                'data' : {
                  'info': 'plop',
                }
              }]
          }
      ],
      
    },
    "types" : {
      "#" : {
        "max_children" : 1, 
        "max_depth" : 2, 
        "valid_children" : ["root"],
      },
      "root" : {
        "icon" : "glyphicon glyphicon-flash",
        "valid_children" : ["default"]
      },
      "default" : {
        "valid_children" : ["default","file"]
      },
    },

      "dnd" : {
              "drop_target" : false,
              "drag_target" : false
          },

    "plugins" : [
      "dnd", "search", "crrm",
      "state", "types", "wholerow"
    ]
  });

$('#createChapitre').on('click', function () {
   //TODO Formulaire de création d'un chapitre
});

$('#deleteChapitre').on('click', function (e) {
  // TODO faire la requête AJAX et si réussi alors :
  var ref = $('#jstree').jstree(true),
  sel = ref.get_selected();
  if(!sel.length) { return false; }
  ref.delete_node(sel);
});

$('#moveUp').on('click', function () {
    var ref = $('#jstree').jstree(true),
    sel = ref.get_selected();
    var prev = ref.get_prev_dom(sel);
    var par = ref.get_parent(sel);

    if(par === prev.context.id){
      var newNode = ref.get_prev_dom(par);
      var newPar = ref.get_parent(newNode);
      $("#jstree").jstree("move_node",sel,newPar,"last");
    }
    if (prev.length) {
        $("#jstree").jstree("move_node", sel, prev, "before");
    }
});

$('#moveDown').on('click', function () {
    var ref = $('#jstree').jstree(true),
    sel = ref.get_selected();
    var next = ref.get_next_dom(sel);

    if(ref.is_parent(next) == true){
      $("#jstree").jstree("move_node",sel,next,"first");
    }
    if (next.length) {
        $("#jstree").jstree("move_node", sel, next, "after");
    }
});


$('#jstree')
  // listen for event
  .on('changed.jstree', function (e, data) {
    var i, j, r = [];
    for(i = 0, j = data.selected.length; i < j; i++) {
      r.push(data.instance.get_node(data.selected[i]).text);
    }
    $('#event_result').html('Selected: ' + r.join(', '));
  })
  // create the instance
  .jstree();
  }); 

});
  


// $('#moveDown').on('click', function () {
//     var ref = $('#jstree').jstree(true),
//     sel = ref.get_selected();
//     var next = ref.get_next_dom(sel,false);
//     if (next.length) {
//         $("#jstree").jstree("move_node", sel, next, "after");
//     }
// });