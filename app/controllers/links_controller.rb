class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.code = SecureRandom.alphanumeric(6)

    if @link.save
      redirect_to root_path,
        notice: "Link was successfully shortened to #{view_context.html_link_for(@link)}. #{view_context.copy_to_clipboard_button(@link)}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    link = Link.find_by(code: params[:id])

    if link && link.created_at.after?(1.minute.ago)
      link.increment!(:clicks)
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
