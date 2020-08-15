extends Node2D

func _ready():
	translate_lang()
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	$MainNode/Music/MusicSlider.value = GlobalVariables.music[0]
	$MainNode/Music/SFXSlider.value = GlobalVariables.music[1]

func translate_lang():
	match GlobalVariables.language:
		"Spanish":
			$MainNode/Title.text = "Configuracion"
			$MainNode/Title/TitleShadow.text = "Configuracion"
			$MainNode/Music/MusicLabel.text = "Musica"
			$MainNode/Other/Stats.text = "Estadisticas"
			$MainNode/Other/Webpage.text = "Pagina web"
			$MainNode/Other/NoAds.text = "Elimina ads"
		"English":
			$MainNode/Title.text = "Configuration"
			$MainNode/Title/TitleShadow.text = "Configuration"
			$MainNode/Music/MusicLabel.text = "Music"
			$MainNode/Other/Stats.text = "Stats"
			$MainNode/Other/Webpage.text = "Webpage"
			$MainNode/Other/NoAds.text = "Remove ads"
