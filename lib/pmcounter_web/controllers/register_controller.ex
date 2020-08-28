defmodule PMCounterWeb.RegisterController do
  use PMCounterWeb, :controller
  alias PMCounter.Register

  def register(
        conn,
        params = %{
          "model" => model,
          "output" => output,
          "installation_code" => installation_code,
          "run" => run
        }
      ) do
    IO.inspect(params)

    Register.create(%{
      input: model,
      output: output,
      installation_code: installation_code,
      run_number: run
    })

    render(conn, "ok.json")
  end
end
