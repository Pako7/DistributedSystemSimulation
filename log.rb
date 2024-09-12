class Log
  def self.save_transition(node, notifier, previous_state)
    node.logs << {
      previous_state: previous_state,
      state: node.state,
      proposed_by_node_id: notifier.id,
      timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S')
    }
  end
end