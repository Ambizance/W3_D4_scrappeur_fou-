require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'


site = "https://coinmarketcap.com/all/views/all/"

def extraction(page)
    #création de variables
    doc = Nokogiri::HTML(URI.open(page))
    crypto_name_array = Array.new
    crypto_value_array = Array.new

    #on entre les noms des crypto dans crypto_name_array
    (doc.xpath('//tr/td[3]/div')).each { |crypto| crypto_name_array << crypto.text }
#puts crypto_name_array
     #on entre les valeurs des crypto dans crypto_value_array
    (doc.xpath('//tr/td[5]/div/a')).each { |crypto| crypto_value_array << crypto.text }
#puts crypto_value_array

    crypto_hash = Hash.new
    crypto_hash = crypto_name_array.zip(crypto_value_array).map { |x,y| { x=>y } }
    
    puts crypto_hash
end

extraction(site) 
