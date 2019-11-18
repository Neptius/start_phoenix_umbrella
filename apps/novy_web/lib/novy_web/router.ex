defmodule NovyWeb.Router do
  use NovyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug NovyWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NovyWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show

    
    live "/videos", VideoLive.Index, session: [:user_id]
    live "/videos/:id", VideoLive.Show
    live "/videos/new", VideoLive.New
    live "/videos/:id/edit", VideoLive.Edit
  end

  scope "/manage", NovyWeb do
    pipe_through [:browser, :authenticate_user]

    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", NovyWeb do
  #   pipe_through :api
  # end
end
