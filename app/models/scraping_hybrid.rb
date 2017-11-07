class Scraping_hybrid
  def self.get

    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4")

    strainsNames = page.search('.infocard .object-title a .visible-xs')

      strainsNames.each do |strain|
      strainName = strain.inner_text
      second(strainName)
      end
  end

  def self.second(strainName)
    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4")

    dominants = page.search('.infocard .subtitle img')

      dominants.each do |domi|
      dominant = domi.get_attribute('alt')
      # record.save
      keep(strainName, dominant)
      end
  end

  def self.keep(strainName, dominant)
    record2 = Product.new(productName:strainName, dominant:dominant)
    record2.save
  end

end


