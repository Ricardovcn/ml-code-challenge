# frozen_string_literal: true

module WebApi
  module V1
    class UserExamController < ApplicationController
      before_action :validate_required_params, :validate_college_id,
                    :validate_exam_id, :validate_first_name, :validate_last_name,
                    :validate_start_time, :validate_phone_number

      REQUIRED_PARAMS = [
        :first_name,
        :last_name,
        :phone_number,
        :college_id,
        :exam_id,
        :start_time,
      ].freeze

      rescue_from Errors::InvalidStartTime, Errors::UserCreateOrUpdateError, Errors::CollegeNotFound, Errors::ExamNotFound do
        head :bad_request
      end

      def create
        ::CreateUserExamService.new.call(permitted_params.to_h.symbolize_keys)
      end

      private

      def validate_required_params
        REQUIRED_PARAMS.each do |param|
          return bad_request_error("Required param #{param} is missing.") unless params[param]
        end
      end

      def permitted_params
        params.fetch(:user_exam, {}).permit(
          :first_name,
          :last_name,
          :phone_number,
          :college_id,
          :exam_id,
          :start_time
        )
      end

      def validate_college_id
        invalid_param_error(:college_id) unless integer_valid?(params[:college_id])
      end

      def validate_exam_id
        invalid_param_error(:exam_id) unless integer_valid?(params[:exam_id])
      end

      def validate_phone_number
        invalid_param_error(:phone_number) unless phone_number_valid?
      end

      def validate_start_time
        invalid_param_error(:start_time) unless datetime_valid?(params[:start_time])
      end

      def validate_first_name
        invalid_param_error(:first_name) unless name_valid?(params[:first_name])
      end

      def validate_last_name
        invalid_param_error(:last_name) unless name_valid?(params[:last_name])
      end

      def phone_number_valid?
        /\A[^a-zA-z]+\Z/.match?(params[:phone_number])
      end

      def integer_valid?(number)
        /\A\d+\Z/.match?(number)
      end

      def invalid_param_error(param)
        bad_request_error("Ivalid param: #{param}")
      end

      def name_valid?(name)
        size = name.size
        return false if size < 2 || size > 30

        /\A[a-zA-z]+\Z/.match?(name)
      end

      def bad_request_error(message)
        render json: { error_message: message }, status: :bad_request
      end

      def datetime_valid?(string_date)
        string_date.length == 19 && !!DateTime.strptime(string_date,'%Y-%m-%d %H:%M:%S')
      rescue StandardError
        false
      end
    end
  end
end
