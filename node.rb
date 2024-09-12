class Node
  attr_accessor :id, :network, :is_online, :logs, :state

  def initialize(id)
    @id = id
    @logs = []
    @is_online = true
    @state = 0
  end

  def add_neighbor(node)
    @network ||= Network.new
    @network.attach(self)
    @network.attach(node)
  end

  def propose_state(state)
    return "Status offline can't propose state" unless self.is_online
    network.notify(self, state)
  end

  def update(notifier, propose_state)
    previous_state = self.state
    self.state = propose_state
    Log.save_transition(self, notifier, previous_state)
  end

  def simulate_partition(nodes_list)
    network.detach(nodes_list)
  end

  def retrieve_log
    @logs
  end
end
