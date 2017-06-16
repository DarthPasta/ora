class Offer < ApplicationRecord
  belongs_to :user, optional: true
  # mount_uploader :images, ImagesUploader
end
