defmodule NovyWeb.PageControllerTest do
  use NovyWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Novy.io!"
  end
end
