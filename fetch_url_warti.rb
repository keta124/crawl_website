require 'nokogiri'
require 'watir'
class FetchUrl
  def initialize url
    start_time = Time.now
    switches = ['--proxy-server=line3.lichchieu.vn:3800']
    @browser = Watir::Browser.new :chrome, headless: true, :switches => switches
    @browser.goto url
    @fetching_time = Time.now - start_time
  end

  attr_reader :browser, :fetching_time

  def html
    @html ||= browser.html
  end

  def doc
    @doc ||= Nokogiri::HTML html
  end

end
puts FetchUrl.new('https://www.engvid.com/topic/pronunciation/').doc
