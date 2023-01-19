class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :exam_window, foreign_key: true
    add_reference :exams, :college, foreign_key: true

    add_reference :enrollments, :user, foreign_key: true
    add_reference :enrollments, :college, foreign_key: true
    add_reference :enrollments, :exam, foreign_key: true
  end
end
