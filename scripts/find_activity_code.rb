require 'nokogiri'
require 'open-uri'

VERBOSE = true

BASE_URL = "http://www.einforma.pt/servlet/app/portal/ENTP/prod/ETIQUETA_EMPRESA_CONTRIBUINTE/nif/"

CharityAssociation.includes(:activity_code).where( activity_codes: { id: nil }).find_in_batches(batch_size: 100) do |batch|
  # puts 'Sleeping for 1 min ...' if VERBOSE
  # sleep(60)

  batch.each do |charity_association|
    nif = charity_association.nif
    puts "searching activity code of: \t #{charity_association.name}[#{nif}]" if VERBOSE

    url = "#{BASE_URL}#{nif}/contribuinte/#{nif}"
    doc = Nokogiri::HTML(open(url))

    doc.css('span.category').each do |item|
      activity_code_name = item.inner_html
      puts "\t\t got this: #{activity_code_name} \n" if VERBOSE

      if activity_code = ActivityCode.where("lower(name) LIKE ?", "%#{activity_code_name.downcase}%").first
        puts "\t\t FOUND activity code: #{activity_code.name}" if VERBOSE
      else
        activity_code = ActivityCode.create(name: activity_code_name)
        puts "\t\t created activity code: #{activity_code.name}" if VERBOSE
      end

      charity_association.activity_code = activity_code
      charity_association.save

      puts "\n\n" if VERBOSE
    end
  end
end
