# frozen_string_literal: true

module Products
  class HeadersConverters
    class Price2 < Base

      private

      def headers_map
        {
          'НаименованиеТовара' => :name,
          'Производитель' => :brand,
          'Артикул' => :code,
          'Количество' => :stock,
          'Цена' => :cost
        }.freeze
      end
    end
  end
end
