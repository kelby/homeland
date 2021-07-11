module Game
  module Vlrgg
    class EventsByRegionService
      def initialize(data='')
        # @data = data
      end

      def run
        ['', 'europe', 'north-america', 'asia-pacific', 'latin-america', 'mena'].each do |region|
          response = Typhoeus.get("#{ENV['spider_uri']}/vlrgg/valorant/events/#{region}", timeout: 7)

          datas = if response.success?
            body = response.body
            begin
              JSON.parse(body)
            rescue Exception => e
              {"_error" => "json_parse_err"}
            end
          elsif response.timed_out?
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
            datas.values.map do |values|
              values.map do |data|
                ::Vlrgg::EventsByRegionService.new(data).run
              end
            end
          end
        end
      end
    end
  end
end
