class Exam < ApplicationRecord
  belongs_to :college, class_name: 'College', foreign_key: 'college_id'
  belongs_to :exam_window, class_name: 'ExamWindow', foreign_key: 'exam_window_id'

end
