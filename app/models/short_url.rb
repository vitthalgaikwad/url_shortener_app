class ShortUrl < ActiveRecord::Base

  def short_url
    "#{ Rails.env.production? ? PROD_HOST_URL : DEV_HOST_URL }/#{ (id.to_s + salt.to_s).reverse.to_i.to_s(36) }"
  end
end
