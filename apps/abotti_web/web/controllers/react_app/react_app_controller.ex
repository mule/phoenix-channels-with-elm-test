defmodule AbottiWeb.ReactAppController do
  use AbottiWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
