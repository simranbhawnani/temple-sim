class Temple < ApplicationRecord
  has_many :temple_history_details
  has_many :devoters
  has_many :users
  
  has_many_attached :temple_images
end
