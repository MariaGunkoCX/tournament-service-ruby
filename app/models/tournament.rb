class Tournament < ApplicationRecord
    validates_presence_of :company_name, :start_date, :end_date
    validates_length_of :company_name, :maximum => 255
    validates_uniqueness_of :company_name
end
