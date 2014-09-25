class Datatable
  delegate :params, :h, :link_to, :url_for, to: :@view

  def initialize(view)
    @view = view
  end

  protected

  def page
    params[:start].to_i/per_page + 1
  end

  def per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
