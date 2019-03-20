defmodule SendleCodeTestTest do
  use ExUnit.Case

  setup do
    zone_file = Path.join([:code.priv_dir(:sendle_code_test), "zones.csv"])
    price_file = Path.join([:code.priv_dir(:sendle_code_test), "prices.csv"])

    {
      :ok,
      pricing: SendleCodeTest.new(zones: zone_file, prices: price_file)
    }
  end

  test "the pricing system works", %{pricing: pricing} do
    shipments = [
      # You'll need to fill in this list and so it produces the
      # expected_display when it's run through the quote system.
      # You can model this data structure as you please.
    ]

    quotes = SendleCodeTest.get_quotes(pricing, shipments)
    display = SendleCodeTest.print_quotes(quotes)

    # For extra credit, make this layout nicer :)
    #
    expected_display = """
    Quote Report

    Brisbane, 4000 to Brisbane, 4000, 200gm: $4.10
    Adelaide, 5000 to Sydney, 2000, 4000gm: $9.50
    Sydney, 2000 to Glebe, 2037, 5000gm: $10.20
    Perth, 6000 to Brisbane, 4000, 10000gm: $14.90
    Melbourne, 3000 to Modbury, 5092, 12000gm: -
    South Perth, 6151 to Brisbane, 4000, 8000gm: -
    Fremantle, 6160 to Adelaide, 5000, 500gm: $4.50

    Total: $43.20
    """

    assert expected_display == display
  end
end
