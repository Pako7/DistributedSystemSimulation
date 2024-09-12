class Network
  def initialize
    @nodes = []
  end

  def attach(node)
    node.network = self
    node.is_online = true
    @nodes << node unless @nodes.include?(node)
  end

  def detach(nodes_list)
    nodes_list.each do |node|
      node.is_online = false
      @nodes.delete(node)
    end
    true
  end

  def notify(notifier, propose_state)
    @nodes.each do |node|
      node.update(notifier, propose_state) if node.is_online
    end
    true
  end
end
