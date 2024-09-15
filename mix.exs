defmodule Monotonic.Mixfile do
  use Mix.Project

  def project do
    [
      app: :monotonic,
      version: "0.0.1",
      elixir: "~> 1.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.6", runtime: false}
    ]
  end
end
