namespace :db do

  desc "Populates database with development data."
  task populate: :environment do

    raise "\nPopulate database only works in development and staging environment.\n\n" unless Rails.env.development? || Rails.env.staging?

    c = Category.create(name: 'crianças')
    ac = ActivityCode.create(name: 'boring cae name', code: 123, category: c)
    3.times do
      CharityAssociation.create(name: 'assoc bem estar crianças', nif: 1234567890, city: 'lisboa', activity_code: ac)
    end

  end
end
