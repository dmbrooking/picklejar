require 'open-uri'
require 'addressable/uri'

class RecipeSource

  def initialize(url=nil)
    @url = url
    if @url
      begin
        @page = Nokogiri::HTML(open(url))
      rescue
        @page = nil
      end
    end
  end

  def get_title
    @page&.css('title')&.text
  end

  def get_hostname
    Addressable::URI.parse(@url).host
  end

end
