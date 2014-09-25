class DatatablesController < ApplicationController
  def items
    render json: ItemsDatatable.new(view_context).as_json
  end
end
