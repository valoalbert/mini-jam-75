extends Node

signal soul_grabbed(soul_type) # Connected in LevelScript
signal score_updated(points) # Connected in PointsControlScript

signal soul_delivered # Connected in SoulSpawnSprite
signal game_started # Connected in PlayerControl
signal end_game # Connected in LevelScript
signal fade_in_finised
signal fade_out_finised