# frozen_string_literal: true

module Scheduler
  module Vlrgg
    class EventsServiceJob < ApplicationJob
      def perform
        ::Game::Vlrgg::EventsByRegionService.new().run
      end
    end
  end
end
