# frozen_string_literal: true

RSpec.describe Meliapi do
  it "has a version number" do
    expect(Meliapi::VERSION).not_to be nil
  end

  describe '#initialize' do
    it 'success' do
      expect(Meliapi.new).to_not eq(nil)
    end

    it 'with token' do
      api = Meliapi.new({access_token: '321'})
      expect(api.instance_variable_get(:@access_token)).to eq('321')      
    end
  end
end
