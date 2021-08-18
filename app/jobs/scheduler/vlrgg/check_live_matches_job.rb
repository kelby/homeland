# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class CheckLiveMatchesJob < ApplicationJob
      def perform
        datetime = Time.now.in_time_zone("Eastern Time (US & Canada)").strftime("%F %R")
        ids = Match.where("datetime < ?", datetime).valid.where(status: ['upcoming', "TBD"]).ids

        ids.map do |id|
          match = ::Game::Vlrgg::MatchDetailService.new(id).run
          live_status = if match.present? && match.respond_to?(:status)
            match.status == "live"
          end

          if live_status
            ::Game::Vlrgg::MatchPerformanceService.new(id).run
            ::Game::Vlrgg::MatchEconomyService.new(id).run
          end
        end
      end
    end
  end
end
