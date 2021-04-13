class StatisticsCalculator

    module Score
        A = 90
        B = 75
        C = 60
    end

    class << self 

        def success_per_question(results)
            statistics = Array.new;
            questions = Array.new(10,0);
            
            results.each {|result| count_correct_answers_in_result(result.answers, questions)}
            claculate_correct_answers_percentage(questions, results.length(), statistics)
            statistics

        end

        def user_score(results)
            statistics = Array.new;
            results.each {|result| count_correct_answers_for_user(result.answers, result.user, statistics)}
            statistics
        end

        private 
        
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
                    percentage: ((questions[index-1].to_f/results_length*100).to_i).to_s + "%"
                }
                statistics << single_question
            end
        end

        def count_correct_answers_for_user(result_answers, result_user, statistics)
            count = 0
            print(result_answers)
            print(result_user)
            for index in 1..10 do
                if (result_answers[index.to_s])
                    count += 1
                end
            end
            score = claculate_score(count.to_f/10*100)
            set_final_score_for_user(result_user, score, statistics)
        end

        def set_final_score_for_user(user, score, statistics)
            single_user = {
                user: user.email,
                score: score              
            }
            statistics << single_user
        end

        def claculate_score(count)
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
