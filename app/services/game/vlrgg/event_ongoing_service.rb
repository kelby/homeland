module Game
  module Vlrgg
    class EventOngoingService
      attr_accessor :id

      def initialize(data='')
        @id = data
      end

      def run
        ids = Event.where(status: "ongoing").ids
        ids.sort.map{|id| ::Game::Vlrgg::EventAllService.new(id).run }

        idss = Match.where(datetime: nil).ids
        idss.sort.map{|id| ::Game::Vlrgg::MatchAllService.new(id).run }
      end
    end
  end
end
