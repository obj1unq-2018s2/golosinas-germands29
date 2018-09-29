import golosinas.*

object mariano {

	var bolsaDeGolosinas= []

	method comprar(golosina) { bolsaDeGolosinas.add(golosina) }
	
	method desechar(golosina){ bolsaDeGolosinas.remove(golosina) }

	method golosinas() { return bolsaDeGolosinas }
	
	method probarGolosinas() { bolsaDeGolosinas.forEach{golosina => golosina.mordisco()} }
	
	method hayGolosinaSinTACC(){ return bolsaDeGolosinas.any {golosina => golosina.libreGluten() } }
	
	method preciosCuidados(){ return  bolsaDeGolosinas.all {golosina => golosina.precio() <= 10 } }
	
	method golosinaDeSabor(unSabor){return bolsaDeGolosinas.find{golosina => golosina.gusto()== unSabor}}
	
	method golosinasDeSabor(unSabor){return bolsaDeGolosinas.filter{golosina => golosina.gusto()== unSabor}}
	
	// esto se podia resolver simplemente con bolsaDeGolosinas.map(golosina => golosina.gusto())
	method sabores(){ 
		var listaDeSabores = []
		bolsaDeGolosinas.forEach{golosina => listaDeSabores.add(golosina.gusto())}
		return listaDeSabores.withoutDuplicates()		
	}

	method golosinaMasCara(){return bolsaDeGolosinas.max{golosina => golosina.precio()} 	}
	
	method pesoGolosinas(){	return bolsaDeGolosinas.sum{golosina => golosina.peso()}}
	
	method golosinasFaltantes(golosinasDeseadas){
		return golosinasDeseadas.filter{golosina => !bolsaDeGolosinas.contains(golosina)}
	}
	
	// el filter no modifica la coleccion, retorna una nueva, no hace falta
	// guardarla previamente en una variable.
	method gustosFaltantes(gustosDeseados){
		var gustosDeLaBolsa = self.sabores()
		return gustosDeseados.filter{gusto => !gustosDeLaBolsa.contains(gusto)}
	}
	

}

