	$(function () {
    $.jstree.defaults.core.themes.variant = "large";
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree({  "core" : {
    "animation" : 200,
    "check_callback" : true,
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
   var position = 'inside';
   var parent = $('#jstree').jstree('get_selected');
     var newNode = { state: "open", data:'mydata'};
    $('#jstree').jstree("create_node", parent, position, newNode, false, false);
});

// $('#deleteChapitre').on('click', function (e, data) {
//   var i, j, r = [];
//     for(i = 0, j = data.selected.length; i < j; i++) {
//       r.push(data.instance.get_node(data.selected[i]).text);
//     }
//   $("#jstree").jstree("remove",data.rslt.obj.find(r.join(', ')));
// });
    
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