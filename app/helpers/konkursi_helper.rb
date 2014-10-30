module KonkursiHelper
 def konkursi_filter(ids, konkursi, atribut)
   @svi_konkursi_filter = Array.new
   ids.each do |id|
    konkursi.each do |konkurs|
      if atribut == "status"
      @svi_konkursi_filter.push(konkurs) if konkurs.status_id == id.to_i
      elsif atribut == "raspisivac"
      @svi_konkursi_filter.push(konkurs) if konkurs.raspisivac_id == id.to_i 
      end
    end    
   end
    return @svi_konkursi_filter   
 end 
 def konkursi_filter_apl(ids, konkursi, atribut)
   @svi_konkursi_aplsek = Array.new
   if atribut == "aplikant"
     @aplsek_konkurs = AplikantKonkurs.find_all_by_aplikant_id(ids) 
   elsif atribut == "sektor"
     @aplsek_konkurs = SektoriKonkurs.find_all_by_aplikant_id(ids) 
   end 
   @aplsek_konkurs.each do |aplsek_kon|
    @konkursi_aplsek_record = konkursi.find {|i| i["id"] == aplsek_kon.konkurs_id}
    @svi_konkursi_aplsek.push(@konkursi_aplsek_record)   
   end   
   return @svi_konkursi_aplsek
 end         
end
