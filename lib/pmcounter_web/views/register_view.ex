defmodule PMCounterWeb.RegisterView do
  use PMCounterWeb, :view

  def render("ok.json", _params) do
    %{messaje: "ok"}
  end
end
