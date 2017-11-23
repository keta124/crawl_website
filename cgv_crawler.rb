require_relative 'crawler'
class CgvCrawler
  class << self
    def film_lists
      crawler_film_lists
    end
    def crawler_film_lists
      url ='https://www.galaxycine.vn/dat-ve/coco#filmSchedule'
      all_page_doc = WebsiteCrawler.new(url).crawler_url
      puts all_page_doc.at('[id=schedule-bundle-1252]').css('.silver-content')
      all_page_doc_ = all_page_doc.at('.add-to-cart-wrapper').at('button')[:onclick].gsub(/\D/, '').to_i
      url='https://www.cgv.vn/default/cinox/ajax/schedulesbymovie?id=17014500'
      all_page_doc = WebsiteCrawler.new(url).crawler_url
      puts all_page_doc
    #  last_page = all_page_doc_[-2].text.to_i
    #  (1..last_page).each do |page|
    #    list_film = WebsiteCrawler.new("#{url}/?page=#{page}").crawler_url
    #    list_film.css('.content').each do |content|
    #      begin
    #        content.css('.caption h4').text
    #        content.css('.clip-thumb-time').text.gsub(/\D/, '').to_i
    #        content.at('i.clip-icon-play-2.clip-redirect')["data-href"]
    #      rescue Exception
    #      end
    #    end
    #  end
    end
  end
end
CgvCrawler.crawler_film_lists