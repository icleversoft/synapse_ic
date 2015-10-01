module SynapseIc
  class NodeList < Response
    attr_reader :nodes
    
    def initialize( data = {} )
      super( data )
      @nodes = []
      if data.has_key? 'nodes'
        data['nodes'].each {|node| @nodes << SimpleNode.new(node)}
      end
    end
  end
end