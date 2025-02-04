module Game
  module Vlrgg
    class MatchResultsService
      attr_accessor :page_size

      def initialize(data='')
        @page_size = data
      end

      def run(begin_page=1)
        page_size ||= begin_page
        results = []

        (1..page_size).to_a.each do |page|
          response = Typhoeus.get("#{ENV['spider_uri']}/vlrgg/valorant/matches/results", params: {page: page}, timeout: 7)

          datas = if response.success?
            body = response.body
            # hell yeah
            begin
              JSON.parse(body)
            rescue Exception => e
              {"_error" => "json_parse_err"}
            end
            # hell yeah
          elsif response.timed_out?
            # aw hell no
            # log("got a time out")
            {"_error" => "timed_out"}
          elsif response.code == 0
            # Could not get an http response, something's wrong.
            # log(response.return_message)
            {"_error" => "code_zero"}
          else
            {"_error" => "unknown"}
            # Received a non-successful http response.
            # log("HTTP request failed: " + response.code.to_s)
          end

          unless datas.is_a?(Hash) && datas["_error"].present?
            datas.map do |data|
              ::Vlrgg::MatchResultsService.new(data, page: page).run
            end
          end
        end
      end
    end
  end
end
