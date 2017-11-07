class Scraping_strain
  def self.get
    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4405")

        strains = page.search('.infocard .object-title a .visible-xs')

        strains.each do |strain|
        strainName = strain.inner_text
        strain = Product.new(productName:strainName)
        strain.save
      end
  end
end