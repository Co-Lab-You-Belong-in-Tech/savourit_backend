require 'open-uri'
require 'net/http'
require 'nokogiri'

class UberDelivery
  SUCCESS = 1
  ERROR = 0

  def self.scrap(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    html = response.body
    doc = Nokogiri::HTML(html)

    UberDelivery.create_entities(doc)
  end

  def self.create_entities(doc)
    r = UberDelivery.create_restaurant(doc)
    { code: UberDelivery::SUCCESS, restaurant: r }
  rescue ActiveRecord::StatementInvalid => e
    Rails.logger.debug e
    { code: UberDelivery::ERROR, restaurant: Restaurant.new,
      errors: "Can't create Restaurant, see log for more detail#{e}" }
  end

  def self.create_restaurant(doc)
    restaurant = {}
    restaurant[:name] = UberDelivery.get_value(doc.xpath('/html/body/div[1]/div[1]/div/main/div[3]/div/div[1]/h1').text)
    restaurant[:address] = UberDelivery.get_value('')
    restaurant[:street_address] = UberDelivery.get_value('')
    restaurant[:city] = UberDelivery.get_value('')
    restaurant[:country] = UberDelivery.get_value('')
    restaurant[:postal_code] = UberDelivery.get_value(nil)
    restaurant[:region] = UberDelivery.get_value(nil)
    restaurant[:latitude] = UberDelivery.get_value(nil)
    restaurant[:longitude] = UberDelivery.get_value(nil)
    restaurant[:phone_number] = UberDelivery.get_value(nil)
    restaurant[:currency_code] = UberDelivery.get_value(nil)

    r = Restaurant.new(restaurant)
    r.save
    r
  end

  def self.get_value(path)
    path unless path.nil?
  end
end
