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
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require jasny-bootstrap.min
//= require jquery-ui

$(function(){
  $('#term').autocomplete({
    source: "/contacts/autocomplete",
    minlength: 3,
    select: function (event, ui) {
      $('#term').val(ui.item.value);
      $(this).closest('form').submit();
    }
  });
});

$(function() {
  $("#add-new-group").hide();
    $('#add-group-btn').click(function () {
    $("#add-new-group").slideToggle(function() {
      $('#new_group').focus();
    });
    return false;
    });
    $("#save-group-btn").click(function(event){
      event.preventDefault();
      var newGroup = $('#new_group')
      $.ajax({
        url: "/groups",
        method: "post",
        data: {
          group: { name: $("#new_group").val()}
        },
        success: function(response) {
          console.log(response);
        },
        error: function (xhr) {
          var errors = xhr.responseJSON;
          var error = errors.join(", ");
          if (error) {
            var inputGroup = newGroup.closest('.input-group');
            inputGroup.next('.text-danger').remove();

            inputGroup
              .addClass('has-error')
              .after('<p class="text-danger">' + error + '</p>');
          }
        }
      });
    });
});
