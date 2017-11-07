class Scraping_add

  def self.get
    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4")

      common = page.search('.infocard')
      # return common
      common.each do |st|
        str = st.search('.object-title a .visible-xs').inner_text
        record = Product.new(productName:str)
        # return record
        second(record)

      end
    end
  def self.second(record)

    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4")
      dom = page.search('.infocard .subtitle img')
        return record
        dom.each do |domi|
          dominant = domi.get_attribute('alt')

      end
  end

end
