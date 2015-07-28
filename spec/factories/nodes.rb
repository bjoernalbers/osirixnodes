FactoryGirl.define do
  factory :node do
    name { Faker::Internet.domain_word }
    address { Faker::Internet.ip_v4_address }
    port { %w(104 3140 4096 4444 5678 11112).sample }
    aetitle { name.upcase.gsub(/[^A-Z]/, '') unless name.nil? }
  end
end
