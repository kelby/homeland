module Game
  module Vlrgg
    class MatchPerformanceService
      attr_accessor :id

      def initialize(data='')
        @id = data
      end

      def run
        response = Typhoeus.get("#{ENV['spider_uri']}/vlrgg/valorant/matches/#{id}/performance", timeout: 7)

        data = if response.success?
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

        unless data.is_a?(Hash) && data["_error"].present?
          data['datas'].map do |data|
            ::Vlrgg::MatchPerformanceService.new(data, match_id: id).run
          end
        end
      end
    end
  end
end
