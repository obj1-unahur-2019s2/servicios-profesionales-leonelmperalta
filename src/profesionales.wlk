import universidad.*


class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	method honorariosPorHora() { return 3000 }
	method cobrar(importe){
		asociacionDelLitoral.recibirRecaudacion(importe)
	}
}



class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = return #{universidad.provincia()}
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
	method cobrar(importe){
		universidad.recibirDonacion(importe / 2)
	}
}



class ProfesionalLibre {
	var property universidad
	var provinciasDondePuedeTrabajar = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method provinciasDondePuedeTrabajar(conjuntoDeProvincias){
		provinciasDondePuedeTrabajar = provinciasDondePuedeTrabajar + conjuntoDeProvincias
	}
	method provinciasDondePuedeTrabajar(){
		return provinciasDondePuedeTrabajar
	}
	
	method cobrar(importe){
		totalRecaudado += importe
	}
	method pasarDinero(otroProfesional, importe){
		otroProfesional.cobrar(importe)
	}
}
