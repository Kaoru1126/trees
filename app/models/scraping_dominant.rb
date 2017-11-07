class Scraping_dominant
  def self.get
    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4405")

    dominants = page.search('.infocard .subtitle img')
    dominants.each do |dominant|
        dom = dominant.get_attribute('alt')
        record = Dominant.new(dominant:dom)
        # puts dom
        record.save
    end
  end
end



