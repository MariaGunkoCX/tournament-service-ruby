FactoryBot.define do
  factory :tournament do
    company_name { 'Checkmarx' }
    start_date { Time.new(2021, 8, 1, 14, 35, 0) }
    end_date { Time.new(2021, 8, 1, 14, 40, 0) }
  end
end
