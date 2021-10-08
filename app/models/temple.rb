class Temple < ApplicationRecord
  has_many :temple_history_details
  has_many :devoters
end
