defmodule AlexaTest.AlexaController do
  use AlexaTest.Web, :controller
  use Alexa.Speech, :post

  def launchRequest(_params) do
    response() 
      |> set_output_speech("Welcome to the programming oracle. Ask me what are the best programming languages.") 
  end

  def sessionEndedRequest(_params) do
    response() 
  end

  def intentRequest("HelloWorld", params) do    
    response()
      |> set_output_speech("Watashi wa Alexa dess!")
      |> set_should_end_session(true)
  end
end
