# frozen_string_literal: true

module Products
  class NormalizeCsv < Base
    delegate :row, :headers, :file_name, to: :context

    def call
      data = row.to_h.slice(*headers)
      context.fail! if data.except(:name).any? { |_, v| v.empty? }

      data[:price_list] = file_name
      data[:stock] = data[:stock].strip.gsub('>', '').to_i
      data[:brand].downcase!
      data[:code].downcase!

      context.fail! if data.slice(:name).any? { |_, v| v.empty? }

      context.data = data
    end
  end
end
