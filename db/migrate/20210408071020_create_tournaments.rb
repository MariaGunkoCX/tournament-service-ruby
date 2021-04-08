class CreateTournaments < ActiveRecord::Migration[5.0]
  def up
    create_table :tournaments do |t|
      t.string "company_name", :null => false
      t.datetime "start_date"
      t.datetime "end_date"
    end
  end

  def down 
    drop_table :tournaments
  end

end
