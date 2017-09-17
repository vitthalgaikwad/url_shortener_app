class ShortUrlsController < ApplicationController
  def index
  end

  def create
    if ShortUrl.exists?(original_url: short_url_params[:url])
      @url_exist = true
    else
      @url = ShortUrl.new(salt: rand(8)+1, original_url: short_url_params[:url])   # Salt is any random number between 1 to 9
      @success = @url.save
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @url = ShortUrl.find_by(id: ShortUrl.short_url_to_id(params[:id]))
    if @url
      @url.increment!(:visit_count)     # Increase visit count of short url
      redirect_to @url.original_url, status: 301
    else
      redirect_to params[:id]
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:url)
  end
end
