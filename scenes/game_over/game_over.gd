extends Control

class_name GameOver

var winning_player: String
@onready var player_wins_label: Label = $PlayerWinsLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_wins_label.text = "%s Wins!" % State.winner


func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")
