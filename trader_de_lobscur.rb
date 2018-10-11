require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crypto(crypto_website)
  cryptomonney = {}
  doc = Nokogiri::HTML(open(crypto_website))
  cryptomonney["name"] = doc.xpath('/html/body/div[2]/div/div[1]/div[3]/div[1]/h1/text()').text.strip
  cryptomonney["value"] = doc.xpath('//*[@id="quote_price"]/span[1]').text
  return cryptomonney
end
#puts crypto("https://coinmarketcap.com/currencies/ethereum/")

def get_name_and_value_of_crypto
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  urls = []
  all_cryptos = []
  doc.xpath('//a[@class = "link-secondary"]/@href').each do |name_crypto|
    urls << 'https://coinmarketcap.com' + name_crypto.text
	end
  urls.each do |url|
    p a = crypto(url)
    all_cryptos << a
  end
end
puts get_name_and_value_of_crypto
