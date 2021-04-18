require_relative '../services/statistics_calculator'

describe 'statistics_calculator' do
  describe 'calculates success per question statistics' do
    let(:answers) { { '1': true, '2': true, '3': false, '4': true, '5': true, '6': true, '7': false, '8': true, '9': false, '10': true } }

    it 'context input is valid' do
    end

    it 'context input is invalid' do
    end
  end

  describe 'calculates score per user statistics' do
    it 'context input is valid' do
    end

    it 'context input is invalid' do
    end
  end
end
