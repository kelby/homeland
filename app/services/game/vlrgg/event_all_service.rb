module Game
  module Vlrgg
    class EventAllService
      attr_accessor :id

      def initialize(data='')
        @id = data
      end

      def run
        ::Game::Vlrgg::EventMatchesService.new(id).run
        ::Game::Vlrgg::EventDetailService.new(id).run
        ::Game::Vlrgg::EventDetailByStageService.new(id).run
        ::Game::Vlrgg::EventStatsService.new(id).run
        ::Game::Vlrgg::EventAgentsService.new(id).run
      end
    end
  end
end
