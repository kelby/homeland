# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class TeamRankingsServiceJob < ApplicationJob
      def perform
        ::Game::Vlrgg::TeamRankingsService.new().run
      end
    end
  end
end
