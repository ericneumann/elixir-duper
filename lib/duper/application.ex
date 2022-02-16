defmodule Duper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do

    IO.puts "starting the kiddies"
    children = [
      Duper.Results,
      { Duper.PathFinder, "/Users/ericn/Pictures" },
      Duper.WorkerSupervisor,
      { Duper.Gatherer, 8 }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
