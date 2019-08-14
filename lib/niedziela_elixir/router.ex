defmodule NiedzielaElixir.Router do
  use Plug.Router
  use Plug.ErrorHandler

  alias Example.Plug.VerifyRequest

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  plug VerifyRequest, fields: ["content", "mimetype"], paths: ["/upload"]

  plug :match
  plug :dispatch

  get "/" do
    conn = assign(conn, :data, "anks")
    IO.inspect(conn.assigns[:data])
    page = EEx.eval_file("views/index.html.eex")
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page)
  end

  get "/hello" do
    send_resp(conn, 200, "Hello world")
  end

  get "/upload" do
    send_resp(conn, 201, "Uploaded")
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end
end
