defmodule Twilio do
  import ExTwiml

  def dial do
    twiml do
      dial "18008352362"
    end
  end

end
