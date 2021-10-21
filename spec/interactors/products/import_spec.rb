# frozen_string_literal: true

require "rails_helper"

describe Products::Import do
  subject(:context) { described_class.(file_path: Rails.root.join("spec/fixtures/price_#{price_version}.csv")) }

  context 'price_1' do
    let(:price_version) { 1 }
    let(:expected_stock) { 14 }

    it "succeeds" do
      expect(context).to be_a_success
    end

    it "provides the file name" do
      expect(context.file_name).to eq('price_1')
    end

    it "provides the file path" do
      expect(context.file_path.split.last.to_s).to eq('price_1.csv')
    end

    it "should increment the products count by 999" do
      expect { subject }.to change { Product.count }.by(999)
    end

    it "should replace duplicated products" do
      subject
      stock = Product.find_by(brand: 'toyota', code: '04152yzza1', price_list: 'price_1').stock

      expect(stock).to eq(expected_stock)
    end
  end
end
