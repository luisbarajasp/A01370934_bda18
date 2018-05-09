// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require Chart.min
//= require dashboard/jquery.dataTables
//= require dashboard/dataTables.bootstrap4
//= require_tree .

var ready = function() {
    // Raws inventories    
    $('.see_inventories').on('click', function(e){
        $(this).addClass('has-showed');            
        $(this).toggleClass('showing');
        if($(this).hasClass('showing')){
            if($(this).hasClass('has-showed')){
                $(this).closest('.card').find('.inventories').show();  
                e.preventDefault();              
            }
            $(this).find('p').html('Hide inventories <i class="fa fa-chevron-down" aria-hidden="true"></i>');            
        }else{
            $(this).closest('.card').find('.inventories').hide();            
            $(this).find('p').html('See inventories <i class="fa fa-chevron-right" aria-hidden="true"></i>');            
        }
    });

    // Raws materials in recipes    
    $('.see_materials').on('click', function(e){
        $(this).addClass('has-showed');            
        $(this).toggleClass('showing');
        if($(this).hasClass('showing')){
            if($(this).hasClass('has-showed')){
                $(this).closest('.card').find('.materials').show();  
                e.preventDefault();              
            }
            $(this).find('p').html('Hide recipe materials <i class="fa fa-chevron-down" aria-hidden="true"></i>');            
        }else{
            $(this).closest('.card').find('.materials').hide();            
            $(this).find('p').html('See recipe materials <i class="fa fa-chevron-right" aria-hidden="true"></i>');            
        }
    });

    // Nested forms
    $('form').on('click', '.remove', function(event) {
        $(this).prev('.destroy').val('1');
        $(this).closest('tr').hide();
        return event.preventDefault();
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
};

$(document).on('ready', ready);
$(document).on('turbolinks:load', ready);