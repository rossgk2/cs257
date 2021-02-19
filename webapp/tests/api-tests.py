'''
Ross Grogan-Kaylor and Jimmy Zhong
'''
import pokeapi
import unittest
import csv
import json

def parse_csv_to_json(csv_file):
	with open(csv_file) as file:
		read_in_file = list((csv.reader(file, skipinitialspace=True)))
	csv_built_dict = {}
	for each_row in read_in_file[1:]:
		if len(each_row) > 1:
			ID = each_row[0]
			ability = each_row[1]
			csv_built_dict[ability] = ID
	return json.dumps(csv_built_dict)

region_csv_file = "../region_table.csv"
ability_csv_file = "../ability_table.csv"
print(parse_csv_to_json(region_csv_file))
print(parse_csv_to_json(ability_csv_file))

class APICheckerTester(unittest.TestCase):
	def setUp(self):
		self.pokeapi = pokeapi.pokeapi() 
		pass

	def tearDown(self):
		pass

	def test_types(self):
		'''
		Tests the API endpoint /types
		'''
		expected_types = ["normal", "water", "electric", "fighting", "ground", "psychic", "rock", "dark", "steel",
		"fire", "grass", "ice", "poison", "flying", "bug", "ghost", "dragon", "fairy"]
		self.assertCountEqual(expected_types, self.pokeapi.get_types()) # assertCountEqual() is misleadingly named- it checks if two lists are equal (ignoring order)

	def test_abilities(self):
		'''
		Tests the API endpoint /abilities
		'''
		# There are 100+ abilitites. We will check for a couple.
		required_abilities = ["adaptability", "chlorophyll", "hydration", "normalize", "sand veil", "super luck", "water bubble"]
		abilities = self.pokeapi.get_abilities()
		for a in required_abilities:
			self.assertIn(a, abilities) # asserts that a must be in abilities

	def test_region(self):
		required_regions = parse_csv_to_json(region_csv_file)
		program_output_region = self.pokeapi.get_regions()
		self.assertAlmostEqual(required_regions, program_output_region)

	def test_growth_type(self):
		'''
		Tests the API endpoint /growth_types
		'''
		pass

	def test_egg_groups(self):
		'''
		Tests the API endpoint /egg_groups
		'''
		pass

	def test_pokemon(self):
		'''
		Tests the API endpoint pokemon/[_pokemon]
		'''
		pass

	def test_advanced_search(self):
		'''
		Tests the API endpoint /pokemon/?[id_range=_id_range]&[name_contains=_name_contains]&[legendary=_leg]&[type1=_type1]&[type2=_type2]&
		[ability1=_ability1]&[ability2=_ability2]&[hidden_ability=_hidden_ability]&[health_range=_health_range]&[attack_range=_attack_range]&
		[defense_range=_defense_range]&[special_attack_range=_special_attack_range]&[special_defense_range=_special_defense_range]&
		[speed_range=_speed_range]&[region=_region]&[catch_rate_range=_catch_rate_range]&[growth_type=&growth_type]&
		[male_percent_range=_male_percent_range]&[game=_game]&[egg_group1=_egg_group_1]&[egg_group2=_egg_group2]&
		[sort_field=_sort_field]&[sort_type=_sort_type]
		'''
		pass

# For reference:
#
# self.assertRaises(ValueError, self.prime_checker.is_prime, -5)
# self.assertTrue(self.prime_checker.is_prime(2))
# self.assertFalse(self.prime_checker.is_prime(96))
# self.assertEqual(self.prime_checker.get_primes_below(20), [2, 3, 5, 7, 11, 13, 17, 19])

if __name__ == '__main__':
    unittest.main()

