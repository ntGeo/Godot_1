extends Control

func _ready():
	# Conectamos el botón para que cargue el nivel al presionarlo
	$BtnJugar.pressed.connect(_on_jugar)

func _on_jugar():
	# Cambia a la escena del nivel principal
	get_tree().change_scene_to_file("res://nivel.tscn")
