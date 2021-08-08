# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class PlayerStatsServiceJob < ApplicationJob
      def perform
        ::Game::Vlrgg::PlayerStatsService.new().run
      end
    end
  end
end
