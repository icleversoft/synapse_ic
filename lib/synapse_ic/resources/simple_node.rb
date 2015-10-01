module SynapseIc
  class SimpleNode
    attr_reader :node_id, :node_type, :allowed, :active
    attr_reader :account_num, :class, :name_on_account, :nickname, :routing_num, :type
    def initialize( data = {} )
      @node_id = data['_id']['$oid'] if data['_id'].has_key? '$oid' 
      @node_type = data['type']
      @allowed = data['allowed']
      @active = data['is_active']
      
      if data.has_key? 'info'
        data['info'].each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end
end