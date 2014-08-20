module ApplicationHelper
  def alert_class(name)
    case name.to_s
      when 'alert' then 'alert alert-info'
      when 'error' then 'alert alert-danger'
      when 'notice' then 'alert alert-info'
      else "alert alert-#{name}"
    end
  end

  def errors(object, custom_message = nil)
    message = custom_message.presence || "Whoops! We couldn't save your changes because of the following errors:"
    render 'shared/errors', object: object, message: message
  end
end
