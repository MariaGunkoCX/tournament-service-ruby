require 'rails_helper'

describe 'statistics_calculator' do
  before(:all) do
    @user = build(:user)
    @result = build(:result, user: @user, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': false, '7': true, '8': true, '9': true, '10': false })

    @user_second = build(:user)
    @result_second = build(:result, user: @user_second, answers: { '1': true, '2': true, '3': true, '4': true, '5': true, '6': true, '7': true, '8': true, '9': true, '10': true })
  end

  describe 'calculates success per question statistics' do
    let(:success) { [{ percentage: '100%', question: '1' }, { percentage: '100%', question: '2' },
                     { percentage: '100%', question: '3' }, { percentage: '100%', question: '4' },
                     { percentage: '100%', question: '5' }, { percentage: '50%', question: '6' },
                     { percentage: '100%', question: '7' }, { percentage: '100%', question: '8' },
                     { percentage: '100%', question: '9' }, { percentage: '50%', question: '10' }]
    }

    context 'input is valid' do
      it 'successes to calculate' do
        response = StatisticsCalculator.success_per_question([@result, @result_second])
        expect(response).to eq(success)
      end
    end
  end

  describe 'calculates score per user statistics' do
    let(:scores) { [{ score: 'B', user: @user.email }, { score: 'A', user: @user_second.email }] }

    context 'input is valid' do
      it 'scores to calculate' do
        response = StatisticsCalculator.user_score([@result, @result_second])
        expect(response).to eq(scores)
      end
    end
  end
end
