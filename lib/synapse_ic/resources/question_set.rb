module SynapseIc
  class QuestionSet
    attr_reader :questions, :question_set_id
    def initialize( data )
      @questions = []
      @question_set_id = data['id']
      @question_set_id ||= ""
      
      if data.has_key? 'questions'
        data['questions'].each do |question|
          @questions << Question.new( question )
        end
      end
    end
  end
end