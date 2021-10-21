# frozen_string_literal: true

require "rails_helper"

describe Products::ParseCsv do
  let(:file_path) { Rails.root.join('spec/fixtures/price_1.csv') }
  let!(:hc) { Products::HeadersConverters.(file_path: file_path) }
  let(:context) {
    described_class.(
      file_path: hc.file_path,
        file_name: hc.file_name,
        headers: hc.headers,
        mapper: hc.mapper
    )
  }
  let(:expected) {
    {
      :brand => "toyota",
      :code => "04152yzza1",
      :cost => "311.12",
      :name => "Фильтр масляный",
      :price_list => "price_1",
      :stock => 10,
    }
  }

  describe '.call' do
    it "succeeds" do
      expect(context).to be_a_success
    end

    it 'provides the parsed csv data' do
      expect(context.csv.first).to eq(expected)
    end
  end
end
