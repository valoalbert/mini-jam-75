extends Node2D

var dialog_dictionary : Dictionary = {}

func load_dictionary() -> void:
	dialog_dictionary = {
		"intro_dialog" : { 
			"id_dialog_1" : tr("START1"),
			"id_dialog_2" : tr("START2"),
			"id_dialog_3" : tr("START3"),
			"id_dialog_4" : "(...)"
		},
		"ingame" : {
			"id_dialog_1" : tr("FORTYTWO")
		},
		"endgame" : {
			"id_dialog_1" : tr("MAY_RED"),
			"id_dialog_2" : tr("MAY_GREEN"),
			"id_dialog_3" : tr("SAME")
		}
	}
