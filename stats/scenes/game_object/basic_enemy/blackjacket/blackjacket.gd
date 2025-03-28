extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var team: String = ""

func setTeam(teamonspawn: String) -> void:
	team = teamonspawn
