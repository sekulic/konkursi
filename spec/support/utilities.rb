  def full_title(page_title)
    title = "Projekti.in.rs"
    if page_title == ""
    title
    else
      "#{title} | #{page_title}"
    end
  end