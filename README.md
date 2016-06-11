# FantasyFootballNerd API

Elixir wrapper for the [Fantasy Football Nerd API](http://www.fantasyfootballnerd.com/fantasy-football-api)

## To Do

- [X] Add module docs
- [X] Add function docs
- [ ] Implement API Services
  - [X] NFL Teams
  - [X] NFL Schedule
  - [X] NFL Players
  - [X] Bye Weeks
  - [X] Weather Forecasts
  - [ ] Auction Values
  - [ ] Draft Rankings
  - [ ] Draft Projections
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
- [X] Update Readme with feature/usage instructions
- [ ] Setup and trial using as a hex package
- [ ] Add "Thanks" links to FFN Ruby Gem and Tentacat
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
teams = FFNerd.Team.list(client)
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
schedule = FFNerd.Schedule.list(client)
# [%FFNerd.Game{...}, ...]
```

Return a list of game records by team code.
```elixir
schedule = FFNerd.Schedule.list("SEA", client)
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
players = FFNerd.Player.list(client)
# [%FFNerd.Player{...}, ...]
```

Return a list of player records by position code.
```elixir
players = FFNerd.Player.list("QB", client)
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
bye_weeks = FFNerd.ByeWeek.list(client)
# [%FFNerd.ByeWeek{...}, ...]
```

Return a list of bye week records by week number.
```elixir
bye_weeks = FFNerd.ByeWeek.list(4, client)
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
teams = FFNerd.Weather.list(client)
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
