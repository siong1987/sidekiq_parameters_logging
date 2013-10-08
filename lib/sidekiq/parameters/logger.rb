module Sidekiq
  module Parameters
    module Logger
      module ClassMethods
        attr_reader :filter_block

        def logger_filter(&block)
          @filter_block = block
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
