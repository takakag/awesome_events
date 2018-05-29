# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FactoryBot.define do
    factory :user, aliases: [:owner] do
        email 'takashi0718k@gmail.com'
        password '031526'
        provider 'twitter'
        sequence(:uid) { |i| "uid#{i}" }
        sequence(:nickname) { |i| "nickname#{i}" }
        sequence(:image_url) { |i| "http://example.com/image#{i}.jpg"}
        
        
    end
end
