require 'open-uri'
require 'nokogiri'

namespace :scrape do
  desc "「Friends(1~5)」のHTML取得し、/public/transcriptsに保存"
  task get_html_1_5: :environment do
    include Scrape
    
    (1..5).each do |season|
      urls = get_urls(season)
      
      urls.each_with_index do |url, i|
        file = File.new(Rails.root.to_s + "/public/transcripts/season#{season}/s0#{season}ep0#{i+1}.html", "w")
        html = URI.open(url).read
        
        file.puts(html)
        file.close
      end
    end
  end

  desc "「Friends(6~10)」のHTML取得し、/public/transcriptsに保存"
  task get_html_6_10: :environment do
    include Scrape
    
    (6..10).each do |season|
      urls = get_urls(season)
      
      urls.each_with_index do |url, i|
        file = File.new(Rails.root.to_s + "/public/transcripts/season#{season}/s0#{season}ep0#{i+1}.html", "w")
        html = URI.open(url).read
        
        file.puts(html)
        file.close
      end
    end
  end
end

module Scrape
  def get_urls(season_no)
    url = 'https://fangj.github.io/friends/'
    html = URI.open(url).read
    doc = Nokogiri::HTML.parse(html)
    ul_elements = doc.css('ul') # top pageのすべてのulタグを取得
    ul_element = ul_elements[season_no - 1]

    urls = []
    a_links = ul_element.css('a')
    a_links.each do |a|
      urls << 'https://fangj.github.io/friends/' + a[:href]
    end
    urls
  end
end
