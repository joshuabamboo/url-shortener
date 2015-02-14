class UrlsController < ApplicationController
  def new
    @new_url = Url.new
    @base_url = request.original_url
    @top100 = Url.get_top_urls(100)
    @last5 = Url.get_last_urls(5)
  end

  def create
    new_url = Url.new(url_params)
    new_url.short_form = Url.new.generate_unique_id
    new_url.save
    redirect_to root_path
  end

  def redirect
    original_url = Url.get_long_url(short_form: request.params[:path])
    if original_url
      original_url.access_count += 1
      original_url.save
      redirect_to original_url.long_form, status: 302
    else
      redirect_to root_path
    end
  end


  private

  def url_params
    params.require(:url).permit(:long_form)
  end
end