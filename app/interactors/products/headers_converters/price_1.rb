# frozen_string_literal: true

module Products
  class HeadersConverters
    class Price1 < Base

      private

      def headers_map
        {
          'Наименование' => :name,
          'Производитель' => :brand,
          'Артикул' => :code,
          'Количество' => :stock,
          'Цена' => :cost
        }.freeze
      end
    end
  end
end
