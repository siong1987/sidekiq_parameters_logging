module Sidekiq
  module Parameters
    class Logging
      def call(worker, item, queue)
        Sidekiq::Logging.with_context("#{worker.class.to_s} JID-#{item['jid']}") do
          begin
            start = Time.now
            logger.info { "start" }

            # see whether filter_block is set
            worker_class = worker.class
            if worker_class.respond_to?(:filter_block) && worker_class.filter_block
              logger.info do
                "parameters: #{worker_class.filter_block.call(item['args'].clone).inspect}"
              end
            else
              logger.info { "parameters: #{item['args'].inspect}" }
            end

            yield
            logger.info { "done: #{elapsed(start)} sec" }
          rescue Exception
            logger.info { "fail: #{elapsed(start)} sec" }
            raise
          end
        end
      end

      def elapsed(start)
        (Time.now - start).to_f.round(3)
      end

      def logger
        Sidekiq.logger
      end
    end
  end
end
