class StatisticsCalculator

    class << self 

        def success_per_question(results)
            statistics = Array.new;
            questions = Array.new(10,0);
            
            results.each do |result|
            # count all true questions
            for index in 1..10 do
                if (result.answers[index.to_s])
                questions[index-1] = questions[index-1] + 1
                end
            end
            end
        
            # create statistics object
            for index in 1..10 do
            single_question = {
                question: index.to_s,
                percentage: (questions[index-1]/results.length()*100).to_s + "%"
            }
            statistics << single_question
            end
        
            statistics
        
        end
    end

end