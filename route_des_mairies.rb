require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(mairie)
mail = {}
doc = Nokogiri::HTML(open(mairie))
mail["name"] = doc.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
mail["mail"] = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	  return mail

end

#puts get_the_email_of_a_townhal_from_its_webpage("http://www.annuaire-des-mairies.com/95/ableiges.html")

def get_all_the_urls_of_val_doise_townhalls
  doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
  mairie = []
  villes = []
    doc.xpath('//a[@class = "lientxt"]').each do |ville|
	  villes << ville.text
	end
    doc.xpath('//a[@class = "lientxt"]/@href').each do |mairies|
      mairies = "http://www.annuaire-des-mairies.com/" + mairies.to_s[2..-1]
      mairie << get_the_email_of_a_townhal_from_its_webpage(mairies)
	  end
return mairie
return villes
end
puts get_all_the_urls_of_val_doise_townhalls



def get_the_city_of_val_doise
villes = []
doc = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath('//a[@class = "lientxt"]').each do |ville|
	  villes << ville.text
	end
  return villes
end
#puts  get_the_city_of_val_doise
