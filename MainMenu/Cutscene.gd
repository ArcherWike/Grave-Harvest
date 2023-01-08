extends Node2D

var mainGameScene = load("res://World.tscn")
onready var videoPlayer = $VideoPlayer
onready var timer = $Timer
onready var sprite = $Sprite

func _ready():
	sprite.visible = true
	videoPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	videoPlayer.paused = true
	$AnimationPlayer.play("ScaleToBig")
	sprite.visible = false

func _on_ScaleToBig_Animation_finished():
	videoPlayer.paused = false

func _on_VideoPlayer_finished():
	timer.start()

func _on_Timer_timeout():
	print("1")
	$AnimationPlayer.play("ScaleToSmall")

func _on_ScaleToSmall_Animation_finished():
	get_tree().change_scene(mainGameScene.resource_path)
