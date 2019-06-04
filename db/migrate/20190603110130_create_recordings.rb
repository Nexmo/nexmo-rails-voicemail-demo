class CreateRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :recordings do |t|
      t.string :uuid
      t.numeric :from

      t.timestamps
    end
  end
end
