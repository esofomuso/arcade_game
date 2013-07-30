module ApplicationHelper
  # Creates an anchor using link_to :remote => true and adds additional behavior
  # so that the ajax response content is rendered and displayed within the
  # site-wide modal dialog.
  #
  # Any arguments supplied will be passed on to the Rails link_to helper.
  #
  # Example:
  #   link_to_modal_ajax 'See help', help_me_url, :class => 'link'
  #
  #   =>
  #   <a id='modalTrigger1234' href='/en-US/help/me' data-remote='true' \
  #      class="link modalAjaxTrigger">See Help</a>
  #   <script type="text/javascript">
  #    $('#modalTrigger1234').modalAjaxify();
  #   </script>
  #
  #
  def link_to_modal_ajax(*args, &block)
    if block_given?
      text         = capture(&block)
      options      = args.first || {}
      html_options = args.second || {}
    else
      text         = args[0]
      options      = args[1] || {}
      html_options = args[2] || {}
    end
    html_options = HashWithIndifferentAccess.new(html_options)

    html_options[:remote] = true
    if (html_options[:class]) 
      html_options[:class] << ' modalAjaxTrigger'
    else
      html_options[:class] = 'modalAjaxTrigger'
    end

    link_id = if (html_options[:id])
      html_options[:id]
    else
      html_options[:id] = "modalTrigger#{rand(999)}";
    end

    html = link_to text, options, html_options
    html += javascript_tag do raw(%[
      $('##{link_id}').modalAjaxify(); 
    ]) end
    html
  end
end
