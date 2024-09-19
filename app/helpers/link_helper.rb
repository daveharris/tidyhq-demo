module LinkHelper

  def html_link_for(link)
    link_to(
      link_url(id: @link.code),
      link_url(id: @link.code),
      target: '_blank'
    )
  end

end
