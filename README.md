# Distributed System Simulation

## Description

Code Challenge:
Distributed System Simulation
Problem Statement
You are tasked with simulating a distributed system where multiple nodes communicate
with each other to achieve consensus on a shared state. The system should be able to:
1. Simulate multiple nodes that can send and receive messages.
2. Implement a consensus algorithm (e.g., Paxos or Raft) to agree on a shared state.
3. Handle network partitions and node failures gracefully.
4. Log the state transitions and messages exchanged between nodes.

# Solution
- The solution was implemented creating a network which connect nodes and allow the interaction sending and receiving messages.

### How to interact

Download the repo and go inside the folder
```bash
cd DistributedSystemSimulation
```

- Execute the following command to start ruby shell
```bash
irb
```
Inside execute
```bash
require './main.rb'
```
### Create nodes
- Nodes creation with param as identifier
```ruby
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
```
- Default state is 0
```ruby
puts node1.state
puts node2.state
puts node3.state
```
### Add nodes to same network
```ruby
node1.add_neighbor(node2)
node2.add_neighbor(node3)
```
### Propose state for nodes of same network
- Propose state
```ruby
node2.propose_state(2)
```
- Check state
```ruby
puts node1.state
puts node2.state
puts node3.state
```
### See logs
```ruby
puts node1.retrieve_log
puts node2.retrieve_log
puts node3.retrieve_log
```
### Simulate partition
```ruby
node3.simulate_partition([node1])
```
### Considerations
#### `node1` can't propose a state after simulate_partition neither receive update
- (Execute to see)
```ruby
node1.propose_state(1)
```
```ruby
node2.propose_state(3)
```
#### Can check states and logs again to validate the information
```ruby
puts node1.retrieve_log
puts node2.retrieve_log
puts node3.retrieve_log
```