defmodule SitefinanceiroWeb.Router do
  use SitefinanceiroWeb, :router

  import SitefinanceiroWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SitefinanceiroWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  ## Authentication routes

  scope "/", SitefinanceiroWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    #get "/login", PersonController, :index
    #get "/cadastro", PersonController, :new

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    #get "/users/reset_password", UserResetPasswordController, :new
    #post "/users/reset_password", UserResetPasswordController, :create
    #get "/users/reset_password/:token", UserResetPasswordController, :edit
    #put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", SitefinanceiroWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/financial", FinancialController, :index
    get "/financial/new", FinancialController, :new
    get "/financial/reports", FinancialController, :reports

    resources "/receitas", ReceitaController
    resources "/despesas", DespesaController

    live "/receitas2", Receita2Live.Index, :index
    live "/receitas2/new", Receita2Live.Index, :new
    live "/receitas2/:id/edit", Receita2Live.Index, :edit

    live "/receitas2/:id", Receita2Live.Show, :show
    live "/receitas2/:id/show/edit", Receita2Live.Show, :edit

    live "/despesas2", Despesa2Live.Index, :index
    live "/despesas2/new", Despesa2Live.Index, :new
    live "/despesas2/:id/edit", Despesa2Live.Index, :edit

    live "/despesas2/:id", Despesa2Live.Show, :show
    live "/despesas2/:id/show/edit", Despesa2Live.Show, :edit
    #get "/users/settings", UserSettingsController, :edit
    #put "/users/settings", UserSettingsController, :update
    #get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", SitefinanceiroWeb do
    pipe_through [:browser]

    get "/", HomeController, :index

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update

  end

  # Other scopes may use custom stacks.
  # scope "/api", SitefinanceiroWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SitefinanceiroWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end


end
