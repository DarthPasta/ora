class Engagement < ApplicationRecord
	belongs_to :offer, optional: true
	belongs_to :request, optional: true
	belongs_to :user
end
