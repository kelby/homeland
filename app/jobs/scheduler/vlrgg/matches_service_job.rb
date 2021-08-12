# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class MatchesServiceJob < ApplicationJob
      def perform
        id_and_id_previously_changed = ::Game::Vlrgg::MatchesService.new().run

        id_and_id_previously_changed.flatten.map do |entry|
          if entry[:id_previously_changed] || entry[:status_previously_changed]
            id = entry[:id]
            ::Game::Vlrgg::MatchDetailService.new(id).run
            ::Game::Vlrgg::MatchPerformanceService.new(id).run
            ::Game::Vlrgg::MatchEconomyService.new(id).run
          end
        end
      end
    end
  end
end
