class Presence < ApplicationRecord
	belongs_to :user
	validates :when, presence: true

  scope :today, -> { where(when: Time.zone.now).count }
end
