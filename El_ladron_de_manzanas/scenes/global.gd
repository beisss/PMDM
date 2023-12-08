extends Node

var worldCount: int = 0

var frutas = 0:
	set(val):
		frutas = val
		if player != null:
			player.actualizaInterfazFrutas()
			$sonido_manzana.play()
	get:
		return frutas
		
var player
