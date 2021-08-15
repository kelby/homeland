# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class TeamServiceJob < ApplicationJob
      def perform
        ids = Team.where(addr_flag: nil, abbr: nil, note:nil, current_rosters: []).ids

        ids.map do |id|
          ::Game::Vlrgg::TeamDetailService.new(id).run
          ::Game::Vlrgg::TeamStatsService.new(id).run
          ::Game::Vlrgg::TeamTransfersService.new(id).run
        end

        teams = Team.where(addr_flag: nil, abbr: nil, note:nil, current_rosters: [])
        teams.map do |team|
          team.delete if ids.include?(team.id)
        end
      end
    end
  end
end
