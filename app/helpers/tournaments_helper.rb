module TournamentsHelper

    def successPerQuestion(results)
        statistics = Array.new;
        questions = Array.new;
    
        # initialize empty array
        for index in 0..9 do
          questions[index] = 0;
        end
    
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
          singleQuestion = {
            question: index.to_s,
            percentage: (questions[index-1]/results.length()*100).to_s + "%"
          }
          statistics.append(singleQuestion)
        end
    
        return statistics
      
      end
      
end
