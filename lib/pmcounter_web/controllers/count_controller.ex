defmodule PMCounterWeb.CountController do
  use PMCounterWeb, :controller

  def count(conn, _params) do
    PMCounter.Counter.create_installation()
    render(conn, "ok.json")
  end

  def get_count(conn, _params) do
    installations = PMCounter.Counter.count_installations()
    render(conn, "count.json", %{installations: installations})
  end
end
