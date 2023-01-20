# frozen_string_literal: true

# CreateEnrollment
class CreateEnrollment
  def call(params)
    college = get_college(params[:college_id])
    exam = get_exam(params[:exam_id], college)

    user = create_or_update_user(params[:first_name], params[:last_name], params[:phone_number])

    verify_start_time(params[:start_time], exam.exam_window)

    Enrollment.create!(
      {
        start_date: params[:start_date],
        user_id: user.id,
        college_id: college.id,
        exam_id: params[:exam_id]
      }
    )
  end

  private

  def get_college(college_id)
    college = College.find_by(id: college_id)
    raise Errors::CollegeNotFound unless college

    college
  end

  def get_exam(exam_id, college)
    exam = college.exams.find_by(id: exam_id)
    raise Errors::ExamNotFound unless exam

    exam
  end

  def verify_start_time(start_time, exam_window)
    exam_date = DateTime.strptime(start_time,'%Y-%m-%d %H:%M:%S')
    raise Errors::InvalidStartTime unless exam_date.between?(exam_window.start_time, exam_window.end_time)
  end

  def create_or_update_user(first_name, last_name, phone_number)
    user = User.find_or_create_by({ first_name: first_name, last_name: last_name })
    user.update({ phone_number: phone_number })
    user
  rescue StandardError
    raise Errors::UserCreateOrUpdateError
  end
end
