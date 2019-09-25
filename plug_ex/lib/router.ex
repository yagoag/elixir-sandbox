defmodule PlugEx.Router do
    use Plug.Router

    plug :match
    plug :dispatch

    get "/" do
        send_resp(conn, 200, "First test")
    end

    get "/home" do
        conn = put_resp_content_type(conn, "text/html")
        send_file(conn, 200, "lib/index.html")
    end

    get "/hello/:name" do
        send_resp(conn, 200, "Hello, #{String.capitalize(name)}!")
    end

    match _, do: send_resp(conn, 404, "Could not find your page!")
end