class Presence < ApplicationRecord
	belongs_to :user
	validates :when, presence: true
end
