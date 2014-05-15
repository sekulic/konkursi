  def full_title(page_title)
    title = "Sample App"
    if page_title == ""
    title
    else
      "#{title} | #{page_title}"
    end
  end