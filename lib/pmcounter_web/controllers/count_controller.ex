defmodule PMCounterWeb.CountController do
  use PMCounterWeb, :controller

  def count(conn, %{"version" => version}) do
    case PMCounter.Counter.create_installation(%{version: version}) do
      {:ok, _installation} ->
        render(conn, "ok.json")
      {:error, error} ->
        render(conn, "error.json", error: error)
    end

  end

  def get_count(conn, _params) do
    installations = PMCounter.Counter.count_installations()
    render(conn, "count.json", %{installations: installations})
  end
end
