class EmpresaDeServicios {
	var profesionales = #{}
	var clientes = #{}
	var honorarioDeReferencia
	
	method darServicio(unSolicitante){
		if(profesionales.puedeSatisfacer(unSolicitante)){
			var posiblesParaAtender = self.cualesPuedenSatisfacer(unSolicitante)
			var elegido = posiblesParaAtender.anyOne()
			elegido.cobrar(elegido.honorariosPorHora())
			clientes.add(unSolicitante)
		}
		else{
			
		}
	}
	method honorarioDeReferencia(honorario){
		honorarioDeReferencia = honorario
	}
	method profesionalesGraduadosDe(universidad){
		return profesionales.count({p => p.universidad() == universidad})
	}
	method profesionalesCaros(){
		return profesionales.filter({p => p.honorariosPorHora() > honorarioDeReferencia})
	}
	method universidadesFormadoras(){
		var universidades = #{}
		profesionales.forEach({p => universidades.add(p.universidad())})
		return universidades
	}
	method profesionalMasBarato(){
		return profesionales.min({p => p.honorariosPorHora()})
	}
	method esDeGenteAcotada(){
		return not profesionales.any({p => p.provinciasDondePuedeTrabajar().size() > 3})
	}
	method puedeSatisfacer(unSolicitante){
		return profesionales.any({p => unSolicitante.puedeSerAtendido(p)})
	}
	method cualesPuedenSatisfacer(unSolicitante){
		return profesionales.filter({p => unSolicitante.puedeSerAtendido(p)})
	}
	method cuantosClientes(){
		return clientes.size()
	}
	method esCliente(unSolicitante){
		return clientes.contains(unSolicitante)
	}
	method provinciasCubiertas(){
		var provincias = #{}
		profesionales.forEach({p => provincias = provincias + p.provinciasDondePuedeTrabajar()})
		return provincias
	}
	method otroCobraMasBaratoYPuedeCubrirProvincia(unProfesional){
		var provinciasDondePuedeTrabajar = unProfesional.provinciasDondePuedeTrabajar()
		return profesionales.any({p => p.honorariosPorHora() < unProfesional.honorariosPorHora()}) and 
			profesionales.any({p => provinciasDondePuedeTrabajar.forEach({prov => p.provinciasDondePuedeTrabajar().contains(prov)})})
	}
	
	method esPocoAtractivo(unProfesional){
		return self.otroCobraMasBaratoYPuedeCubrirProvincia(unProfesional)
	}
}
