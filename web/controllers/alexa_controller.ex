defmodule AlexaTest.AlexaController do
  use AlexaTest.Web, :controller
  use Alexa.Speech, :post

  def launchRequest(_params) do
    response()
      |> set_output_speech("I am Alice, the wonderful bot. To deploy, try something like. Alexa, ask Alice to deploy call center to dev seven.") 
  end

  def sessionEndedRequest(_params) do
    response()
      |> set_output_speech("Goodbye.")
  end

  def intentRequest("HelloWorld", _params) do    
    response()
      |> set_output_speech("Watashi wa Alice dess!")
      |> set_should_end_session(true)
  end

  def intentRequest("AliceDeploy", params) do
    app = params["request"]["intent"]["slots"]["App"]["value"]
    server_type = params["request"]["intent"]["slots"]["ServerType"]["value"]
    server_number = params["request"]["intent"]["slots"]["ServerNumber"]["value"]
    response()
      |> set_output_speech("Deploying #{app} to #{server_type} #{server_number}!")
      |> set_should_end_session(true)
  end

  def intentRequest("FreeServers", _params) do
    response()
      |> set_output_speech(for name <- TestServers.free_server_names, into: "", do: name <> " ")
      |> set_should_end_session(true)
  end

end
