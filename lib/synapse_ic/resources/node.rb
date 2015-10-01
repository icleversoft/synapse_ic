module SynapseIc
  class Node < Response
    attr_reader :node_type, :allowed, :active
    attr_reader :account_num, :class, :name_on_account, :nickname, :routing_num, :type
    def initialize( data = {} )
      super( data )
      if data.has_key? 'nodes'
        node = data['nodes'].first
        unless node.nil?
          @node_type = node['type']
          @allowed = node['allowed']
          @active = node['active']

          if node.has_key? 'info'
            node['info'].each do |key, value|
              instance_variable_set("@#{key}", value)
            end
          end
        end
      end
    end
  end
end