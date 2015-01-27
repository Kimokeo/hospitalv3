class Hospital < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true

	has_many :patients, dependent: :destroy


end
