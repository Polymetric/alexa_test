defmodule AlexaTest.TwilioController do
  use AlexaTest.Web, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/xml")
    |> send_resp(201, Twilio.dial)
  end

end
