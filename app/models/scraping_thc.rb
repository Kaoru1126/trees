class Scraping_thc
  def self.get
    order = []
    agent = Mechanize.new
    page = agent.get("https://www.allbud.com/marijuana-strains/search?results=4005")

    numbers = page.search('.infocard .details .percentages')

    numbers.each do |num|
      number = num.inner_text
        puts number
        record = Thc.new(thc:number)
        record.save
    end
  end
end
