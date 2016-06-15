defmodule AlexaTest.Api do  
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(AlexaTest.Web, [])
    ]

    opts = [strategy: :one_for_one, name: AlexaTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
