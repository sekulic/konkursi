module StaticPagesHelper
  def link_substring(konkurs_name)
    if konkurs_name.length > 110
    "#{konkurs_name[0..110]} ..."
    else
    "#{konkurs_name}"
    end
  end
end
