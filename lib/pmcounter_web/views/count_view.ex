defmodule PMCounterWeb.CountView do
  use PMCounterWeb, :view

  def render("ok.json", _params) do
    %{messaje: "ok"}
  end
  def render("count.json", %{installations: installations}) do
    %{total: installations}
  end
end
