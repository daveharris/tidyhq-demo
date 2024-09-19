class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.code = SecureRandom.alphanumeric(6)

    if @link.save
      html_link = view_context.link_to(link_url(id: @link.code), link_url(id: @link.code), target: '_blank')

      redirect_to root_path, notice: "Link was successfully shortened to #{html_link}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    link = Link.find_by(code: params[:id])

    if link && link.created_at.after?(1.minute.ago)
      redirect_to link.url, allow_other_host: true
    else
      redirect_to root_path, alert: "Link not found."
    end
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
