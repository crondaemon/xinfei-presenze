FactoryBot.define do
  factory :presence do
    user {
      create(:user) if User.count == 0
      User.last
    }
    add_attribute(:when) { Time.zone.now }
  end
end
