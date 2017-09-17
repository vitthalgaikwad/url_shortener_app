class ShortUrlsController < ApplicationController
  def index
  end

  def create
    if ShortUrl.exists?(original_url: short_url_params[:url])
      @url_exist = true
    else
      @url = ShortUrl.new(salt: rand(8)+1, original_url: short_url_params[:url])
      @success = @url.save
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:url)
  end
end
