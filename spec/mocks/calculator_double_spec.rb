require 'rails_helper'

describe 'calculator_double' do
  it 'stubs success calculation' do
    mock = double(StatisticsCalculator)
    allow(mock).to receive(:success_per_question) { results }
  end

  it 'stubs score calculation' do
    mock = double(StatisticsCalculator)
    allow(mock).to receive(:user_score) { results }
  end
end
