json.array!(@games) do |game|
  json.extract! game, :id, :home_team, :away_team, :location, :week, :time
  json.url game_url(game, format: :json)
end
