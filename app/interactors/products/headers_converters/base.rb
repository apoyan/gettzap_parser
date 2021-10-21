# frozen_string_literal: true

module Products
  class HeadersConverters
    class Base < Products::Base
      def call
        context.mapper = ->(header) { headers_map.fetch(header, header) }
        context.headers = headers_map.values
      end

      private

      def headers_map
        raise NotImplementedError
      end
    end
  end
end
