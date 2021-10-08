class AddRelatonTempleToSomeTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :worships, :temple
    add_reference :slots, :temple
    add_reference :slots, :worship
    add_reference :devoters, :temple
  end
end
