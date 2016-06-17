defmodule TestServers do

  def all_servers do
    response = HTTPotion.get "testservers.dev.teladoc.com/servers.json", [ ibrowse: [ proxy_host: '96f40979.ngrok.io', proxy_port: 80 ] ]
    servers_json = Poison.decode! response.body
    servers_json["servers"]
  end

  def free_servers do
    for server <- all_servers, server["leankit_card"] in ["", nil], do: server
  end

  def free_server_names do
    for server <- free_servers, not server["name"] in ["", nil], do: server["name"]
  end

end
