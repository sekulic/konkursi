  def full_title(page_title)
    title = "Projekti.rs"
    if page_title == ""
    title
    else
      "#{title} | #{page_title}"
    end
  end