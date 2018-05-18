FactoryBot.define do
  factory :user, aliases: [:owner] do
    email 'takashi0718k@gmail.com'
    password '031526'
    provider 'twitter'
    sequence(:uid) { |i| "uid#{i}" }
    sequence(:username) { |i| "username#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg"}    


  end
end
