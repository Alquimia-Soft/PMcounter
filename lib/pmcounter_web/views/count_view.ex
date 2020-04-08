defmodule PMCounterWeb.CountView do
  use PMCounterWeb, :view

  def render("ok.json", _params) do
    %{messaje: "ok"}
  end
  def render("count.json", %{installations: installations}) do
    installations
  end
  def render("error.json", %{error: error}) do
    %{error: translate_error(error)}
  end
end
