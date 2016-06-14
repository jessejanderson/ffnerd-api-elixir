# FantasyFootballNerd API

Elixir wrapper for the [Fantasy Football Nerd API](http://www.fantasyfootballnerd.com/fantasy-football-api)

## To Do

- [ ] Implement API Services
  - [X] NFL Teams
  - [X] NFL Schedule
  - [X] NFL Players
  - [X] Bye Weeks
  - [X] Weather Forecasts
  - [X] Auction Values
  - [X] Draft Rankings
  - [X] Draft Projections
  - [ ] Weekly Rankings
  - [ ] Weekly Projections
  - [ ] Weekly IDP Rankings
  - [ ] Injuries
  - [ ] Depth Charts
  - [ ] NFL Picks
  - [ ] Defensive Rankings
  - [ ] Game Day Inactives
  - [X] Player Stats & Info
    - [ ] Videos
  - [ ] Daily Fantasy Football
- [ ] Check fail states for API Access levels
- [ ] Update Readme with setup instructions
- [ ] Setup and trial using as a hex package
- [ ] Add additional "Examples of use" such as finding which teams are on a bye week, piping the team shortcode to get other information such as players, weather conditions, etc based on the team shortcode.

## Setup

Sign up for a FantasyFootballNerd.com account.

...

API Resources
=============

All resources require a client with an API key
which can be created with `FFNerd.Client.new("API-KEY")`.
Documentation below assumes the `client` variable
is a valid `%FFNerd.Client{}` struct.

All modules use `.find` functions to find an individual struct,
and `.list` functions to find a list of structs.
Structs have atom keys
and can utilize dot syntax for easily calling data (examples below).

### Teams

Return a list of all team records.
```elixir
FFNerd.Team.list(client)
# [%FFNerd.Team{...}, ...]
```

Return a single team record by team code.
```elixir
team = FFNerd.Team.find("SEA", client)
# %FFNerd.Team{...}

team.code         # "SEA"
team.full_name    # "Seattle Seahawks"
team.short_name   # "Seahawks"
```

### Schedule

Return the associated current week.
```elixir
FFNerd.Schedule.current_week(client)
# "1"
```

Return a list of all game records.
```elixir
FFNerd.Schedule.list(client)
# [%FFNerd.Game{...}, ...]
```

Return a list of game records by team code.
```elixir
FFNerd.Schedule.list("SEA", client)
# [%FFNerd.Game{home_team: "SEA", ...}, ...]
```

Return a single game record by game id.
```elixir
game = FFNerd.Schedule.find(1, client)
# %FFNerd.Game{...}

game.game_id        # "1"
game.game_week      # "1"
game.game_date      # "2013-09-05"
game.away_team      # "BAL"
game.home_team      # "DEN"
game.game_time_et   # "8:30 PM"
game.tv_station     # "NBC"
```

### Players

Return a list of all player records.
```elixir
FFNerd.Player.list(client)
# [%FFNerd.Player{...}, ...]
```

Return a list of player records by position code.
```elixir
FFNerd.Player.list("QB", client)
# [%FFNerd.Player{position: "QB", ...}, ...]
```

Return a single player record by player id.
```elixir
player = FFNerd.Player.find(1, client)
# %FFNerd.Player{...}

player.active         # "1"
player.college        # "Wisconsin"
player.display_name   # "Russell Wilson"
player.dob            # "1988-11-29"
player.fname          # "Russell"
player.height         # "5-11"
player.jersey         # "3"
player.lname          # "Wilson"
player.player_id      # "1847"
player.position       # "QB"
player.star           # "1"
player.team           # "SEA"
player.twitter_id     # "DangeRussWilson"
player.weight         # "206"
```

### Bye Weeks

Return a list of all bye week records.
```elixir
FFNerd.ByeWeek.list(client)
# [%FFNerd.ByeWeek{...}, ...]
```

Return a list of bye week records by week number.
```elixir
FFNerd.ByeWeek.list(4, client)
# [%FFNerd.ByeWeek{bye_week: "4", ...}, ...]
```

Return a single bye week record by team code.
```elixir
bye_week = FFNerd.ByeWeek.find("SEA", client)
# %FFNerd.ByeWeek{...}

bye_week.bye_week       # "12"
bye_week.display_name   # "Seattle Seahawks"
bye_week.team           # "SEA
```

### Weather Forecasts

Return the associated current date.
```elixir
FFNerd.Weather.current_date(client)
# "2014-09-02"
```

Return the associated current week.
```elixir
FFNerd.Weather.current_week(client)
# "1"
```

Return a list of all weather forecast records.
```elixir
FFNerd.Weather.list(client)
# [%FFNerd.Weather{...}, ...]
```

Return a single weather forecast record by team code **OR** game id.
```elixir
forecast = FFNerd.Weather.find("SEA", client)
# %FFNerd.Weather{home_team: "SEA", ...}

forecast = FFNerd.Weather.find(1, client)
# %FFNerd.Weather{game_id: "1", ...}

forecast.away_team      # "DEN"
forecast.dome_img       # ""
forecast.forecast       # "Sunny"
forecast.game_date      # "2014-02-02"
forecast.game_id        # "1"
forecast.game_time_et   # nil
forecast.game_week      # "1"
forecast.geo_lat        # "40.813611"
forecast.geo_long       # "-74.074444"
forecast.high           # "51"
forecast.home_team      # "SEA"
forecast.is_dome        # "0"
forecast.large_img      # "http://www.fantasyfootballnerd.com/images/weather/52/32.gif"
forecast.low            # "36"
forecast.medium_img     # "http://www.fantasyfootballnerd.com/images/weather/31/32.gif"
forecast.small_img      # "http://www.fantasyfootballnerd.com/images/weather/20/32.gif"
forecast.stadium        # "MetLife Stadium"
forecast.tv_station     # "FOX"
forecast.wind_chill     # "0"
forecast.wind_speed     # "0"
```

### Auction Values

Return a list of all auction value records.
```elixir
FFNerd.Player.AuctionValue.list(client)
# [%FFNerd.Player.AuctionValue{...}, ...]

# PPR

FFNerd.Player.AuctionValue.list(:ppr, client)
# [%FFNerd.Player.AuctionValue{ppr: "1", ...}, ...]
```

Return a list of all auction value records by position.
```elixir
FFNerd.Player.AuctionValue.list("QB", client)
# [%FFNerd.Player.AuctionValue{position: "QB", ...}, ...]

# PPR

FFNerd.Player.AuctionValue.list(:ppr, "QB", client)
# [%FFNerd.Player.AuctionValue{ppr: "1", position: "QB", ...}, ...]
```

Return a single auction value record by person id.
```elixir
auction_values = FFNerd.Player.AuctionValue.find(1, client)
# [%FFNerd.Player.AuctionValue{player_id: "1", ...}, ...]

auction_values.avg_price     # "54"
auction_values.display_name  # "julio jones"
auction_values.max_price     # "60"
auction_values.min_price     # "48"
auction_values.player_id     # "1446"
auction_values.position      # "wr"
auction_values.ppr           # "0"
auction_values.team          # "atl"

# PPR

auction_values = FFNerd.Player.AuctionValue.find(:ppr, 1446, client)
# [%FFNerd.Player.AuctionValue{ppr: "1", player_id: "1446", ...}, ...]

auction_values.ppr           # "1"
```

### Draft Ranking

Return a list of all draft ranking records.
```elixir
FFNerd.Player.DraftRanking.list(client)
# [%FFNerd.Player.DraftRanking{...}, ...]

# PPR

FFNerd.Player.DraftRanking.list(:ppr, client)
# [%FFNerd.Player.DraftRanking{ppr: "1", ...}, ...]
```

Return a list of all draft ranking records by position.
```elixir
FFNerd.Player.DraftRanking.list("QB", client)
# [%FFNerd.Player.DraftRanking{position: "QB", ...}, ...]

# PPR

FFNerd.Player.DraftRanking.list(:ppr, "QB", client)
# [%FFNerd.Player.DraftRanking{ppr: "1", position: "QB", ...}, ...]
```

Return a single draft ranking by person id.
```elixir
draft_rankings = FFNerd.Player.DraftRanking.find(1, client)
# %FFNerd.Player.DraftRanking{player_id: "1446"}

draft_rankings.avg_price     # "54"
draft_rankings.display_name  # "Julio Jones"
draft_rankings.max_price     # "60"
draft_rankings.min_price     # "48"
draft_rankings.player_id     # "1446"
draft_rankings.position      # "WR"
draft_rankings.ppr           # "0"
draft_rankings.team          # "ATL"

# PPR

draft_rankings = FFNerd.Player.DraftRanking.find(:ppr, 1446, client)
# %FFNerd.Player.DraftRanking{ppr: "1", player_id: "1446"}

draft_rankings.ppr           # "1"
...
```

### Draft Projection

**NOTE:** Draft Projection functions require a position ("QB", "RB", "WR", "TE", "K", "DEF") argument to be passed in.
Because of this, there are no generic `list(client)` or `find(id, client)` functions for Draft Projection.

Return a list of all draft projection records by position.
```elixir
FFNerd.Player.DraftProjection.list("QB", client)
# [%FFNerd.Player.DraftProjection{position: "QB", ...}, ...]
```

Return a single draft projection by person id and position.
```elixir
draft_projections = FFNerd.Player.DraftProjection.find(1, "QB", client)
# %FFNerd.Player.DraftProjection{player_id: "1847"}

draft_projections.attempts        # "439"
draft_projections.completions     # "274"
draft_projections.display_name    # "Russell Wilson"
draft_projections.fantasy_points  # "265"
draft_projections.passing_int     # "10"
draft_projections.passing_td      # "22"
draft_projections.passing_yards   # "3310"
draft_projections.player_id       # "1847"
draft_projections.rush_td         # "3"
draft_projections.rush_yards      # "474"
draft_projections.team            # "SEA"
...
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add ffnerd to your list of dependencies in `mix.exs`:

        def deps do
          [{:ffnerd, "~> 0.0.1"}]
        end

  2. Ensure ffnerd is started before your application:

        def application do
          [applications: [:ffnerd]]
        end

## Thanks

Thanks to these 2 projects for being sources of inspiration for creating my own FFN API wrapper in Elixir:

[Fantasy Football Nerd API Ruby Gem](https://github.com/GregBaugues/fantasy_football_nerd/)

[Tentacat - Elixir Wrapper for Github API](https://github.com/edgurgel/tentacat)
