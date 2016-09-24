defmodule AbottiWeb.ApiController do
  use AbottiWeb.Web, :controller

  def index(conn, _params) do
    beats = AbottiWeb.HeartbeatAgent.get()
    json conn, beats
  end
  def heartbeat(conn, %{"agent" => agent} ) do
    AbottiWeb.HeartbeatAgent.update(agent)
    beats = AbottiWeb.HeartbeatAgent.get()
    AbottiWeb.Endpoint.broadcast!("heartbeats:lobby", "new:heartbeats", beats)
    json conn, :ok
  end
end
