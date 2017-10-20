# ex_luminati
[![Build Status](https://travis-ci.org/KamilLelonek/ex_luminati.svg?branch=master)](https://travis-ci.org/KamilLelonek/ex_luminati)

An Elixir client for https://luminati.io/.

## Disclaimer

**This in only a proof of concept and not a production-ready library. It's neither tested nor under active development.**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_luminati` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_luminati, "~> 0.1.0"},
  ]
end
```

## Usage

The puporse of this library is to use [luminati.io](https://luminati.io/) proxy service and provide HTTP client to make `HTTP GET` calls to any external address.

### Configuration options

  - `proxy_host`: usually `"zproxy.luminati.io`
  - `proxy_port`: usually `22225`
  - `proxy_username`: your `luminati.io` user name
  - `proxy_password`: your `luminati.io` user password
  - `pool_size`: the number of acquired IP addresses

**How does `pool_size` work?**

It's a specific option telling how many IP addresses to allocate. Each request will use a different IP address but only as much as defined by this option. E.g.: if we decide to use `10` as `pool_size`, we will be using only `10` IP address to make reuqest and `11th` request will use the same IP as was used by the `1st` one.

### Interface

    ExLuminati.get(url, headers \\ [], opts \\ [])

With the following params:

  - `url` - endpoint to call, e.g.: `"http://lumtest.com/myip.json"`
  - `headers` - HTTP headers, e.g.: `[{"Accept", "application/json"}]`
  - `url` - `HTTPoison` [options](https://hexdocs.pm/httpoison/HTTPoison.html#request/5)
