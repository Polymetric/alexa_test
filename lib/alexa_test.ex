defmodule AlexaTest do
 use Alexa.Skill, app_id: "amzn1.echo-sdk-ams.app.430c8f65-e955-4b8e-aba9-4ef5fb1c57ff"      

  def handle_intent("AliceDeploy", request, response) do
    IO.puts request
    response |> say("Hello World!")
  end 
end
