# FantasyFootballNerd API

Elixir wrapper for the [Fantasy Football Nerd API](http://www.fantasyfootballnerd.com/fantasy-football-api)

## To Do

- [ ] Implement API Services
  - [x] NFL Teams
  - [x] NFL Schedule
  - [x] NFL Players
  - [x] Bye Weeks
  - [x] Weather Forecasts
  - [x] Auction Values
  - [x] Draft Rankings
  - [x] Draft Projections
  - [x] Weekly Rankings
  - [x] Weekly Projections
  - [x] Weekly IDP Rankings
  - [x] Injuries
  - [x] Depth Charts
  - [ ] NFL Picks
  - [x] Defense Rankings
  - [x] Game Day Inactives
  - [x] Player Stats & Info
    - [X] Videos
  - [ ] Daily Fantasy Football
- [ ] Check fail states for API Access levels
- [ ] Consider adding fields to %FFNerd.Player for Projections, Rankings, etc
- [ ] Update Readme with setup instructions
- [ ] Setup and trial using as a hex package
- [ ] Add additional "Examples of use" such as finding which teams are on a bye week, piping the team short code to get other information such as players, weather conditions, etc based on the team short code.

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
player.team           # "SEA"
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
FFNerd.AuctionValue.list(client)
# [%FFNerd.AuctionValue{...}, ...]

# PPR

FFNerd.AuctionValue.list(:ppr, client)
# [%FFNerd.AuctionValue{ppr: "1", ...}, ...]
```

Return a list of all auction value records by position.

```elixir
FFNerd.AuctionValue.list("QB", client)
# [%FFNerd.AuctionValue{position: "QB", ...}, ...]

# PPR

FFNerd.AuctionValue.list(:ppr, "QB", client)
# [%FFNerd.AuctionValue{ppr: "1", position: "QB", ...}, ...]
```

Return a single auction value record by person id.

```elixir
auction_values = FFNerd.AuctionValue.find(1, client)
# [%FFNerd.AuctionValue{player_id: "1", ...}, ...]

auction_values.avg_price     # "54"
auction_values.display_name  # "Julio Jones"
auction_values.max_price     # "60"
auction_values.min_price     # "48"
auction_values.player_id     # "1446"
auction_values.position      # "WR"
auction_values.ppr           # "0"
auction_values.team          # "ATL"

# PPR

auction_values = FFNerd.AuctionValue.find(:ppr, 1446, client)
# [%FFNerd.AuctionValue{ppr: "1", player_id: "1446", ...}, ...]

auction_values.ppr           # "1"
```

### Draft Ranking

Return a list of all draft ranking records.

```elixir
FFNerd.DraftRanking.list(client)
# [%FFNerd.DraftRanking{...}, ...]

# PPR

FFNerd.DraftRanking.list(:ppr, client)
# [%FFNerd.DraftRanking{ppr: "1", ...}, ...]
```

Return a list of all draft ranking records by position.

```elixir
FFNerd.DraftRanking.list("QB", client)
# [%FFNerd.DraftRanking{position: "QB", ...}, ...]

# PPR

FFNerd.DraftRanking.list(:ppr, "QB", client)
# [%FFNerd.DraftRanking{ppr: "1", position: "QB", ...}, ...]
```

Return a single draft ranking by person id.

```elixir
draft_rankings = FFNerd.DraftRanking.find(1, client)
# %FFNerd.DraftRanking{player_id: "1446"}

draft_rankings.bye_week       # "6"
draft_rankings.display_name   # "Julio Jones"
draft_rankings.fname          # "Julio"
draft_rankings.lname          # "Jones"
draft_rankings.nerd_rank      # "19.617"
draft_rankings.overall_rank   # "15"
draft_rankings.player_id      # "1446"
draft_rankings.position       # "WR"
draft_rankings.position_rank  # "6"
draft_rankings.ppr            # nil
draft_rankings.team           # "ATL"
# PPR

draft_rankings = FFNerd.DraftRanking.find(:ppr, 1446, client)
# %FFNerd.DraftRanking{ppr: "1", player_id: "1446"}

draft_rankings.ppr            # "1"
...
```

### Draft Projection

**NOTE:** Draft Projection functions require a position ("QB", "RB", "WR", "TE", "K", "DEF") argument to be passed in.
Because of this, there are no generic `list(client)` or `find(id, client)` functions for Draft Projection.

Return a list of all draft projection records by position.

```elixir
FFNerd.DraftProjection.list("QB", client)
# [%FFNerd.DraftProjection{position: "QB", ...}, ...]
```

Return a single draft projection record by person id and position.

```elixir
draft_projections = FFNerd.DraftProjection.find(1, "QB", client)
# %FFNerd.DraftProjection{player_id: "1847"}

draft_projections.def_fumbles_recovered  # nil
draft_projections.def_interceptions      # nil
draft_projections.def_return_tds         # nil
draft_projections.def_sacks              # nil
draft_projections.def_tds                # nil
draft_projections.display_name           # "Russell Wilson"
draft_projections.extra_points           # nil
draft_projections.fantasy_points         # "265"
draft_projections.field_goals            # nil
draft_projections.fumbles_lost           # nil
draft_projections.pass_attempts          # "439"
draft_projections.pass_completions       # "274"
draft_projections.pass_interceptions     # "10"
draft_projections.pass_tds               # "22"
draft_projections.pass_yards             # "3310"
draft_projections.player_id              # "1847"
draft_projections.rec_tds                # nil
draft_projections.rec_yards              # nil
draft_projections.receptions             # nil
draft_projections.rush_attempts          # nil
draft_projections.rush_tds               # "3"
draft_projections.rush_yards             # "474"
draft_projections.team                   # "SEA"
```

### Weekly Ranking

Return a list of all weekly ranking records.

```elixir
FFNerd.WeeklyRanking.list(client)
# [%FFNerd.WeeklyRanking{...}, ...]
```

Return a list of all weekly ranking records by position.

```elixir
FFNerd.WeeklyRanking.list("QB", client)
# [%FFNerd.WeeklyRanking{position: "QB", ...}, ...]
```

Return a single weekly ranking by person id.

```elixir
weekly_rankings = FFNerd.WeeklyRanking.find(1, client)
# %FFNerd.WeeklyRanking{player_id: "1446"}

weekly_rankings.game_status      # "Questionable"
weekly_rankings.injury           # "Knee"
weekly_rankings.last_update      # "2013-09-16"
weekly_rankings.name             # "Julio Jones"
weekly_rankings.player_id        # "1446"
weekly_rankings.position         # "WR"
weekly_rankings.ppr              # "19.60"
weekly_rankings.ppr_high         # "23.30"
weekly_rankings.ppr_low          # "16.00"
weekly_rankings.practice_status  # "Limited Participation in Practice"
weekly_rankings.standard         # "14.00"
weekly_rankings.standard_high    # "17.30"
weekly_rankings.standard_low     # "9.00"
weekly_rankings.team             # "ATL"
weekly_rankings.week             # "2"
```

### Weekly Projection

**NOTE:** Weekly Projection functions require a position ("QB", "RB", "WR", "TE", "K", "DEF") argument to be passed in.
Because of this, there are no generic `list(client)` or `find(id, client)` functions for Weekly Projection.

Return a list of all weekly projection records by position.

```elixir
FFNerd.Player.WeeklyProjection.list("QB", client)
# [%FFNerd.Player.WeeklyProjection{position: "QB", ...}, ...]
```

Return a single weekly projection by person id and position.

```elixir
weekly_projections = FFNerd.Player.WeeklyProjection.find(1, "QB", client)
# %FFNerd.Player.WeeklyProjection{player_id: "1847"}

weekly_projections.def_fumbles_forced     # "0.0"
weekly_projections.def_fumbles_recovered  # "0.0"
weekly_projections.def_interceptions      # "0.0"
weekly_projections.def_points_allowed     # "0.0"
weekly_projections.def_return_tds         # "0.0"
weekly_projections.def_sacks              # "0.0"
weekly_projections.def_safeties           # "0.0"
weekly_projections.def_tds                # "0.0"
weekly_projections.def_yards_allowed      # "0.0"
weekly_projections.display_name           # "Russell Wilson"
weekly_projections.extra_points           # "0.0"
weekly_projections.field_goals            # "0.0"
weekly_projections.field_goal_attempts    # "0.0"
weekly_projections.fumbles_lost           # "0.0"
weekly_projections.pass_attempts          # "26.0"
weekly_projections.pass_completions       # "17.0"
weekly_projections.pass_interceptions     # "1.0"
weekly_projections.pass_tds               # "2.0"
weekly_projections.pass_yards             # "202.0"
weekly_projections.player_id              # "1847"
weekly_projections.position               # "QB"
weekly_projections.rec_tds                # "0.0"
weekly_projections.rec_yards              # "0.0"
weekly_projections.receptions             # "0.0"
weekly_projections.rush_attempts          # "6.0"
weekly_projections.rush_tds               # "0.0"
weekly_projections.rush_yards             # "29.0"
weekly_projections.team                   # "SEA"
weekly_projections.week                   # "1"
```

### Weekly IDP Ranking

**NOTE:** Fantasy Football Nerd does not provide a `player_id` for IDP players
so there is no `find(id, client)` function.

Return a list of all weekly IDP ranking records.

```elixir
FFNerd.WeeklyIDPRanking.list(client)
# [%FFNerd.WeeklyIDPRanking{...}, ...]
```

Return a list of all weekly IDP ranking records by position.

```elixir
idp_rankings = FFNerd.WeeklyIDPRanking.list("DE", client) |> List.first
# [%FFNerd.WeeklyIDPRanking{position: "DE", ...}, ...]

idp_rankings.player    # "J.J. Watt"
idp_rankings.position  # "DE"
idp_rankings.rank      # "1"
idp_rankings.team      # "HOU"
```

### Player Stats

Return a single player's stats by player id.

```elixir
player_stats = FFNerd.Player.Stats.find(14, client)
# %{"2007" => %{"1" => %FFNerd.Player.Stats{player_id: "14", ...}, ...}, ...}

player_stats["2013"]["1"].pass_yards  # "357"
```

Return a single player's stats by player id and year.

```elixir
player_stats = FFNerd.Player.Stats.find(14, 2013, client)
# %{"1" => %FFNerd.Player.Stats{player_id: "14", ...}, ...}

player_stats["1"].pass_yards  # "357"
```

Return a single player's stats by player id, year, and week.

```elixir
player_stats = FFNerd.Player.Stats.find(14, 2013, 1, client)
# %FFNerd.Player.Stats{player_id: "14", ...}

player_stats.final_score         # "W23-17"
player_stats.fumbles             # "0"
player_stats.fumbles_lost        # "0"
player_stats.game_date           # "09/08"
player_stats.game_played         # "1"
player_stats.game_started        # "1"
player_stats.interceptions       # "1"
player_stats.opponent            # "ATL"
player_stats.pass_attempts       # "35"
player_stats.pass_completions    # "26"
player_stats.pass_percentage     # "74.30"
player_stats.pass_tds            # "2"
player_stats.pass_yards          # "357"
player_stats.pass_yards_average  # "10.20"
player_stats.player_id           # "14"
player_stats.qb_rating           # "113.60"
player_stats.receptions          # nil
player_stats.rec_tds             # nil
player_stats.rec_yards           # nil
player_stats.rec_yards_average   # nil
player_stats.rush_attempts       # "3"
player_stats.rush_tds            # "0"
player_stats.rush_yards          # "2"
player_stats.rush_yards_average  # "0.70"
player_stats.rush_yards_longest  # nil
player_stats.sack_yards          # "16"
player_stats.sacks               # "2"
player_stats.week                # "1"
player_stats.year                # "2013"
```

### Player Videos

Return a single player's videos by player id.

```elixir
videos = FFNerd.Player.Video(14, client)
# [%FFNerd.Player.Video{}, ...]

video = videos |> List.first

video.video_title  # "NFL Top 100 Players of 2012 : Drew Brees #2"
video.youtube_id   # "9cMvQ-uD4aI"
```



### Injuries

Return all injuries for current week.

```elixir
FFNerd.Injury.list(client)
# %{"ARI" => [%FFNerd.Injury{...}, ...], ...}
```

Return all injuries by week.

```elixir
FFNerd.Injury.list(17, client)
# %{"ARI" => [%FFNerd.Injury{week: "17", ...}, ...], ...}
```

Return team injuries for current week by team code.

```elixir
FFNerd.Injury.list("SEA", client)
# [%FFNerd.Injury{team: "SEA", ...}, ...]
```

Return team injuries by week and team code.

```elixir
FFNerd.Injury.list("SEA", 17, client)
# [%FFNerd.Injury{team: "SEA", week: "17", ...}, ...]
```

Return a single injury record for current week by player id and team code

```elixir
player_injuries = FFNerd.Injury.find(1465, "ARI", client)
# %FFNerd.Injury{player_id: "1465", team: "ARI", ...}

player_injuries.game_status         # "Out"
player_injuries.injury              # "Ankle"
player_injuries.last_update         # "2013-09-09"
player_injuries.notes               # "Missed Week 1 at St. Louis"
player_injuries.player_id           # "1465"
player_injuries.player_name         # "Rob Housler"
player_injuries.position            # "TE"
player_injuries.practice_status     # "Did not practice"
player_injuries.practice_status_id  # "1"
player_injuries.team                # "ARI"
player_injuries.week                # "1"
```

Return a single injury record for current week by player id, team code, and week

```elixir
FFNerd.Injury.find(1465, "ARI", 17, client)
# %FFNerd.Injury{player_id: "1465", team: "ARI", week: "17"...}
```

### Depth Charts

Return all depth charts.

```elixir
FFNerd.DepthChart.list(client)
# %{"SEA" => %FFNerd.DepthChart{qb: [%FFNerd.DepthChart.Player{player_name: "Russell Wilson"}, ...] ...}, ...}
```

Return one team's depth charts by team code.

```elixir
FFNerd.DepthChart.list("SEA", client)
# %FFNerd.DepthChart{qb: [%FFNerd.DepthChart.Player{player_name: "Russell Wilson"}, ...] ...}
```

Return one team's position depth charts by team code and position.

```elixir
FFNerd.DepthChart.list("SEA", "QB", client)
# [%FFNerd.DepthChart.Player{player_name: "Russell Wilson"}, ...]
```

Return depth chart player by team code, position, and depth.

```elixir
player = FFNerd.DepthChart.find("SEA", "WR1", 1, client)
# %FFNerd.DepthChart.Player{player_name: "Doug Baldwin"}

player.depth        # "1"
player.player_id    # "1549"
player.player_name  # "Doug Baldwin"
player.position     # "WR1"
player.team         # "SEA"
```

### Defense Ranking

Return all defense ranking records.

```elixir
FFNerd.DefenseRanking.list(client)
# [%FFNerd.DefenseRanking{team_name: "SEA"}, ...]
```

Return one defense ranking record by team code.

```elixir
defense = find("SEA" client)
# %FFNerd.DefenseRanking{team_name: "SEA"}

defense.pass_yards_per_game       = "173.8"
defense.pass_yards_per_game_rank_ = "1"
defense.points_per_game           = "14.8"
defense.points_per_game_rank      = "2"
defense.rush_yards_per_game       = "107.5"
defense.rush_yards_per_game_rank  = "12"
defense.team                      = "SEA"
defense.team_name                 = "Seattle Seahawks"
defense.total_yards_per_game      = "281.3"
defense.total_yards_per_game_rank = "1"
```

### Inactives

Return all inactive records for current week.

```elixir
FFNerd.Inactive.list(client)
# [%FFNerd.Inactive{display_name: "Andre Brown"}, ...]
```

Return all inactive records by week.

```elixir
FFNerd.Inactive.list(17, client)
# [%FFNerd.Inactive{display_name: "Adrian Peterson", week: "17"}, ...]
```

Return one inactive record for current week by player id.

```elixir
inactive = find(1465, client)
# %FFNerd.Inactive{display_name: "Rob Housler"}

inactive.display_name  # "Rob Housler"
inactive.player_id     # "1465"
inactive.position      # "TE"
inactive.team          # "ARI"
inactive.week          # "1"
inactive.year          # "2013"
```

Return one inactive record by player id and week.

```elixir
inactive = find(259, 17, client)
# %FFNerd.Inactive{player_id "259", week: "17"}
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

Thanks to these 2 projects for being sources of inspiration for creating my own
FFN API wrapper in Elixir:

[Fantasy Football Nerd API Ruby Gem](https://github.com/GregBaugues/fantasy_football_nerd/)

[Tentacat - Elixir Wrapper for Github API](https://github.com/edgurgel/tentacat)
