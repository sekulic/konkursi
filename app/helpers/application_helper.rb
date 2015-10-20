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
    title = "EUprojekti.INFO"
    if page_title == ""
    title
    else
      "#{title} | #{page_title}"
    end
  end
  def check_isadmin?
     unless current_user.try(:admin?)
       redirect_to root_path
     end
  end      
  def map_all
    @raspisivac = Raspisivac.all.map{|u| [ u.name, u.id ] }
    @vrsta = Vrste.all.map{|u| [ u.name, u.id ] }
    @valuta = Valuta.all.map{|u| [ u.name, u.id ] }
    @status = Status.all.map{|u| [ u.name, u.id ] }      
  end    
end
