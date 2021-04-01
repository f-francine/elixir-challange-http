defmodule ElixirChallange.Server do
  @moduledoc """
  Server for HTTP processing
  """
  use Plug.Router

  plug :match
  plug :dispatch

  get "/elixir_challange/:products/:emails" do

    IO.inspect(conn.path_params)
    list = %{"emails" => _emails, "products" => _products} = conn.path_params
    products_list_price =
      list["products"]
      |> String.split("_")
      |> Enum.chunk_every(3)
      |> Enum.reduce(0, fn([_name, price, quantity], acc) ->
        String.to_integer(price) * String.to_integer(quantity) + acc
      end)
    IO.inspect(products_list_price)

    email_list = list["emails"]
    |> String.split("_")
    IO.inspect(email_list)

    email_quantity = Enum.count(email_list)

    div = div(products_list_price, email_quantity)
    rem = rem(products_list_price, email_quantity)

    result = Enum.map(email_list,fn(email) ->
      Map.put(%{}, email, div)
    end)


    send_resp(conn, 200, "May the force be with you!\n(#{inspect result})")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end
