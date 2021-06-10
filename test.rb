require 'rspec/autorun'
require_relative './calculator'

describe Calculator do
  let(:calc) { Calculator.new }

  it 'rest of division equals zero' do
    expect(calc.divisibleByFive(35)).to eq(true)
  end

  it 'validToArraySize' do
    expect(calc.validToArraySize(99)).to eq(true)
  end

  it 'is a Integer value' do
    expect(calc.isInteger(1)).to eq(true)
  end
end
