# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_18_030250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", id: :serial, force: :cascade do |t|
    t.string "action_type", null: false
    t.string "action_option"
    t.string "target_type"
    t.integer "target_id"
    t.string "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_type", "target_id", "action_type"], name: "index_actions_on_target_type_and_target_id_and_action_type"
    t.index ["user_type", "user_id", "action_type"], name: "index_actions_on_user_type_and_user_id_and_action_type"
  end

  create_table "agent_abilities", force: :cascade do |t|
    t.integer "agent_id"
    t.string "name"
    t.string "names", default: [], array: true
    t.string "key"
    t.string "cost"
    t.string "keybind"
    t.string "description"
    t.string "slot"
    t.string "icon"
    t.integer "charges_count"
    t.integer "seq_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agent_stats", force: :cascade do |t|
    t.integer "agent_id"
    t.bigint "kills"
    t.bigint "deaths"
    t.bigint "assists"
    t.bigint "score"
    t.bigint "wins"
    t.bigint "first_bloods"
    t.bigint "first_deaths"
    t.bigint "last_kills"
    t.bigint "rounds_played"
    t.bigint "matches_played"
    t.bigint "grenade_casts"
    t.bigint "ability1_casts"
    t.bigint "ability2_casts"
    t.bigint "ultimate_casts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authorizations", id: :serial, force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", limit: 1000, null: false
    t.integer "user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id", null: false
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "devices", id: :serial, force: :cascade do |t|
    t.integer "platform", null: false
    t.integer "user_id", null: false
    t.string "token", null: false
    t.datetime "last_actived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "economies", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.text "team1"
    t.text "team2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "economy_details", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.text "team1"
    t.text "team2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_brackets", force: :cascade do |t|
    t.string "title"
    t.integer "event_id"
    t.integer "event_stage_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_map_stats", force: :cascade do |t|
    t.integer "event_id"
    t.integer "map_id"
    t.integer "counter"
    t.string "atk_win"
    t.string "def_win"
    t.string "breach"
    t.string "brimstone"
    t.string "cypher"
    t.string "jett"
    t.string "omen"
    t.string "phoenix"
    t.string "raze"
    t.string "sage"
    t.string "sova"
    t.string "viper"
    t.string "reyna"
    t.string "killjoy"
    t.string "skye"
    t.string "yoru"
    t.string "astra"
    t.string "kayo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_map_team_agents", force: :cascade do |t|
    t.integer "event_id"
    t.integer "map_id"
    t.integer "team_id"
    t.string "team_pickes"
    t.text "matches"
    t.string "matches_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_parts", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_stage_id"
    t.integer "event_bracket_id"
    t.integer "container_no"
    t.integer "col_no"
    t.integer "seq_no"
    t.string "title"
    t.text "data_html"
    t.string "title_html"
    t.string "matches_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_player_stats", force: :cascade do |t|
    t.integer "event_id"
    t.integer "player_id"
    t.string "agents_ids", default: [], array: true
    t.string "agents_note"
    t.string "rnd"
    t.string "acs"
    t.string "kd"
    t.string "adr"
    t.string "kpr"
    t.string "apr"
    t.string "fkpr"
    t.string "fdpr"
    t.string "hs_persent"
    t.string "cl_persent"
    t.string "cl"
    t.string "kmax"
    t.integer "kmax_match_id"
    t.string "k"
    t.string "d"
    t.string "a"
    t.string "fk"
    t.string "fd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_stages", force: :cascade do |t|
    t.integer "event_id"
    t.string "title"
    t.string "title_abbr"
    t.string "dates"
    t.integer "seq_no"
    t.string "date_start"
    t.string "date_end"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "status"
    t.string "prize"
    t.string "prize_pool"
    t.string "dates"
    t.string "date_start"
    t.string "date_end"
    t.string "region"
    t.string "addr_flag"
    t.string "logo"
    t.string "tournament_code"
    t.integer "current_stage_id"
    t.string "note"
    t.string "intro"
    t.text "about"
    t.boolean "show_stages", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exception_tracks", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "team_id"
    t.integer "team_group_id"
    t.string "w"
    t.string "l"
    t.string "t"
    t.string "pct"
    t.string "rf_ra"
    t.string "rd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "head_to_heads", force: :cascade do |t|
    t.integer "match_id"
    t.string "matches_ids", default: [], array: true
    t.text "datas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "users_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "map_stats", force: :cascade do |t|
    t.integer "map_id"
    t.bigint "matches_played"
    t.bigint "rounds_played"
    t.bigint "attacking_rounds_won"
    t.bigint "defending_rounds_won"
    t.bigint "successful_plants_a"
    t.bigint "successful_plants_b"
    t.bigint "successful_defuses_a"
    t.bigint "successful_defuses_b"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_bps", force: :cascade do |t|
    t.integer "match_id"
    t.string "datas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_econs", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.string "team1"
    t.string "team2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_game_agents", force: :cascade do |t|
    t.integer "event_id"
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "map_id"
    t.string "team1_agents"
    t.string "team2_agents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_game_stats", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "game_no"
    t.text "team1"
    t.text "team2"
    t.text "map"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_games", force: :cascade do |t|
    t.string "name"
    t.integer "game_no"
    t.integer "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_past_matches", force: :cascade do |t|
    t.integer "match_id"
    t.text "team1"
    t.text "team2"
    t.string "team1_matches_ids", default: [], array: true
    t.string "team2_matches_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_players", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.string "team1_players_ids", default: [], array: true
    t.string "team2_players_ids", default: [], array: true
    t.string "team1_players_names", default: [], array: true
    t.string "team2_players_names", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_players_stats", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "game_no"
    t.text "team1"
    t.text "team2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_rounds_stats", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.text "team1"
    t.text "team2"
    t.text "rounds"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.datetime "datetime"
    t.string "status"
    t.string "status_note"
    t.integer "event_id"
    t.integer "event_stage_id"
    t.string "stage"
    t.string "part"
    t.integer "bo"
    t.integer "team1_id"
    t.integer "team2_id"
    t.text "team1"
    t.text "team2"
    t.string "team1_players_ids", default: [], array: true
    t.string "team2_players_ids", default: [], array: true
    t.string "team1_players_names", default: [], array: true
    t.string "team2_players_names", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nodes", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "summary"
    t.integer "sort", default: 0, null: false
    t.integer "topics_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["sort"], name: "index_nodes_on_sort"
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.integer "user_id", null: false
    t.integer "word_count", default: 0, null: false
    t.integer "changes_count", default: 0, null: false
    t.boolean "publish", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.integer "target_id"
    t.string "second_target_type"
    t.integer "second_target_id"
    t.string "third_target_type"
    t.integer "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "oauth_access_grants", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id", null: false
    t.integer "application_id", null: false
    t.string "token", null: false
    t.bigint "expires_in"
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", id: :serial, force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.bigint "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "owner_id"
    t.string "owner_type"
    t.integer "level", default: 0, null: false
    t.boolean "confidential", default: true, null: false
    t.index ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type"
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "page_versions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "page_id", null: false
    t.integer "version", default: 0, null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.text "desc", null: false
    t.text "body", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page_id"], name: "index_page_versions_on_page_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "locked", default: false
    t.integer "version", default: 0, null: false
    t.integer "editor_ids", default: [], null: false, array: true
    t.integer "word_count", default: 0, null: false
    t.integer "changes_cout", default: 1, null: false
    t.integer "comments_count", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "participating_teams", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_stage_id"
    t.string "teams_ids", default: [], array: true
    t.string "notes", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patches", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photos", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "image", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "player_adv_stats", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.integer "team_id"
    t.integer "player_id"
    t.string "agent"
    t.string "adv_2k"
    t.string "adv_3k"
    t.string "adv_4k"
    t.string "adv_5k"
    t.string "adv_1v1"
    t.string "adv_1v2"
    t.string "adv_1v3"
    t.string "adv_1v4"
    t.string "adv_1v5"
    t.string "econ"
    t.string "pl"
    t.string "de"
    t.text "more"
    t.integer "seq_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_agent_stats", force: :cascade do |t|
    t.integer "player_id"
    t.integer "agent_id"
    t.string "usage"
    t.string "rnd"
    t.string "acs"
    t.string "kd"
    t.string "adr"
    t.string "kpr"
    t.string "apr"
    t.string "fkpr"
    t.string "fdpr"
    t.string "k"
    t.string "d"
    t.string "a"
    t.string "fk"
    t.string "fd"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_history_matches", force: :cascade do |t|
    t.integer "player_id"
    t.integer "match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_kills_stats", force: :cascade do |t|
    t.integer "match_id"
    t.integer "match_game_id"
    t.string "team1"
    t.string "team2"
    t.string "all_kills"
    t.string "first_kills"
    t.string "op_kills"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer "player_id"
    t.string "agents_ids", default: [], array: true
    t.string "agents_note"
    t.string "rnd"
    t.string "acs"
    t.string "kd"
    t.string "adr"
    t.string "kpr"
    t.string "apr"
    t.string "fkpr"
    t.string "fdpr"
    t.string "hs_persent"
    t.string "cl_persent"
    t.string "cl"
    t.string "kmax"
    t.integer "kmax_match_id"
    t.string "k"
    t.string "d"
    t.string "a"
    t.string "fk"
    t.string "fd"
    t.string "team_abbr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_teams", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.string "joined_in"
    t.string "left_in"
    t.integer "seq"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "role"
    t.string "name"
    t.string "real_name"
    t.string "alias_name"
    t.string "addr"
    t.string "addr_flag"
    t.string "avatar"
    t.string "total_winnings"
    t.text "socials"
    t.string "aliases_name"
    t.string "current_teams_ids", default: [], array: true
    t.string "past_teams_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prize_distributions", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_stage_id"
    t.string "place"
    t.string "prize"
    t.string "teams_ids", default: [], array: true
    t.string "circuit_points"
    t.string "note"
    t.integer "seq_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.jsonb "contacts", default: {}, null: false
    t.jsonb "rewards", default: {}, null: false
    t.jsonb "preferences", default: {}, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "rating_histories", force: :cascade do |t|
    t.integer "team_id"
    t.string "rank"
    t.string "region"
    t.string "rating"
    t.string "peak"
    t.string "streak"
    t.string "streak_type"
    t.string "best"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replies", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "topic_id", null: false
    t.text "body", null: false
    t.integer "state", default: 1, null: false
    t.integer "likes_count", default: 0
    t.integer "mentioned_user_ids", default: [], array: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "action"
    t.string "target_type"
    t.string "target_id"
    t.integer "reply_to_id"
    t.index ["deleted_at"], name: "index_replies_on_deleted_at"
    t.index ["topic_id"], name: "index_replies_on_topic_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "search_documents", force: :cascade do |t|
    t.string "searchable_type", limit: 32, null: false
    t.integer "searchable_id", null: false
    t.tsvector "tokens"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_search_documents_on_searchable_type_and_searchable_id", unique: true
    t.index ["tokens"], name: "index_search_documents_on_tokens", using: :gin
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "sourceable_id"
    t.string "sourceable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stage_series", force: :cascade do |t|
    t.integer "event_id"
    t.string "dates"
    t.string "title"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_groups", force: :cascade do |t|
    t.string "name"
    t.integer "team_id"
    t.integer "event_id"
    t.integer "event_stage_id"
    t.string "teams_ids", default: [], array: true
    t.string "matches_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_map_agents", force: :cascade do |t|
    t.integer "team_id"
    t.integer "map_id"
    t.string "agent_slugs"
    t.string "matches_ids", default: [], array: true
    t.string "match_game_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_map_stats", force: :cascade do |t|
    t.integer "team_id"
    t.integer "map_id"
    t.string "win"
    t.string "w"
    t.string "l"
    t.string "atk_1st"
    t.string "def_1st"
    t.string "atk_rwin"
    t.string "atk_rw"
    t.string "atk_rl"
    t.string "def_rwin"
    t.string "def_rw"
    t.string "def_rl"
    t.integer "counter"
    t.text "agent_compositions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_rankings", force: :cascade do |t|
    t.integer "team_id"
    t.string "rank"
    t.string "region"
    t.string "streak"
    t.string "rating"
    t.string "shift"
    t.string "scoring"
    t.string "earnings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_users", id: :serial, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
    t.integer "role"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "alias_name"
    t.string "abbr"
    t.string "region"
    t.string "region_flag"
    t.string "addr"
    t.string "addr_flag"
    t.string "logo"
    t.string "note"
    t.string "total_winnings"
    t.text "socials"
    t.integer "previously_team_id"
    t.integer "currently_team_id"
    t.string "current_rosters", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "node_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.integer "last_reply_id"
    t.integer "last_reply_user_id"
    t.string "last_reply_user_login"
    t.string "who_deleted"
    t.integer "last_active_mark"
    t.boolean "lock_node", default: false
    t.datetime "suggested_at"
    t.integer "grade", default: 0
    t.datetime "replied_at"
    t.integer "replies_count", default: 0, null: false
    t.integer "likes_count", default: 0
    t.integer "mentioned_user_ids", default: [], array: true
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "closed_at"
    t.integer "team_id"
    t.index ["deleted_at"], name: "index_topics_on_deleted_at"
    t.index ["grade"], name: "index_topics_on_grade"
    t.index ["last_active_mark"], name: "index_topics_on_last_active_mark"
    t.index ["last_reply_id"], name: "index_topics_on_last_reply_id"
    t.index ["likes_count"], name: "index_topics_on_likes_count"
    t.index ["node_id", "deleted_at"], name: "index_topics_on_node_id_and_deleted_at"
    t.index ["suggested_at"], name: "index_topics_on_suggested_at"
    t.index ["team_id"], name: "index_topics_on_team_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.string "date"
    t.integer "from_team_id"
    t.integer "to_team_id"
    t.string "action"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_ssos", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "uid", null: false
    t.string "username"
    t.string "email"
    t.string "name"
    t.string "avatar_url"
    t.text "last_payload", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_user_ssos_on_uid", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login", limit: 100, null: false
    t.string "name", limit: 100
    t.string "email", null: false
    t.string "email_md5", null: false
    t.boolean "email_public", default: false, null: false
    t.string "location"
    t.integer "location_id"
    t.string "bio"
    t.string "website"
    t.string "company"
    t.string "github"
    t.string "twitter"
    t.string "avatar"
    t.integer "state", default: 1, null: false
    t.string "tagline"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "password_salt", default: "", null: false
    t.string "persistence_token", default: "", null: false
    t.string "single_access_token", default: "", null: false
    t.string "perishable_token", default: "", null: false
    t.integer "topics_count", default: 0, null: false
    t.integer "replies_count", default: 0, null: false
    t.string "type", limit: 20
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.integer "team_users_count"
    t.integer "followers_count", default: 0
    t.integer "following_count", default: 0
    t.index "lower((login)::text) varchar_pattern_ops", name: "index_users_on_lower_login_varchar_pattern_ops"
    t.index "lower((name)::text) varchar_pattern_ops", name: "index_users_on_lower_name_varchar_pattern_ops"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location"], name: "index_users_on_location"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "weapon_details", force: :cascade do |t|
    t.integer "weapon_id"
    t.decimal "fire_rate", precision: 10, scale: 2
    t.integer "magazine_size"
    t.decimal "run_speed_multiplier", precision: 10, scale: 2
    t.decimal "equip_time_seconds", precision: 10, scale: 2
    t.decimal "reload_time_seconds", precision: 10, scale: 2
    t.decimal "first_bullet_accuracy", precision: 10, scale: 2
    t.integer "shotgun_pellet_count"
    t.string "fire_mode"
    t.string "ads_stats"
    t.string "alt_shotgun_stats"
    t.string "air_burst_stats"
    t.string "damage_ranges"
    t.text "shop_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weapon_skins", force: :cascade do |t|
    t.integer "weapon_id"
    t.string "code"
    t.string "name"
    t.string "icon"
    t.text "chromas"
    t.text "levels"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weapon_stats", force: :cascade do |t|
    t.integer "weapon_id"
    t.bigint "kills"
    t.bigint "alt_kills"
    t.bigint "kill_distance"
    t.bigint "damage"
    t.bigint "damage_instances"
    t.bigint "matches_played"
    t.bigint "first_bloods"
    t.bigint "last_kills"
    t.bigint "headshots"
    t.bigint "bodyshots"
    t.bigint "legshots"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo"
    t.string "code"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
