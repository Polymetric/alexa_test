defmodule AlexaTest.BounceController do
  use AlexaTest.Web, :controller
  
  def index(conn, _params) do
    json conn, TestServers.all_servers
  end

end
