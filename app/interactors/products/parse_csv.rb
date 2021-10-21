# frozen_string_literal: true

require 'csv'
require_relative 'helpers'

module Products
  class ParseCsv < Base
    include Helpers

    delegate :file_path, :file_name, :headers, :mapper, to: :context

    def call
      print_memory_usage do
        print_time_spent do
          options = { headers: true, header_converters: mapper }
          csv = []

          CSV.foreach(file_path, options) do |row|
            normalized_row = NormalizeCsv.call(
              row: row,
              headers: headers,
              file_name: file_name
            )

            csv << normalized_row.data if normalized_row.success?
          end

          context.csv = csv
        end
      end
    end
  end
end
