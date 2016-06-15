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

  def intentRequest("HelloWorld", params) do    
    response()
      |> set_output_speech("Watashi wa Alice dess!")
      |> set_should_end_session(true)
  end

  def intentRequest("AliceDeploy", params) do
    app = params["request"]["intent"]["slots"]["App"]["value"]
    server = params["request"]["intent"]["slots"]["Server"]["value"]
    response()
      |> set_output_speech("Deploying #{app} to #{server}!")
      |> set_should_end_session(true)
  end

end
