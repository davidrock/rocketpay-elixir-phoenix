defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file whith the given name returns the sun of numbers" do
      resp = Numbers.sum_from_file("numbers")

      expec_resp = {:ok, %{result: 37}}

      assert resp == expec_resp

    end

    test "when there is NO file whith the given name returns an error" do
      resp = Numbers.sum_from_file("banana")

      expec_resp = {:error, "Invalid File"}

      assert resp == expec_resp

    end
  end

end
