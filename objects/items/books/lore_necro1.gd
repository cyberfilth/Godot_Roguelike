extends Node2D

var book_contents = ["\"As it is written in the Book of "+PlotGen.mage+".\nVictorius wizards win first, then go to war.\nDefeated wizards go to war first, then try to win.\"",\
"\"For life is short, and death is long.\nThese rotten zombies don\'t half pong...\"\n -A short poem by Davgrim the reluctant, apprentice Necromancer"]

func _ready():
	pass

func read_book():
	var passage = book_contents[GameData.roll(0, book_contents.size()-1)]
	GameData.broadcast("You read the pages of the book...", GameData.COLOR_LIGHT_BLUE)
	GameData.broadcast(passage, GameData.COLOR_YELLOW)
	boost_stat()

func boost_stat():
	var boost = GameData.roll(0,2)
	if boost == 0:
		GameData.broadcast("Your new knowledge inspires you. Your attack strength has increased +1", GameData.COLOR_GREEN)
		GameData.player.fighter.attack += 1
	if boost == 1:
		GameData.broadcast("A new determination fills you. Your defence ability has increased +1", GameData.COLOR_GREEN)
		GameData.player.fighter.defence += 1
	if boost == 2:
		GameData.broadcast("The power of the written runes changes you. Your Max Health has increased +10", GameData.COLOR_GREEN)
		GameData.player.fighter.max_hp += 10