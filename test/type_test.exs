defmodule Pokemon.TypeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes", "fixture/custom_cassettes")
  end

  test "resource returns types" do
    assert Pokemon.Type.resource === "types"
  end

  test "test_all_returns_all_types" do
    use_cassette "all_types" do
      types = Pokemon.Type.all
      assert Enum.count(types) > 5
      assert Enum.member?(types, "Water") === true
    end
  end
end
