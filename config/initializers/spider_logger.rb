module Rails
  def self.spider_logger
    @spider_logger ||= Logger.new Rails.root.join('log', 'spider.log')

    @spider_logger
  end
end
