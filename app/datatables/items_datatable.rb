class ItemsDatatable < Datatable
  def as_json
    {
      draw: params[:draw].to_i,
      recordsTotal: Item.count,
      recordsFiltered: items.count,
      data: data
    }
  end

  private

  def data
    items.map do |item|
      [ item.name, item.size, item.units, item.tags, '' ]
    end
  end

  def items
    @items ||= Item.select(:name, :size, :units).includes(:tags)
      .page(page).per(per_page)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
