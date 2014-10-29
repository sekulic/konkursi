module KonkursiHelper
 def konkursi_filter(status_ids, konkursi_vrsta)
   @svi_konkursi_filter = Array.new
   status_ids.each do |status_id|
    konkursi_vrsta.each do |konkurs|
      @svi_konkursi_filter.push(konkurs) if konkurs.status_id == status_id.to_i
    end    
   end
    return @svi_konkursi_filter   
 end      
end
