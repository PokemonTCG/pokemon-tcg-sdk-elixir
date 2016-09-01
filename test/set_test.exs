defmodule Pokemon.SetTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes", "fixture/custom_cassettes")
  end

  test "test_find_returns_one_set" do
    use_cassette "one_set" do
      set = Pokemon.Set.find('g1')

      assert set.code === "g1"
      assert set.name === "Generations"
      assert set.series === "XY"
      assert set.totalCards === 115
      assert set.standardLegal === true
      assert set.releaseDate === "02/22/2016"
    end
  end

  test "test_find_with_invalid_code_throws_exception" do
    use_cassette "invalid_code" do
      assert_raise(KeyError, fn -> Pokemon.Set.find("invalid") end)
    end
  end

  test "test_all_returns_all_sets" do
    use_cassette "all_sets" do
      sets = Pokemon.Set.all

      assert Enum.count(sets) > 10
    end
  end

  test "test_where_filters_on_cards" do
    use_cassette "filtered_sets" do
      sets = Pokemon.Set.where(standardLegal: true)

      assert List.first(sets).standardLegal === true
      assert List.first(sets) |> is_map == true
    end
  end
end
