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

  def intentRequest("CallTeladoc", _params) do
    HTTPotion.post "https://api.twilio.com/2010-04-01/#{System.get_env("TWILIO_SID")}/Calls", [basic_auth: {System.get_env("TWILIO_SID"), System.get_env("TWILIO_AUTH")}, body: "To=" <> URI.encode_www_form("+18304310213") <> "&From=" <> URI.encode_www_form("+19723622044") <> "&Url=" <> URI.encode_www_form("https://util.polymetric.xyz/twilio/callback"),
   headers: ["Content-Type": "application/x-www-form-urlencoded"]] 
    response()
      |> set_output_speech("You should get a call shortly that will connect you to Teladoc.")
      |> set_should_end_session(true)
  end

end
