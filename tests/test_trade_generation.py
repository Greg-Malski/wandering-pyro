import json
import unittest
from pathlib import Path


ROOT = Path(__file__).parents[1]
FUNCTIONS = ROOT / "data" / "fireworks" / "function"


def read_function(name: str) -> str:
    return (FUNCTIONS / name).read_text()


class TradeGenerationTests(unittest.TestCase):
    def test_pyro_conversion_preserves_processed_marker(self):
        content = read_function("convert_to_pyro.mcfunction")
        self.assertIn('Tags:["pyro_trader","fireworks_checked"]', content)

    def test_trade_helpers_only_append_when_loot_exists(self):
        for name in ("add_buy_trade.mcfunction", "add_supply_trade.mcfunction"):
            with self.subTest(name=name):
                content = read_function(name)
                self.assertIn(
                    "execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes append",
                    content,
                )
                self.assertIn(
                    "execute if data block ~ 319 ~ Items[0] run data modify entity @s Offers.Recipes[-1]",
                    content,
                )

    def test_pyro_keeps_three_rocket_two_buy_five_supply_slots(self):
        content = read_function("convert_to_pyro.mcfunction")
        self.assertEqual(content.count("function fireworks:add_rocket_trade"), 3)
        self.assertEqual(content.count("function fireworks:add_buy_trade"), 2)
        self.assertEqual(content.count("function fireworks:add_supply_trade"), 5)

    def test_all_json_files_parse(self):
        for path in ROOT.rglob("*.json"):
            with self.subTest(path=path):
                json.loads(path.read_text())


if __name__ == "__main__":
    unittest.main()
