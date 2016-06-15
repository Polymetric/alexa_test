defmodule AlexaTest.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http AlexaTest.Web, []
  end

  post "/command" do
    {:ok, body, conn} = read_body(conn)
    request = Poison.decode!(body, as: %Alexa.Request{})
    response = Alexa.handle_request(request)
    conn
    |> send_resp(200, Poison.encode!(response))
    |> halt
  end

  get "/" do
    conn
    |> send_resp(200, "ok\n")
    |> halt
  end
  match _ do  
    conn
    |> send_resp(404, "Nothing here\n")
    |> halt
  end
end
