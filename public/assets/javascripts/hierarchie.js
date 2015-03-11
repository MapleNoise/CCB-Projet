	$(function () {
    $.jstree.defaults.core.themes.variant = "large";
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree({  "core" : {
      "animation" : 200,
      "check_callback" : function (operation, node, node_parent, node_position) {return true;},
      "data": [{
            'text': "Module 1",
            'children': [{
              'text': 'Chapitre 1',
              'info': 'plop'
            },{
              'text': 'Chapitre 2',
              'info': 'plop'
            }]
          },{
            'text': 'Module 2',
            'children': [{
              'text': 'Chapitre 1',
              'data' : {
                  'info': 'plop',
                }
              },{
                'text': 'Chapitre 2',
                'data' : {
                  'info': 'plop',
                }
              }]
          }
      ],
      "themes" : { "stripes" : true },
    },
    "types" : {
      "#" : {
        "max_children" : 1, 
        "max_depth" : 2, 
        "valid_children" : ["root"]
      },
      "root" : {
        "icon" : "/static/3.0.9/assets/images/tree_icon.png",
        "valid_children" : ["default"]
      },
      "default" : {
        "valid_children" : ["default","file"]
      },
      "file" : {
        "icon" : "",
        "valid_children" : []
      }
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
    var instance = $.jstree.reference('#jstree'),
          selected = instance.get_selected(),
          position = $('#'+selected).index();

    instance.move_node(
          selected,
          instance.get_parent( selected ),
          position - 1 < 0 ? 0 : position - 1
    );
});

$('#moveDown').on('click', function () {
     var instance = $.jstree.reference('#jstree'),
            selected = instance.get_selected(),
            position = $('#'+selected).index();

      instance.move_node(
          selected,
          instance.get_next_dom( selected, true ),
          'after'
      );
});


$('#jstree')
  // listen for event
  .on('changed.jstree', function (e, data) {
    var i, j, r = [];
    for(i = 0, j = data.selected.length; i < j; i++) {
      r.push(data.instance.get_node(data.selected[i]).text);
    }
    console.log(data);
    console.log(data.instance.get_node(data.selected[0]));
    $('#event_result').html('Selected: ' + r.join(', '));
  })
  // create the instance
  .jstree();

  });


// $('#moveDown').on('click', function () {
//     var ref = $('#jstree').jstree(true),
//     sel = ref.get_selected();
//     var next = ref.get_next_dom(sel,false);
//     if (next.length) {
//         $("#jstree").jstree("move_node", sel, next, "after");
//     }
// });