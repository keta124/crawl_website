#LOAD_PATH << File.join(File.dirname(__FILE__))
require_relative 'crawler'
class CliptvCrawler
  class << self
    def phim_le
      crawler_phim_le
    end
    def phim_bo
      crawler_phim_bo
    end
    def crawler_phim_le
      url ='https://cliptv.vn/phim/phim-le'
      all_page_doc = WebsiteCrawler.new(url).crawler_url
      all_page_doc_ = all_page_doc.css('ul.pagination a')
      last_page = all_page_doc_[-2].text.to_i
      (1..last_page).each do |page|
        list_film = WebsiteCrawler.new("#{url}/?page=#{page}").crawler_url
        list_film.css('.content').each do |content|
          begin
            content.css('.caption h4').text
            content.css('.clip-thumb-time').text.gsub(/\D/, '').to_i
            content.at('i.clip-icon-play-2.clip-redirect')["data-href"]
          rescue Exception
          end
        end
      end
    end
  end
end
CliptvCrawler.crawler_phim_le