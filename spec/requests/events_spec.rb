require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe 'POST #create' do
    context 'with invalid params' do
      it 'returns an unprocessable entity response' do
        post events_path, params: { event: { title: '' }, format: :json }
        expect(response).to have_http_status(422)
      end
    end

    context 'with valid params' do
      it 'returns created response' do
        post events_path, params: { event: attributes_for(:event), format: :json }
        expect(response).to have_http_status(201)
        expect(response).to match_response_schema('event')
      end
    end
  end

  describe 'GET #index' do
    context '#html' do
      it 'should return success status' do
        get events_path
        expect(response).to have_http_status(200)
      end
    end

    context '#json' do
      before { create_list(:event, 3) }
      it 'should return success status' do
        get events_path, params: { format: :json }
        expect(response).to have_http_status(200)
        expect(response).to match_response_schema('event', list: true)
      end
    end
  end
end
