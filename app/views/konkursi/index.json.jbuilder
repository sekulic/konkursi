json.array!(@konkursi) do |konkurs|
  json.extract! konkurs, :id, :ime, :iznos, :rok, :otvaranje
  json.url konkurs_url(konkurs, format: :json)
end
