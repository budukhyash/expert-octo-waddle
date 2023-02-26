# spec/services/pagination_service_spec.rb

require 'rails_helper'

RSpec.describe PaginationService do
  describe '#paginated_data' do
    let(:service) { PaginationService.new }

    it 'returns paginated user data with id, first_name and last_name' do
      users = create_list(:user, 10)
      expected_users = users.sort_by(&:id).reverse.map { |u| { id: u.id, first_name: u.first_name, last_name: u.last_name } }

      result = service.paginated_data(0, 10).as_json

      expect(result).to eq(expected_users.as_json)
    end

    it 'returns maximum 100 users per page' do
      create_list(:user, 150)

      result = service.paginated_data(0, 200)

      expect(result.size).to eq(100)
    end

    it 'returns correct data for a given page number and page size' do
      users = create_list(:user, 10)
      expected_users = users.sort_by(&:id).reverse.map { |u| { id: u.id, first_name: u.first_name, last_name: u.last_name } }.as_json

      result = service.paginated_data(1, 5).as_json

      expect(result).to eq(expected_users[5..9])
    end
  end
end
