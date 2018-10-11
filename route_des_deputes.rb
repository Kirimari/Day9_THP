require 'rubygems'
require 'nokogiri'
require 'open-uri'


def depute(assemble_nationale_website)
  contact = {}
  doc = Nokogiri::HTML(open(assemble_nationale_website))
  contact[:gender] = doc.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ')[0]
  contact[:last_name] = doc.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ')[1]
  contact[:first_name] = doc.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text.split(' ')[2]
  contact[:mail] = doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li/a/@href').text.split(":")[1]
    contact
end
# puts depute("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

def mail_depute
  all_deputes = []
  doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  doc.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href').each do |deputes|
    depute_link = "http://www2.assemblee-nationale.fr" + deputes.text
    temp = depute(depute_link)
    p temp
    all_deputes << temp
  end
  all_deputes
end

puts mail_depute
