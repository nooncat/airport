module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice'  then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error'   then 'alert alert-error'
    when 'alert'   then 'alert alert-error'
    end
  end

  def aircraft_status_history(audits)
    return '' if audits.empty?

    audits.map do |audit|
      "#{parse_state(audit.audited_changes['state'])} #{time_ago_in_words(audit.created_at)} ago"
    end.join('<br>')
  end

  private

  def parse_state(value)
    (value.is_a?(Array) ? value.last : value).humanize
  end
end
