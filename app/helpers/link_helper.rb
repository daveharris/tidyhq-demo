module LinkHelper

  def html_link_for(link)
    link_to(
      link_url(id: link.code),
      link_url(id: link.code),
      target: '_blank'
    )
  end

  def copy_to_clipboard_button(link)
    content_tag(
      :button, 'Copy to clipboard',
      id: 'copy-target',
      class: "btn",
      data: { 'clipboard-text' => link_url(id: link.code) }
    )
  end

end
