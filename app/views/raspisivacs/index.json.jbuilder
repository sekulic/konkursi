json.array!(@raspisivacs) do |raspisivac|
  json.extract! raspisivac, :id, :name
  json.url raspisivac_url(raspisivac, format: :json)
end
