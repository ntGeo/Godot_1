extends Control

func _ready():
	# Buscamos el botón por su nombre y conectamos su señal "pressed"
	# a la función _on_reintentar que se ejecutará al hacer clic.
	$Button.pressed.connect(_on_reintentar)

func _on_reintentar():
	# Recarga la escena principal del juego desde cero,
	# reiniciando posición del jugador, monedas y contador.
	get_tree().change_scene_to_file("res://nivel.tscn")
