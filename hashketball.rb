# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black','White'],
      players: {
        'Alan Anderson' => {
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
        },
        'Reggie Evans' => {
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7
        },
        'Brook Lopez' => {
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15
        },
        'Mason Plumlee' => {
          number:1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
        },
        'Jason Terry' => {
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
        },
        'Bismak Biyombo' => {
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10
        },
        'DeSagna Diop' => {
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team, info|
    if game_hash[team][:players][name]
      return game_hash[team][:players][name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, info|
    if game_hash[team][:players][name]
      return game_hash[team][:players][name][:shoe]
    end
  end
end

def team_colors(name_team)
  game_hash.each do |team, info|
    if info[:team_name] ==name_team #game_hash[team]
      return info[:colors] #game_hash[team]
    end
  end
end

def team_names
  names = []
  game_hash.each do |team, info|
    names << game_hash[team][:team_name]
  end
  return names
end

def player_numbers(name_team)
  numbers = []
  game_hash.each do |team, info|
    if game_hash[team][:team_name] ==name_team
      game_hash[team][:players].each do |player, stats|
       numbers << game_hash[team][:players][player][:number]
     end
    end
  end
  return numbers
end

def player_stats(name)
  game_hash.each do |team, info|
    if game_hash[team][:players][name]
      return game_hash[team][:players][name]
    end
  end
end

def big_shoe_rebounds
  max = nil
  rebound = nil
  game_hash.each do |team, info|
    game_hash[team][:players].each do |player, stats|
      size = game_hash[team][:players][player][:shoe]
      if max == nil || max < size
        max = game_hash[team][:players][player][:shoe]
        rebound = game_hash[team][:players][player][:rebounds]
      end
    end
  end
  return rebound
end

def most_points_scored
  max = nil
  best_player = nil
  game_hash.each do |team, info|
    info[:players].each do |name,stats|
      if max == nil || stats[:points] > max
        max = stats[:points]
        best_player = name
      end
    end
  end
  best_player
end

def winning_team
  away = get_team_score(:away)
  home = get_team_score(:home)

  if away > home
    return game_hash[:away][:team_name]
  else
    return game_hash[:home][:team_name]
  end

end

def get_team_score (team_side)
  total_points = 0

  game_hash[team_side][:players].each do |name, stat|
    total_points += stat[:points]
  end
  total_points
end

def player_with_longest_name
  game_hash.map do |side, info|
    info[:players].keys.max do |a,b|
      a.length <=> b.length
    end
  end.max
end

def long_name_steals_a_ton?
name = player_with_longest_name
game_hash.each do |side, info|
  if info[:players][name] != nil
    return info[:players][name][:steals] > 20
    end
  end
end
