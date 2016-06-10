# FantasyFootballNerd API

Elixir wrapper for the [Fantasy Football Nerd API](http://www.fantasyfootballnerd.com/fantasy-football-api)

## To Do

- [ ] Add module docs
- [X] Add function docs
- [ ] Implement API Services
  - [X] NFL Teams
  - [X] NFL Schedule
  - [X] NFL Players
  - [X] Bye Weeks
  - [ ] Weather Forecasts
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
- [ ] Update Readme with setup instructions
- [ ] Update Readme with feature/usage instructions
- [ ] Setup and trial using as a hex package
- [ ] Add "Thanks" links to FFN Ruby Gem and Tentacat

## Setup

Sign up for a FantasyFootballNerd.com account.

...

## Features

Nothing to see here, yet. :)

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
