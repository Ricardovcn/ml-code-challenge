class CreateApiRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :api_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :college_id
      t.integer :exam_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
