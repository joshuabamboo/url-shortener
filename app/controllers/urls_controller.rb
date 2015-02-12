class UrlsController < ApplicationController
  def index
    
  end

  def new
    @new_url = Url.new
    @all_urls = Url.all
    @base_url = "ur-.herokuapp.com/"
    @top100 = Url.order('access_count DESC').limit(100)
    @last5 = Url.order('updated_at DESC').limit(5)
  end

  def create
    new_url = Url.new(url_params)
    new_url.short_form = Url.new.generate_unique_id
    new_url.save
    redirect_to root_path
  end

  def show
    @new_url = Url.find(params[:id])
  end

  def redirect
    url = Url.find_by short_form: request.params[:path]
    url.access_count += 1
    url.save
    redirect_to url.long_form, status: 302
  end


  private

  def url_params
    params.require(:url).permit(:long_form)
  end
end
