class Universidad {
	var property provincia
	var property honorariosRecomendados
	var donaciones = 0
	method recibirDonacion(importe){
		donaciones += importe
	}
}

object asociacionDelLitoral{
	var totalRecaudado = 0
	method recibirRecaudacion(importe){
		totalRecaudado += importe
	}
}
