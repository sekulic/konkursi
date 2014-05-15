module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "list-group-item active"
    else
      "list-group-item"
    end
  end  
  def is_active_page?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end  
  def full_title(page_title)
    title = "Projekti.rs"
    if page_title == ""
    title
    else
      "#{title} | #{page_title}"
    end
  end
   def check_isadmin?
      current_user.admin?
   end  
end
