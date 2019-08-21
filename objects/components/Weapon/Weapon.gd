extends Node

export(int) var dice = 0
export(int) var adds = 0
export(String) var description = " "
# Any special attack modifiers go here
export(String, "attack", "hp_drain") var special_attack = "attack"

func equip(weapon_name, dice, adds):
	var fighter = GameData.player.fighter
	fighter.weapon_equipped = true
	fighter.weapon_dice = dice
	fighter.weapon_adds = adds
	fighter.weapon_modifier = special_attack
	get_parent().get_node('Item').equipped = true
	GameData.broadcast(weapon_name + " has been equipped, +" + str(dice)+"D"+str(adds) + " to Attack")

func unequip(weapon_name, dice, adds):
	var fighter = GameData.player.fighter
	fighter.weapon_equipped = false
	fighter.weapon_dice -= dice
	fighter.weapon_adds -= adds
	get_parent().get_node('Item').equipped = false
	GameData.broadcast(weapon_name + " unequipped")