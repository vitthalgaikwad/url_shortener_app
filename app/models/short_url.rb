require 'base62-rb'

class ShortUrl < ActiveRecord::Base

  def short_url
    # Create short url using id and salt and converting this into base62 number
    "#{ Rails.env.production? ? PROD_HOST_URL : DEV_HOST_URL }/#{ Base62.encode((id.to_s + salt.to_s).reverse.to_i) }"
  end

  def self.short_url_to_id(url)
    # Convert short url into base62 number and reverse it, then remove last number which is nothing but salt
    Base62.decode(url).to_s.reverse.chop.to_i
  end
end
