json.array!(@viewers) do |viewer|
  json.extract! viewer, :id, :zone_id
  json.url viewer_url(viewer, format: :json)
end
