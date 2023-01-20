module Errors
  # CollegeNotFound
  class CollegeNotFound < StandardError
    def initialize
      super 'A college with the given id was not found'
    end
  end

  # ExamNotFound
  class ExamNotFound < StandardError
    def initialize
      super 'A exam with the given id was not found'
    end
  end

  # InvalidStartTime
  class InvalidStartTime < StandardError
    def initialize
      super "The start time does not fall with in the exam's time window"
    end
  end

  # UserCreateOrUpdateError
  class UserCreateOrUpdateError < StandardError
    def initialize
      super 'Failed to create or update user.'
    end
  end
end
