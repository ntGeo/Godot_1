extends CharacterBody2D

const VELOCIDAD = 100.0
var direccion = 1
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# Conectamos la señal del área para detectar cuando el jugador lo toca
	$AreaDeteccion.body_entered.connect(_on_jugador_tocado)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravedad * delta

	velocity.x = direccion * VELOCIDAD
	move_and_slide()

	# Si choca con una pared invierte la dirección
	if is_on_wall():
		direccion *= -1

func _on_jugador_tocado(body):
	if body.name == "Jugador":
		# Verificamos si el jugador viene desde arriba
		# Si la velocidad Y del jugador es positiva, está cayendo = saltó encima
		if body.velocity.y > 0:
			# El jugador saltó encima — eliminamos el enemigo
			# y hacemos que el jugador rebote un poco hacia arriba
			body.velocity.y = -200.0
			queue_free()
		else:
			# El jugador tocó al enemigo de lado — Game Over
			get_tree().change_scene_to_file("res://game_over.tscn")
