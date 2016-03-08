json.array!(@recipes) do |recipe|
  json.(recipe, :url, :updated_at, :hostname)

end
