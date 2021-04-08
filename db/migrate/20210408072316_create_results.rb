class CreateResults < ActiveRecord::Migration[5.0]
  def up
    create_table :results do |t|
      # t.integer "user_id"
      # t.integer "tournament_id"
      t.json "answers"
    end

    add_reference :results, :user, index: true
    add_foreign_key :results, :users

    add_reference :results, :tournament, index: true
    add_foreign_key :results, :tournaments
  end

  def down
    drop_table :results
  end
end
