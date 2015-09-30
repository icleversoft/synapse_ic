module SynapseIc
  class Question
    attr_reader :question_id, :question, :answers

    def initialize( data )
      @question_id = data['id']
      @question = data['question']

      @question ||= ""
      @answers = []

      if data.has_key? 'answers'
        data['answers'].each do |answer|
          @answers << {answer_id: answer['id'], value: answer['answer']}
        end
      end

    end
  end
end