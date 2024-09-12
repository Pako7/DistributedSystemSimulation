class Log
  def self.save_transition(node, notifier, previous_state)
    notifier_msg = node.id == notifier.id ? 'it self' : "Node id #{notifier.id}"
    node.logs << "Changed state from #{previous_state} to #{node.state}, proposed by #{notifier_msg}"
  end
end