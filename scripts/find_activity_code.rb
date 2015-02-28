require 'nokogiri'
require 'open-uri'

VERBOSE = false

BASE_URL = "http://www.einforma.pt/servlet/app/portal/ENTP/prod/ETIQUETA_EMPRESA_CONTRIBUINTE/nif/"

CharityAssociation.includes(:activity_code).where( activity_codes: { id: nil }).find_in_batches(batch_size: 50) do |batch|
  # puts 'Sleeping for 1 min ...' if VERBOSE
  # sleep(60)

  batch.each do |charity_association|
    nif = charity_association.nif
    puts "searching activity code of: \t #{charity_association.name}[#{nif}]" if VERBOSE

    url = "#{BASE_URL}#{nif}/contribuinte/#{nif}"
    doc = Nokogiri::HTML(open(url))

    doc.css('span.category').each do |item|
      activity_code_name = item.inner_html
      puts "got this: #{activity_code_name} \n" if VERBOSE

      # the results are sorted for the one with bigger id because it's the more specific and maybe the correct!
      activity_code = ActivityCode.where("lower(name) LIKE ?", "%#{activity_code_name.downcase}%").order(code: :desc).first

      if activity_code
        puts "found this: #{activity_code.name}" if VERBOSE

        charity_association.activity_code = activity_code
        puts "#{charity_association.name} updated!" if charity_association.save
      end
    end
  end
end
