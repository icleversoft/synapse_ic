module SynapseIc
  class Node < Response
    attr_reader :node
    # attr_reader :node_id, :node_type, :allowed, :active
    # attr_reader :account_num, :class, :name_on_account, :nickname, :routing_num, :type
    def initialize( data = {} )
      super( data )
      if data.has_key? 'nodes'
        @node = SimpleNode.new(data['nodes'].first) unless data['nodes'].empty?
        # unless node.nil?
        #   @node_id = node['_id']['$oid'] if node['_id'].has_key? '$oid' 
        #   @node_type = node['type']
        #   @allowed = node['allowed']
        #   @active = node['active']
        # 
        #   if node.has_key? 'info'
        #     node['info'].each do |key, value|
        #       instance_variable_set("@#{key}", value)
        #     end
        #   end
        # end
      end
    end
  end
end