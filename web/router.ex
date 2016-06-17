defmodule AlexaTest.Router do
  use AlexaTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/alexa", AlexaTest do
    pipe_through :api

    post "/", AlexaController, :post
  end

  scope "/bounce", AlexaTest do
    pipe_through :api

    get "/index", BounceController, :index
  end

  scope "/twilio", AlexaTest do
    post "/callback", TwilioController, :index
  end

end
