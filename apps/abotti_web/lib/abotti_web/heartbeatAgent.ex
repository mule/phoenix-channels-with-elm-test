defmodule AbottiWeb.HeartbeatAgent do
  def start_link do
    Agent.start_link(fn -> Map.new  end, name: __MODULE__)
  end

  def update(agent) do
    Agent.update(__MODULE__, fn(agentHeartbeats) ->
      Map.put(agentHeartbeats, agent, :os.system_time(:milli_seconds))
    end)
  end

  def get() do
    Agent.get(__MODULE__, fn(agentHeartbeats) -> agentHeartbeats end)
  end

end
