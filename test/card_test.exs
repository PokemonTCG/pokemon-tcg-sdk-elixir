defmodule Pokemon.CardTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes", "fixture/custom_cassettes")
  end

  test "resource returns cards" do
    assert Pokemon.Card.resource == "cards"
  end

  test "find returns the correct card" do
    use_cassette "one_card" do
      card = Pokemon.Card.find("xy7-57")
      assert card.id === "xy7-57"
      assert card.name === "Giratina-EX"
      assert card.nationalPokedexNumber === 487
      assert card.imageUrl === "https://s3.amazonaws.com/pokemontcg/xy7/57.png"
      assert card.subtype === "EX"
      assert card.supertype === "Pokémon"
      assert card.ability.name === "Renegade Pulse"
      assert card.ability.text === "Prevent all effects of attacks, including damage, done to this Pokémon by your opponent's Mega Evolution Pokémon."
      assert card.hp === "170"
      assert card.retreatCost === ["Colorless","Colorless","Colorless"]
      assert card.number === "57"
      assert card.artist === "PLANETA"
      assert card.rarity === "Rare Holo EX"
      assert card.series === "XY"
      assert card.set === "Ancient Origins"
      assert card.setCode === "xy7"
      assert card.text === ["When a Pokémon-EX has been Knocked Out, your opponent takes 2 Prize cards."]
      assert card.types === ["Dragon"]
      assert Enum.count(card.attacks) > 0 # Attacks should exist
      attack = List.first(card.attacks)
      assert attack.cost === ["Grass","Psychic","Colorless","Colorless"]
      assert attack.name == "Chaos Wheel"
      assert attack.text == "Your opponent can't play any Pokémon Tool, Special Energy, or Stadium cards from his or her hand during his or her next turn."
      assert attack.damage == "100"
      assert attack.convertedEnergyCost == 4
      weakness = List.first(card.weaknesses)
      assert weakness.type == "Fairy"
      assert weakness.value == "×2"
    end
  end

  test "throws error on invalid card name" do
    use_cassette "invalid_id" do
      assert_raise(KeyError, fn -> Pokemon.Card.find("zzz") end)
    end
  end

  test "tests WHERE with page size and page returns cards" do
    use_cassette "query_cards_pageSize" do
      cards = Pokemon.Card.where(pageSize: 10, page: 1)
      # make sure we got only 10 cards back
      assert Enum.count(cards) === 10
      assert is_list(cards) === true
      assert List.first(cards) |> is_map == true
      # TODO: TEST THIS assert cards.first.kind_of?(Pokemon.Card)
    end
  end

  test "test_all_returns_cards" do
    use_cassette "all_filtered" do
      cards = Pokemon.Card.where(supertype: "pokemon", subtype: "basic", set: "generations")

      card = List.first(cards)
      assert card.supertype == "Pokémon"
      assert card.subtype == "Basic"
      assert card.set == "Generations"
    end
  end
  test "sample_cards stub returns cards" do
    use_cassette "sample_cards", custom: true  do
      cards = Pokemon.Card.all
      assert Enum.count(cards) === 2
    end
  end
  test "no cards returns no cards" do
    use_cassette "no_cards", custom: true  do
      cards = Pokemon.Card.all
      assert Enum.count(cards) === 0
    end
  end
end
