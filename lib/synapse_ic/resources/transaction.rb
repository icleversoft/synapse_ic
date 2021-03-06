module SynapseIc
  class Transaction
    def initialize
      @from = nil
      @to = nil
      @amount = {}
      @extra = {}
    end
    
    def from=(value)#SimpleNode
      @from = value
    end
    
    def to=(value)#SimpleNode
      @to = value
    end
    
    def amount=(value)
      @amount = {amount: value, currency: "USD"}
    end
    
    def extra=(value)
      @extra = value
    end
    
    def to_json
      {from: @from, to: @to, amount: @amount, extra: @extra}
    end
  end
end
