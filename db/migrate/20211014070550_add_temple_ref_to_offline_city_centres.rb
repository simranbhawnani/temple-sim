class AddTempleRefToOfflineCityCentres < ActiveRecord::Migration[6.0]
  def change
    add_reference :offline_city_centres, :temple, foreign_key: true
  end
end

