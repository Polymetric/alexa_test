defmodule AlexaTest.BounceController do
  use AlexaTest.Web, :controller
  
  def index(conn, _params) do
    render json, TestServers.all_servers
  end

end
