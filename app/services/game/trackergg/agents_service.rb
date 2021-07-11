module Game
  module Trackergg
    class AgentsService
      def initialize(data='')
        @data = data
      end

      def run
        response = Typhoeus.get("http://localhost:3001/trackergg/valorant/agents", timeout: 7)

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

        if datas["_error"].blank?
          datas['data'].map do |data|
            ::Trackergg::AgentsService.new(data).run
          end
        end
      end
    end
  end
end
