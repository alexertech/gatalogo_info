FactoryBot.define do
  factory :gato do
    name { Faker::Creature::Cat.name }
    breed { Faker::Creature::Cat.breed }
    description { Faker::Lorem.paragraph }
    user
    
    trait :with_image do
      # Implement when needed
    end
    
    trait :with_tags do
      after(:create) do |gato|
        gato.tags << create(:tag)
      end
    end
  end
end