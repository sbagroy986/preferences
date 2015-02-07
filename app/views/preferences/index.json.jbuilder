json.array!(@preferences) do |preference|
  json.extract! preference, :id, :name, :order, :enable
  json.url preference_url(preference, format: :json)
end
