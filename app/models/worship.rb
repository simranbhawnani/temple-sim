class Worship < ApplicationRecord
  belongs_to :temple
  has_many :slots
end
