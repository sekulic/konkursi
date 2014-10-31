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
     @onkursi_aplsek_record = Hash.new
     if atribut == "aplikant"
       @aplsek_konkurs = AplikantKonkurs.find_all_by_aplikant_id(ids) 
     elsif atribut == "sektor"
       @aplsek_konkurs = SektoriKonkurs.find_all_by_sektori_id(ids) 
     end 
       @aplsek_konkurs.each do |aplsek_kon|
       @konkursi_aplsek_record = konkursi.find {|i| i["id"] == aplsek_kon.konkurs_id}
       unless @konkursi_aplsek_record.empty? @svi_konkursi_aplsek.push(@konkursi_aplsek_record)   
  end                      
   @svi_konkursi_aplsek.uniq! { |x| x['id']  }
   return @svi_konkursi_aplsek
 end   
 
  def filter_koknkursi(params_konkurs, konkursi) 
    if params_konkurs.has_key?(:status_ids)
      atribut = "status"
      konkursi = konkursi_filter(params_konkurs[:status_ids], konkursi, atribut)
    end
    if params_konkurs.has_key?(:raspisivac_ids)
      atribut = "raspisivac"       
      konkursi = konkursi_filter(params_konkurs[:raspisivac_ids], konkursi, atribut)
    end
    if params_konkurs.has_key?(:aplikant_ids)
      atribut = "aplikant" 
      konkursi = konkursi_filter_apl(params_konkurs[:aplikant_ids], konkursi, atribut)
    end
    if params_konkurs.has_key?(:sektor_ids)
      atribut = "sektor" 
      konkursi = konkursi_filter_apl(params_konkurs[:sektor_ids], konkursi, atribut)
    end 
    return konkursi
  end 
 
  def delete_dependencies(konkurs_id)
     @sektor_konkurs_delete = SektoriKonkurs.find_all_by_konkurs_id(konkurs_id)
     @sektor_konkurs_delete.each do |sektor_konkurs|
       sektor_konkurs.destroy
     end
     @aplikant_konkurs_delete = AplikantKonkurs.find_all_by_konkurs_id(konkurs_id)
     @aplikant_konkurs_delete.each do |aplikant_konkurs|
       aplikant_konkurs.destroy
     end       
   end 
   def create_dependencies(sektor_ids, aplikant_ids)     
     sektor_ids.each do |sektor_id|
       @sektor_konkurs_save = SektoriKonkurs.new(:sektori_id => sektor_id.to_i, :konkurs_id => @konkurs[:id])
       @sektor_konkurs_save.save 
     end 
     aplikant_ids.each do |aplikant_id|
       @aplikant_konkurs_save = AplikantKonkurs.new(:aplikant_id => aplikant_id.to_i, :konkurs_id => @konkurs[:id])
       @aplikant_konkurs_save.save 
     end    
  end             
end
