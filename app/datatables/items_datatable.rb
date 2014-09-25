class ItemsDatatable < Datatable
  def as_json
    {
      draw: params[:draw].to_i,
      recordsTotal: Item.count,
      recordsFiltered: items.total_count,
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
    @items ||= filter(Item.select(:name, :size, :units)
                      .includes(:tags)).page(page).per(per_page)
  end

  def filter(query)
    return query unless params[:search]
    query.where('name like ?', "%#{params[:search][:value]}%")
  end
end
