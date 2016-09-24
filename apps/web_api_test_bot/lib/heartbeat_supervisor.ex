defmodule WebApiTestBot.HeartbeatSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end


  def init(:ok) do
    #agents = [:orange, :apple, :banana, :kiwi]
    agents = [:orange]

    children = Enum.map(agents, fn(agent) -> worker(WebApiTestBot.HeartbeatClient, [agent], restart: :transient, id: agent) end)

    supervise(children, strategy: :one_for_one)
  end
end
