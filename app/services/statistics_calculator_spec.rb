require_relative '../services/statistics_calculator'

describe 'statistics_calculator' do
  let(:results) { [{user: {email: 'maria.gunko@checkmarx.com'}, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': false, '7': true, '8': true, '9': true, '10': false }},
    {user: {email: 'eti.noked@checkmarx.com'}, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': true, '7': true, '8': true, '9': true, '10': true }}] }

  describe 'calculates success per question statistics' do
    let(:success) {[{ percentage: '100%', question: '1' }, { percentage: '100%', question: '2' }, { percentage: '100%', question: '3' }, { percentage: '100%', question: '4' }, { percentage: '100%', question: '5' },
    { percentage: '50%', question: '6' }, { percentage: '100%', question: '7' }, { percentage: '100%', question: '8' }, { percentage: '100%', question: '9' }, { percentage: '50%', question: '10' }]}

    it 'context input is valid' do
      response = StatisticsCalculator.success_per_question(results)
      expect(response).to eq(success)
    end

    it 'context input is invalid' do
    end
  end

  describe 'calculates score per user statistics' do
    let(:scores) { [{ score: 'B', user: 'maria.gunko@checkmarx.com' }, { score: 'A', user: 'eti.noked@checkmarx.com' }] }

    it 'context input is valid' do
      response = StatisticsCalculator.user_score(results)
      expect(response).to eq(scores)
    end

    it 'context input is invalid' do
    end
  end
end
