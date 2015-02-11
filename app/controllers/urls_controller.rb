class UrlsController < ApplicationController
  def index
    
  end

  def new
    @new_url = Url.new
    @all_urls = Url.all
  end

  def create
    @new_url = Url.new(url_params)
    @new_url.save
    flash[:notice] = "Post successfully created"
    redirect_to root_path
  end

  def show
    @new_url = Url.find(params[:id])
  end


  private

  def url_params
    params.require(:url).permit(:long_form)
  end
end
