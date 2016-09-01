defmodule Pokemon.SubtypeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes", "fixture/custom_cassettes")
  end

  test "resource returns subtypes" do
    assert Pokemon.Subtype.resource === "subtypes"
  end

  test "test_all_returns_all_subtypes" do
    use_cassette "all_subtypes" do
      types = Pokemon.Subtype.all
      assert Enum.count(types) > 10
      assert Enum.member?(types, "Basic") === true
    end
  end
end
