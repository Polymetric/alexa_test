defmodule AlexaTest.Api do  
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, AlexaTest.Web, [], [port: 4000])
    ]


    opts = [strategy: :one_for_one, name: AlexaTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
