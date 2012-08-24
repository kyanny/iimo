class CreateUnkos < ActiveRecord::Migration
  def change
    create_table :unkos do |t|
      t.string :smell

      t.timestamps
    end
  end
end
