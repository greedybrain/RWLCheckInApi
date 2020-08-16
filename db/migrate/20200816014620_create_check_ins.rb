class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.string :name
      t.datetime :time_in
      t.datetime :time_out
      t.integer :num_of_visits
      t.string :remarks_post_visit

      t.timestamps
    end
  end
end
