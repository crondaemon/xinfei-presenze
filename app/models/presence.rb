class Presence < ApplicationRecord
  belongs_to :user
  validates :when, presence: true

  scope :today, -> { where('presences.when': Time.zone.now) }
  scope :today_count, -> { today.count }
end
