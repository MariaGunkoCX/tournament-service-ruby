class StatisticsCalculator

    class << self 

        def success_per_question(results)
            statistics = Array.new;
            questions = Array.new(10,0);
            
            results.each {|result| count_correct_answers_in_result(result.answers, questions)}
            claculate_correct_answers_percentage(questions, results.length(), statistics)
            statistics

        end

        def count_correct_answers_in_result(result_answers, questions)
            for index in 1..10 do
                if (result_answers[index.to_s])
                    questions[index-1] += 1
                end
             end
        end

        def claculate_correct_answers_percentage(questions, results_length, statistics)
            for index in 1..10 do
                single_question = {
                    question: index.to_s,
                    percentage: (questions[index-1]/results_length*100).to_s + "%"
                }
                statistics << single_question
            end
        end

    end

end