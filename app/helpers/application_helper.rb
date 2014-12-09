module ApplicationHelper
  def date_posted(date)
        date.strftime("%b %d %Y")
  end
end
