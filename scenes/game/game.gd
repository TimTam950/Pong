extends Node2D

@onready var player_score_label: Label = $Control/PlayerScore
@onready var ai_score_label: Label = $Control/AIScore
@onready var respawn_timer: Timer = $RespawnTimer
const BALL = preload("res://scenes/ball/ball.tscn")

var starting_score = 0
var player_score := 0
var ai_score := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_score_label.text = "%s" % starting_score
	ai_score_label.text = "%s" % starting_score

func _on_player_score_zone_body_entered(body: Node2D) -> void:
	player_score += 1
	player_score_label.text = str(player_score)
	body.queue_free()
	check_score()
	respawn_timer.start()

func _on_ai_score_zone_body_entered(body: Node2D) -> void:
	ai_score += 1
	ai_score_label.text = str(ai_score)
	body.queue_free()
	check_score()
	respawn_timer.start()


func _on_respawn_timer_timeout() -> void:
	var ball = BALL.instantiate()
	ball.position = get_viewport_rect().size / 2
	add_child(ball)
	pass
	
func check_score():
	if ai_score == 5:
		var game_over_scene: PackedScene = load("res://scenes/game_over/game_over.tscn")
		State.winner = "AI"
		get_tree().change_scene_to_packed(game_over_scene)
	if player_score == 5:
		var game_over_scene: PackedScene = load("res://scenes/game_over/game_over.tscn")
		State.winner = "Player"
		get_tree().change_scene_to_packed(game_over_scene)
