defmodule Helloworld.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    conn |> send_resp(200, "Hello, world")
  end

  match _ do
    conn |> send_resp(404, "Not Found")
  end
end
