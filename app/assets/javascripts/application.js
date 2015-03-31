// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require chosen.jquery
//= require foundation/foundation.min
//= require foundation/foundation.reveal

$(function() {
  $(document).foundation();
  $(document).ajaxComplete(function() {
    $(document).foundation('reveal', 'reflow'); // re-check for reveal's
  });

  $(document).on('click', '.more-info', function() {
    // update the NIF box
    $('.ipss-number-place').html($(this).data('nipc'));
  });

  $(document).on('click', '.search-results tr', function() {
    var $button = $(this).find('[data-reveal-id]');
    $('#' + $button.attr('data-reveal-id')).foundation('reveal', 'open');

    $('.ipss-number-place').html($button.data('nipc'));
  });

  $('nav a[data-reveal-id="ipss-info"]').on('click', function() {
    $('.ipss-number-place').html('');
  });

  $('select').chosen({
    width: '100%'
  });
});
