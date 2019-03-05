
FactoryBot.define do
  factory :book do
    sequence(:title) {|n| "Harry Potter#{n}"}
    sequence(:description) {|n| "An awesome fantasy novel series for children#{n}"}
  end
end
