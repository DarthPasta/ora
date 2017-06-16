class Engagement < ApplicationRecord
	belongs_to :offer
	belongs_to :request
	belongs_to :user
end
