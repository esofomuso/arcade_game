/**
 * Site-wide modal dialog handling.
 *
 * Provides common setup and triggering of the div#modal as a dialog as well as
 * a $.modalAjaxify JQuery plugin.
 *
 * This script assumes the following:
 *   1. a div#modal exists on the page somewhere.
 *   2. all clickable .modalTrigger elements will render the div#modal as a JQuery dialog.
 *
 * Usage:
 *   A) Enable a link to bring up the div#modal dialog when clicked (just add
 *   .modalTrigger class):
 *
 *     <a href="#viewDialog" class=".modalTrigger">View Dialog</a>
 *
 *   B) Apply AJAX event handling and content loading for a remote link.  Given
 *   a Rails JQuery link_to_remote link like this:
 *
 *     <a id="trigger1" href="/en-MX/ajax/users/1" data-remote="true">View Data</a>
 *
 *   jquery-rails is already setup to make this operate as a link_to_remote.  To
 *   make this link dump the ajax response into the dialog, simply:
 *
 *     <script type="text/javascript">
 *       $('#trigger1').modalAjaxify();
 *     </script>
 * 
 *   this will display the dialog with an animated loading image and render the
 *   content upon completion of the request. 
 *
 *   Alternatively, utilize the link_to_modal_ajax helper to create a link of
 *   this type.
 *
 */
(function($) {

  // default jquery dialog settings
  var settings = {
      modal: true,
      width: 850,
      position: 'center'
  };

  // default site-wide behavior for any clickable element to trigger the display
  // of the modal dialog
  $(document).on('click','.modalTrigger',function(evt) {
      evt.preventDefault();
      $('#modal').dialog(settings);
  });

  /**
   * Modal dialog jquery plugin for yatri-gss-ais.
   * This assumes that the target element(s) are ajaxified with jquery_ujs and
   * will fire ajax events.
   */
  $.fn.modalAjaxify = function() {
     this.bind('ajax:beforeSend', function(xhr, settings) {
          $('#modal .content').html('');
          $('#modal .loader').show();
     });
     this.bind('ajax:complete', function(xhr, status) {
          $('#modal .loader').hide();
     });
     this.bind('ajax:success', function(xhr, data, status) {
          $('#modal .content').html(data);
     });
     this.bind('ajax:error', function(xhr, status, error) {
          //TODO: display a proper error message
          $('#modal .content').html(error);
     });

     this.click(function(evt) {
          evt.preventDefault();
          $('#modal').dialog(settings);
     });
  }

})(jQuery);

