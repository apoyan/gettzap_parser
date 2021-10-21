# frozen_string_literal: true

require "rails_helper"

describe Products::HeadersConverters do
  let(:price_version) { 1 }
  subject(:context) { described_class.(file_path: Rails.root.join("spec/fixtures/price_#{price_version}.csv")) }

  describe '.call' do
    it 'provides the headers' do
      expect(context.headers).to eq([:name, :brand, :code, :stock, :cost])
    end

    it "succeeds" do
      expect(context).to be_a_success
    end

    it "provides the headers mapper" do
      expect(context.mapper.call("Производитель")).to eq(:brand)
      expect(context.mapper.call("Наименование")).to eq(:name)
      expect(context.mapper.call("Артикул")).to eq(:code)
      expect(context.mapper.call("Количество")).to eq(:stock)
      expect(context.mapper.call("Цена")).to eq(:cost)
      expect(context.mapper.call("qwerty")).to eq('qwerty')
    end
  end
end
