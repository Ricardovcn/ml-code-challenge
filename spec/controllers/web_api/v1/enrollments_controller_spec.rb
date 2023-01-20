require 'rails_helper'
RSpec.describe WebApi::V1::EnrollmentController, type: :controller do

  let(:first_name) { 'Ricardo' }
  let(:last_name) { 'Costa' }
  let(:phone_number) { '999-9999' }
  let(:exam_id) { 1 }
  let(:college_id) { 2 }
  let(:start_time) { '2022-11-19 20:30:45' }

  let(:params) do
    {
      first_name: first_name,
      last_name: last_name,
      phone_number: phone_number,
      exam_id: exam_id,
      college_id: college_id,
      start_time: start_time
    }
  end

  describe '#create' do
    context 'when all the parameters are correct' do
      it 'returns a 200 code response' do
        post :create, params: params

        expect(response).to have_http_status :no_content
      end
    end

    context 'when some required param is missing' do
      it 'returns a 400 code with an appropriate message' do
        post :create, params: params.except(:first_name)

        expect(response).to have_http_status :bad_request
      end
    end

    context 'when the exam_id is invalid' do
      let(:exam_id) { 'random' }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end
    end

    context 'when the college_id is invalid' do
      let(:college_id) { 'random' }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end
    end

    context 'when the phone_number is invalid' do
      let(:phone_number) { '999-phone' }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end
    end

    context 'when the start_time is invalid' do
      let(:start_time) { nil }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end

      let(:start_time) { '2022-12-30' }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end
    end

    context 'when one of the names is invalid' do
      let(:first_name) { nil }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end

      let(:last_name) { 'R34' }

      it 'returns a 400 code with an appropriate message' do
        post :create, params: params

        expect(response).to have_http_status :bad_request
      end
    end
  end
end
