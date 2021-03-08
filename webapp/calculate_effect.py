# calculate the supereffect of the attacker against defender 
# part of the pokemon database website written by Ross Grogan-Kaylor and Jimmy Zhong

word_maps_col_row_num = {
    "fire":0,
    "water":1,
    "bug":2,
    "poison":3,
    "electric":4,
    "fairy":5,
    "fighting":6,
    "psychic":7,
    "ground":8,
    "normal":9,
    "grass":10,
    "dragon":11,
    "rock":12,
    "dark":13,
    "ghost":14,
    "ice":15,
    "steel":16,
    "flying":17}

effect_matrix = [[0.5,2,0.5,1,1,0.5,1,1,2,1,0.5,1,2,1,1,0.5,0.5,1],
    [0.5,0.5,1,1,2,1,1,1,1,1,2,1,1,1,1,0.5,0.5,1],
    [2,1,1,1,1,1,0.5,1,0.5,1,0.5,1,2,1,1,1,1,2],
    [1,1,0.5,0.5,1,0.5,0.5,2,2,1,0.5,1,1,1,1,1,1,1],
    [1,1,1,1,0.5,1,1,1,2,1,1,1,1,1,1,1,0.5,0.5],
    [1,1,0.5,2,1,1,0.5,1,1,1,1,0,1,0.5,1,1,2,1],
    [1,1,0.5,1,1,2,1,2,1,1,1,1,0.5,0.5,1,1,1,2],
    [1,1,2,1,1,1,0.5,0.5,1,1,1,1,1,2,2,1,1,1],
    [1,2,1,0.5,0,1,1,1,1,1,2,1,0.5,1,1,2,1,1],
    [1,1,1,1,1,1,2,1,1,1,1,1,1,1,0,1,1,1],
    [2,0.5,2,2,0.5,1,1,1,0.5,1,0.5,1,1,1,1,2,1,2],
    [0.5,0.5,1,1,0.5,2,1,1,1,1,0.5,2,1,1,1,2,1,1],
    [0.5,2,1,0.5,1,1,2,1,2,0.5,2,1,1,1,1,1,2,0.5],
    [1,1,2,1,1,2,2,0,1,1,1,1,1,0.5,0.5,1,1,1],
    [1,1,0.5,0.5,1,1,0,1,1,0,1,1,1,2,2,1,1,1],
    [2,1,1,1,1,1,2,1,1,1,1,1,2,1,1,0.5,2,1],
    [2,1,0.5,0,1,0.5,2,0.5,2,0.5,0.5,0.5,0.5,1,1,0.5,0.5,0.5],
    [1,1,0.5,1,2,1,0.5,1,0,1,0.5,1,2,1,1,2,1,1]]

def single_against_single(attack, defend):
    attack_num = word_maps_col_row_num[attack]
    defend_num = word_maps_col_row_num[defend]
    return effect_matrix[defend_num][attack_num]

def single_against_all_single(attacker):
    return_list = []
    for defender in word_maps_col_row_num:
        effect = single_against_single(attacker, defender)
        if effect != 1: # only cares about supereffect, normal effect doesn't count
            return_list.append([defender, effect])
    return return_list

def double_against_single(attack, defend):
    attack_types = attack.split("_")
    effect_1 = single_against_single(attack_types[0], defend)
    effect_2 = single_against_single(attack_types[1], defend)
    sum_effect = effect_1 + effect_2
    if effect_1 == effect_2 and effect_1 == 2:
        return sum_effect
    elif effect_1 == 0 or effect_2 == 0:
        return sum_effect/4
    else:
        return sum_effect/2

def double_against_all_single(attacker):
    # example: double_against_single("fire_fighting", "ice")
    return_map = {}
    for defender in word_maps_col_row_num:
        effect = double_against_single(attacker, defender)
        if effect != 1: # only cares about supereffect, normal effect doesn't count
            return_map[defender] = effect
    return return_map

'''
According to officical pokemon: double-supereffect => combine effect: 4
if 1 is immune => combine effect: (sum_effect)/4
if no immune or double-supereffect => combine effect: (sum_effect)/2

def single_against_double(attack, defend):
    defend_types = defend.split("_")
    effect_1 = single_against_single(attack, defend_types[0])
    effect_2 = single_against_single(attack, defend_types[1])
    sum_effect = effect_1 + effect_2
    if effect_1 == effect_2 and effect_1 == 2:
        return sum_effect
    elif effect_1 == 0 or effect_2 == 0:
        return sum_effect/4
    else:
        return sum_effect/2
'''



def main():
    print(single_against_single("fire", "water"))
    print(single_against_single("water", "fire"))
    print(single_against_single("flying", "grass"))
    print(single_against_single("grass", "flying"))

    #print(single_against_double("grass", "water_ground"))
    #print(single_against_double("electric", "ground_fire"))

    print(double_against_single("fire_fighting", "ice"))
    print(double_against_single("electric_water", "ground"))


if __name__ == "__main__":
    main()