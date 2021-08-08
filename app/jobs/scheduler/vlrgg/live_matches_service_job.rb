# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class LiveMatchesServiceJob < ApplicationJob
      def perform
        ids = Match.where(date: DateTime.now).where(status: "live").ids

        ids.map do |id|
          ::Game::Vlrgg::MatchDetailService.new(id).run
          ::Game::Vlrgg::MatchPerformanceService.new(id).run
          ::Game::Vlrgg::MatchEconomyService.new(id).run
        end
      end
    end
  end
end
