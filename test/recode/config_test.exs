defmodule Recode.ConfigTest do
  use ExUnit.Case

  alias Recode.Config

  describe "read/1" do
    test "reads config" do
      {config, []} = "priv/config.exs" |> File.read!() |> Code.eval_string()
      assert Config.read("priv/config.exs") == {:ok, config}
    end

    test "returns an error tuple for a missing config file" do
      assert Config.read("foo/bar/conf.exs") == {:error, :not_found}
    end
  end
end
