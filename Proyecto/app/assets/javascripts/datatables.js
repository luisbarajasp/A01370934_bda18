var ready = function() {
    $('.dataTable').DataTable();    
};

$(document).on('ready', ready);
$(document).on('turbolinks:load', ready);