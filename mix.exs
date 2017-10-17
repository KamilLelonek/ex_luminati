defmodule ExLuminati.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :ex_luminati,
      version:         "0.1.0",
      elixir:          "~> 1.5",
      start_permanent: Mix.env() == :prod,
      description:     description(),
      package:         package(),
      deps:            deps(),
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
    ]
  end

  defp description do
    "An Elixir library for https://luminati.io/."
  end

  defp package do
    [
      maintainers: ["Kamil Lelonek <squixy.sln@gmail.com>"],
      licenses:    ["Apache 2.0"],
      links:       %{"GitHub" => "https://github.com/KamilLelonek/ex-luminati"},
    ]
  end
end
