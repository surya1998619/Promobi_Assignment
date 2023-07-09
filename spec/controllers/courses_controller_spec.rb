require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe '#index' do
    let!(:course1) { FactoryBot.create(:course) }

    before do
      tutor1 = FactoryBot.create(:tutor, course: course1)
    end

    it 'returns a list of courses with their tutors' do
      get :index

      expect(response).to have_http_status(:ok)

      courses_response = JSON.parse(response.body)

      expect(courses_response.first['id']).to eq(course1.id)
      expect(courses_response.first['name']).to eq(course1.name)
      expect(courses_response.first['tutors'].size).to eq(1)
      expect(courses_response.first['tutors'].first['name']).to eq(course1.tutors.first.name)
    end
  end

  describe '#create' do
    let(:course_params) do
      {
        name: 'Computer Science',
        difficulty: 'hard',
        duration: '3 months',
        cost: '34000 rs',
        tutors: [
          {
            name: 'Shashank',
            age: 25,
            gender: 'Male',
            experience: '5 years'
          },
          {
            name: 'smitha',
            age: 28,
            gender: 'Female',
            experience: '3 years'
          }
        ]
      }
    end

    it 'creates a course and its tutors successfully' do
      expect {
        post :create, params: { course: course_params }
      }.to change(Course, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq('Course and tutors created successfully')
    end

    it 'does not create a course if name length is less than 3' do
      course_params[:name] = 'ab'

      expect {
        post :create, params: { course: course_params }
      }.to change(Course, :count).by(0).and change(Tutor, :count).by(0)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to include('Name must be at least 3 characters long')
    end
  end
end
