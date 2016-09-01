defmodule Pokemon.SupertypeTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes", "fixture/custom_cassettes")
  end

  test "resource returns supertypes" do
    assert Pokemon.Supertype.resource === "supertypes"
  end

  test "test_all_returns_all_types" do
    use_cassette "all_supertypes" do
      types = Pokemon.Supertype.all
      assert Enum.member?(types, "Pokémon")
      assert Enum.member?(types, "Energy")
      assert Enum.member?(types, "Trainer")
    end
  end
end
