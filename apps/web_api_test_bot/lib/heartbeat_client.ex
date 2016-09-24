defmodule WebApiTestBot.HeartbeatClient do
  use GenServer
  require Logger

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def init(state) do
    Logger.info "HeartbeatClient #{state} started"
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    # Do the work you desire here
    Logger.info "HeartbeatClient #{state} sending heartbeat"
    header = [{"Accept", "application/json"},
              {"Content-Type", "application/json"}
             ]
    body = Poison.encode!(%{agent: state})
    HTTPotion.post("localhost:4000/api/heartbeats", [body: body, headers: header])
    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work() do
    timespan_in_secs = Enum.random(1..60) * 100
    Process.send_after(self(), :work,  timespan_in_secs) 
  end
end
