class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :exam_window, foreign_key: true, null: false
    add_reference :exams, :college, foreign_key: true, null: false

    add_reference :user_exams, :user, foreign_key: true
    add_reference :user_exams, :college, foreign_key: true
    add_reference :user_exams, :exam, foreign_key: true
  end
end
