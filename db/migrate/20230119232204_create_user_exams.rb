class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.datetime :start_date

      t.timestamps
    end
  end
end
