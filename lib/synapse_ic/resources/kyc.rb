module SynapseIc
  class KYC < Response
    attr_reader :message, :permission, :question_set

    def initialize( data = {} )
      super( data )
      @permission = ""
      @question_set = nil
      @message = data["message"]["en"]
      @permission = data["user"]["permission"] if data.has_key? "user"

      if data.has_key? 'question_set'
        @question_set = QuestionSet.new( data['question_set'] )
      end
    end
    
    def verify_required?
      !@question_set.nil?
    end
  end
end