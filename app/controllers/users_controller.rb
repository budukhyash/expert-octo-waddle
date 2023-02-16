class UsersController < ApplicationController

  def pages
    page = (params[:page] || 0).to_i
    per_page = (params[:size] || 100).to_i
    response = PaginationService.new.paginated_data(page, per_page)
    render json: response
  end
end
