FactoryBot.define do
  factory :log do
    severity { :info }
    message { "A log" }
    category { :test }
  end
end
