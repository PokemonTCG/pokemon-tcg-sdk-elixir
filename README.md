# Pokémon TCG SDK

This is the Pokémon TCG SDK Elixir implementation. It is a wrapper around the Pokémon TCG API of [pokemontcg.io](http://pokemontcg.io/).

## Installation

The package can be installed as:

  1. Add `pokemon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:pokemon, "~> 1.0", hex: :pokemon_tcg_sdk}]
    end
    ```

  2. Ensure `pokemon` is started before your application:

    ```elixir
    def application do
      [applications: [:pokemon]]
    end
    ```

### Modules

    Card
    Set
    Type
    Supertype
    Subtype

### Properties Per Class

#### Card

    id
    name
    national_pokedex_number
    image_url
    subtype
    supertype
    ability
    hp
    number
    artist
    rarity
    series
    set
    set_code
    retreat_cost
    text
    types
    attacks
    weaknesses
    resistances

#### Set

    code
    name
    series
    total_cards
    standard_legal
    release_date

#### Ability

    name
    text

#### Attack

    cost
    name
    text
    damage
    converted_energy_cost

#### TypeValue

    type
    value

### Functions Available

#### Find a card by id

    card = Pokemon.Card.find("xy1-1")

#### Filter Cards via query parameters

    cards = Pokemon.Card.where(set: "generations", superType: "pokemon")

#### Find all cards (will take awhile)

    cards = Pokemon.Card.all

#### Get all cards, but only a specific page of data

    cards = Pokemon.Card.where(page: 5, pageSize: 100)

#### Find a set by code

    set = Pokemon.Set.find("base1")

#### Filter sets via query parameters

    sets = Pokemon.Set.where(standardLegal: true)

#### Get all Sets

    sets = Pokemon.Set.all

#### Get all Types

    types = Pokemon.Type.all

#### Get all Subtypes

    subtypes = Pokemon.Subtype.all

#### Get all Supertypes

    supertypes = Pokemon.Supertype.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pokemon-tcg-sdk-elixir/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
