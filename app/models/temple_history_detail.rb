class TempleHistoryDetail < ApplicationRecord
  belongs_to :temple

  has_many_attached :temple_history_images
  has_many_attached :temple_structure_images
  has_many_attached :inside_temple_theertham_images
  has_many_attached :outside_temple_theertham_images
end
