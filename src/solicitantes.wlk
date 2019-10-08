class Persona {
	var property provinciaDondeVive
	
	method puedeSerAtendido(unProfesional){
		return unProfesional.provinciasDondePuedeTrabajar().contains(self.provinciaDondeVive())
	}
}

class Institucion {
	var universidadesReconocidas = []
	
	method puedeSerAtendido(unProfesional){
		return universidadesReconocidas.contains(unProfesional.universidad())
	}
}
