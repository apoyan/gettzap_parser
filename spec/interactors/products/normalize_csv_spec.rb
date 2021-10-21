require "rails_helper"
require 'csv'

describe Products::NormalizeCsv do
  let(:price_version) { 1 }
  let(:file_name) { 'price_1' }
  let(:headers) { [:name, :brand, :code, :stock, :cost] }
  let(:brand) { 'TOYOTA' }
  let(:code) { '04152YZZA1' }
  let(:stock) { '>1' }
  let(:row) { CSV::Row.new(headers, ['Фильтр масляный', brand, code, stock, '311.12', '1']) }

  subject(:context) { described_class.(row: row, headers: headers, file_name: file_name) }

  describe '.call' do
    it "succeeds" do
      expect(context).to be_a_success
    end

    it 'downcases the brand and code' do
      expect(context.data[:brand]).to eq(brand.downcase)
      expect(context.data[:code]).to eq(code.downcase)
    end

    it 'removes ">" character from stock ' do
      expect(context.data[:stock]).to eq(stock.strip.gsub('>', '').to_i)
    end
  end
end
