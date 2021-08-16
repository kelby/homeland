module Game
  module Vlrgg
    class TeamAllService
      attr_accessor :id

      def initialize(data='')
        @id = data
      end

      def run
        ::Game::Vlrgg::TeamDetailService.new(id).run
        ::Game::Vlrgg::TeamStatsService.new(id).run
        ::Game::Vlrgg::TeamTransfersService.new(id).run
      end
    end
  end
end
