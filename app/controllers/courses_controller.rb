class CoursesController < ApplicationController

  def index
      # Fetch all courses along with their associated tutors
      @courses = Course.includes(:tutors)

      render json: @courses, include: :tutors, status: :ok
  end

  def create
    # Create a new course with the provided parameters
    @course = Course.new(course_params)

    if @course.save
      # Create the associated tutors for the course
      create_tutors(params[:tutors])

      render json: { message: 'Course and tutors created successfully' }, status: :created
    else
       # Render error messages if course creation fails
      render json: { error: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    # Permit only the required parameters for the course
    params.require(:course).permit(:name,:difficulty,:duration,:cost)
  end

  def create_tutors(tutor_params)
    tutor_params&.each do |tutor_param|
      # Create each tutor for the course using the provided tutor parameters
      @course.tutors.create(tutor_param.permit(:name,:age,:gender,:experience))
    end
  end
end
