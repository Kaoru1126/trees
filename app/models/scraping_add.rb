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

        # record = Product.(dominant:dominant).first_or_initialize
        # record(productName:str)
        # record.save(dominant:dominant)
      end
  end




















  # def self.get

  #   agent = Mechanize.new

  #   page = agent.get("https://www.allbud.com/marijuana-strains/search?results=1")

  #   strainsName = page.search('.infocard .object-title a .visible-xs')
  #   strainsName.each do |st|
  #     str = st.inner_text
  #     puts str
  #     second(str)
  #   end
  # end

  # def self.second(str)

  #   agent = Mechanize.new

  #   page = agent.get("https://www.allbud.com/marijuana-strains/search?results=1")

  #   dominant = page.search('.infocard .subtitle img')
  #   dominant.each do |dom|
  #     domi = dom.get_attribute('alt')
  #     puts domi
  #   record = Product.new(productName:str, dominant:domi)
  #   record = Product.where(productName:str, dominant:domi).first_or_initialize
  #   record.save
  #   end
  # end

end
