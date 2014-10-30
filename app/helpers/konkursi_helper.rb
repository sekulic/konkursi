module KonkursiHelper
 def konkursi_filter(ids, konkursi, atribut)
   @svi_konkursi_filter = Array.new
   ids.each do |id|
    konkursi.each do |konkurs|
      @svi_konkursi_filter.push(konkurs) if konkurs.+atribut == id.to_i
    end    
   end
    return @svi_konkursi_filter   
 end      
end
