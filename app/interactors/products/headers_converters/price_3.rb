# frozen_string_literal: true

module Products
  class HeadersConverters
    class Price3 < Base

      private

      def headers_map
        {
          'Наименование' => :name,
          'Производитель' => :brand,
          'Номер' => :code,
          'Кол-во' => :stock,
          'Цена' => :cost
        }.freeze
      end
    end
  end
end
