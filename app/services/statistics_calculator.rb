class StatisticsCalculator

    module Constants
        NUMBER_OF_QUESTIONS = 10
        FULL_PERCENTAGE = 100
    end
    
    module Score
        A = 90
        B = 75
        C = 60
    end
    
    class << self 

        def success_per_question(results)
            questions = Array.new(Constants::NUMBER_OF_QUESTIONS, 0)  
            results.each {|result| count_correct_answers_in_result(result.answers, questions)}
            questions.map.with_index {|question, index| claculate_correct_answers_percentage(question, index, results.length())}
        end

        def user_score(results)
            results.map {|result| count_correct_answers_for_user(result.answers, result.user)}
        end

        private 
        
        def count_correct_answers_in_result(result_answers, questions)
            for index in 1..Constants::NUMBER_OF_QUESTIONS do
                if (result_answers[index.to_s])
                    questions[index-1] += 1
                end
             end
        end

        def claculate_correct_answers_percentage(question, index, results_length)
            single_question = {
                question: (index.to_i+1).to_s,
                percentage: ((question.to_f/results_length*Constants::FULL_PERCENTAGE).to_i).to_s + "%"
            }
            single_question
        end

        def count_correct_answers_for_user(result_answers, result_user)
            count = 0
            for index in 1..Constants::NUMBER_OF_QUESTIONS do
                if (result_answers[index.to_s])
                    count += 1
                end
            end
            single_user = {
                user: result_user.email,
                score: calculate_score(count.to_f/Constants::NUMBER_OF_QUESTIONS*Constants::FULL_PERCENTAGE)              
            }
            single_user
        end

        def calculate_score(count)
            if count > Score::A
                return 'A'
            elsif count > Score::B
                return 'B'
            elsif count >= Score::C
                return 'C'
            else 
                return 'F'
            end
        end

    end

end
