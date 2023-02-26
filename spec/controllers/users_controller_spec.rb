require 'rails_helper'

require_relative '../../app/controllers/users_controller'

RSpec.describe UsersController, type: :controller do
  describe '#pages' do
    let(:pagination_service) { instance_double('PaginationService') }
    let(:data) { [{ id: 1, first_name: 'Yash', last_name: 'Budukh' }, { id: 2, first_name: 'Aman', last_name:'Gupta' }].as_json }

    before do
      allow(PaginationService).to receive(:new).and_return(pagination_service)
      allow(pagination_service).to receive(:paginated_data).and_return(data)
    end

    it 'returns a successful response' do
      get :pages
      expect(response).to be_successful
    end

    it 'returns data from the PaginationService' do
      get :pages
      expect(JSON.parse(response.body)).to eq(data)
    end

    it 'uses the correct page and per_page parameters' do
      expect(pagination_service).to receive(:paginated_data).with(2, 50)
      get :pages, params: { page: 2, size: 50 }
    end

    it 'defaults to page 0 and per_page 100 if no parameters are given' do
      expect(pagination_service).to receive(:paginated_data).with(0, 100)
      get :pages
    end
  end
end
