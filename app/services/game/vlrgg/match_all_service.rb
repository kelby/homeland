module Game
  module Vlrgg
    class MatchAllService
      attr_accessor :id

      def initialize(data='')
        @id = data
      end

      def run
        ::Game::Vlrgg::MatchDetailService.new(id).run
        ::Game::Vlrgg::MatchPerformanceService.new(id).run
        ::Game::Vlrgg::MatchEconomyService.new(id).run
      end
    end
  end
end
