# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://vlrgg.com"

SitemapGenerator::Sitemap.create do
  # Rails.application.routes.url_helpers.root_path
  # app.oauth_introspect_path
  # Homeland::Wiki::Engine.routes.url_helpers.recent_pages_path
  # Homeland::Game::Engine.routes.url_helpers.recent_pages_path
  # Homeland::Note::Engine.routes.url_helpers.recent_pages_path

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #

  # Topic
  # add root_path, :priority => 0.9, :changefreq => 'daily'
  add popular_topics_path
  add last_topics_path
  add last_reply_topics_path
  add excellent_topics_path

  Topic.find_each do |item|
    add topic_path(item), :priority => 0.6
  end

  # Match
  add Homeland::Game::Engine.routes.url_helpers.matches_path, :priority => 0.9, :changefreq => 'daily'
  add Homeland::Game::Engine.routes.url_helpers.results_path, :priority => 0.9, :changefreq => 'daily'

  Match.find_each do |item|
    add Homeland::Game::Engine.routes.url_helpers.match_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.match_performance_index_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.match_economy_index_path(item), :lastmod => item.updated_at
  end

  # Event
  add Homeland::Game::Engine.routes.url_helpers.events_path, :priority => 0.9, :changefreq => 'daily'
  Event::REGION.each do |item|
    add Homeland::Game::Engine.routes.url_helpers.region_events_events_path(item)
  end

  Event.find_each do |item|
    add Homeland::Game::Engine.routes.url_helpers.event_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.event_matches_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.event_stats_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.event_agents_path(item), :lastmod => item.updated_at
  end

  # TeamRanking
  add Homeland::Game::Engine.routes.url_helpers.team_rankings_path, :priority => 0.9, :changefreq => 'daily'

  TeamRanking::REGION.each do |item|
    add Homeland::Game::Engine.routes.url_helpers.team_ranking_path(item)
  end

  # PlayerStat
  add Homeland::Game::Engine.routes.url_helpers.player_stats_path, :priority => 0.9, :changefreq => 'daily'

  # Team
  Team.find_each do |item|
    add Homeland::Game::Engine.routes.url_helpers.team_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.team_matches_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.team_stats_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.team_transactions_path(item), :lastmod => item.updated_at
  end

  # Player
  Player.find_each do |item|
    add Homeland::Game::Engine.routes.url_helpers.player_path(item), :lastmod => item.updated_at
    add Homeland::Game::Engine.routes.url_helpers.player_matches_path(item), :lastmod => item.updated_at
  end

  # Wiki
  add Homeland::Wiki::Engine.routes.url_helpers.pages_path, :priority => 0.7, :changefreq => 'daily'
  add Homeland::Wiki::Engine.routes.url_helpers.recent_pages_path, :priority => 0.7, :changefreq => 'daily'
  Page.find_each do |item|
    add Homeland::Wiki::Engine.routes.url_helpers.page_path(item), :lastmod => item.updated_at
  end

  # Other
  add Homeland::Wiki::Engine.routes.url_helpers.agents_path, :priority => 0.6
  add Homeland::Wiki::Engine.routes.url_helpers.weapons_path, :priority => 0.6
  add Homeland::Wiki::Engine.routes.url_helpers.maps_path, :priority => 0.6

  #
  # Add all articles:
  #
  # === Sub Nav ===
  # === List ===
  # Homeland::Wiki::Engine
  # recent_pages_path
  # pages_path
  # page_path

  # Homeland::Game::Engine
  # matches_path
  # results_path
  # events_path
  # match_performance_index_path
  # match_economy_index_path
  # match_path
  # region_events_events_path
  # event_matches_path
  # event_stats_path
  # event_agents_path
  # event_event_stage_path
  # event_path
  # event_map_team_agent_path
  # team_map_agent_path
  # team_rankings_path
  # team_ranking_path
  # rankings_path
  # ranking_path
  # team_stats_path
  # team_matches_path
  # team_transactions_path
  # teams_path
  # player_stats_path
  # stats_path
  # player_matches_path
  # players_path
  # player_path
  # agents_path
  # agent_path
  # weapons_path
  # weapon_path
  # maps_path
  # map_path
  # === Detail ===
end
