class Datatable
  delegate :params, :h, :link_to, :url_for, to: :@view

  def initialize(view)
    @view = view
  end

  protected

end
