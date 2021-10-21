# frozen_string_literal: true

module Products
  class HeadersConverters < Base
    delegate :file_path, to: :context

    def call
      context.file_name = File.basename(file_path, '.csv')
      headers_converters = "Products::HeadersConverters::#{context.file_name.classify}".safe_constantize

      result = headers_converters.call
      context.fail! unless result.success?

      context.mapper = result.mapper
      context.headers = result.headers
    end
  end
end
