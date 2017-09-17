class ShortUrl < ActiveRecord::Base

  def short_url
    # Create short url using id and salt and converting this into base36 number
    "#{ Rails.env.production? ? PROD_HOST_URL : DEV_HOST_URL }/#{ (id.to_s + salt.to_s).reverse.to_i.to_s(36) }"
  end

  def self.short_url_to_id(url)
    # Convert short url into base36 number and reverse it, then remove last number which is nothing but salt
    url.to_i(36).to_s.reverse.chop.to_i
  end
end
