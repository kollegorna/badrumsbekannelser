//= require active_admin/base

$(document).ready(function() {
  if ($('body.admin_cells.index').length) {
    $('#index_table_cells tbody').disableSelection();
    $('#index_table_cells tbody').sortable({
      axis: 'y',
      cursor: 'move',
      update: function(event, ui) {
        var attr = ui.item.attr('id').split('_');
        $.post('/admin/cells/position', {
          object: attr[0],
          id: attr[1],
          position: ui.item.index()
        });
      }
    });
  }
});
