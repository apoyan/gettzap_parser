# frozen_string_literal: true

module Products
  class Persist < Base
    def call
      Product.transaction do
        Product.where(price_list: context.file_name).delete_all
        Product.upsert_all(context.csv, unique_by: :index_products_on_brand_and_code_and_price_list)
      end
    end
  end
end
