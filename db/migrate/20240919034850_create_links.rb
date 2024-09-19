class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :url,  index: { unique: true }
      t.string :code, index: { unique: true }

      t.timestamps
    end
  end
end
