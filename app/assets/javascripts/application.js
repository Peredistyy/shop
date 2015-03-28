// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

jQuery(document).ready(function() {

    jQuery('#sign_up_user').bind('ajax:success', function(e, data) {
        jQuery('#sign_up_user').find('.error_messages').html('');

        if (data['success']) {
            location.reload();
        } else {
            for (var key in data['errors']) {
                var message_html = '<div class="alert alert-warning">' + data['errors'][key] + '</div>';
                jQuery('#sign_up_user').find('.error_messages').append(message_html);
            }
        }
    });

    jQuery('#sign_in_user').bind('ajax:success', function(e, data) {
        jQuery('#sign_in_user').find('.error_messages').html('');

        if (data['success']) {
            location.reload();
        } else {
            for (var key in data['errors']) {
                var message_html = '<div class="alert alert-warning">' + data['errors'][key] + '</div>';
                jQuery('#sign_in_user').find('.error_messages').append(message_html);
            }
        }
    });

});


