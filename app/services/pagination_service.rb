class PaginationService
  def initialize
  end

  def paginated_data(page_number, page_size)
    page_size = [page_size, 100].min
    @users = User.offset(page_number * page_size).limit(page_size).order('id DESC')
  end

end