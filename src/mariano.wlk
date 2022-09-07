import golosinas.*

object mariano {
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var golosinas = []
	var golosinasDesechadas = []
	method comprar(unaGolosina){golosinas.add(unaGolosina)}
	method comprarVarias(lista){golosinas.addAll(lista)}
	method vaciarBolsa() {golosinas.clear()}
	
	method desechar(unaGolosina){
		golosinas.remove(unaGolosina)
		golosinasDesechadas.add(unaGolosina)
	}
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosinas(){
		golosinas.forEach({ g => g.mordisco()})
	}
	method hayGolosinasSinTac() = golosinas.any({g => g.libreGluten()})
	method preciosCuidados() = golosinas.all({g => g.precio() <= 10})
	method golosinaDeSabor(unSabor) = golosinas.find({g => g.gusto()== unSabor})
	method golosinasDeSabor(unSabor) = golosinas.filter({g => g.gusto() == unSabor})
	method sabores() = golosinas.map({g => g.gustos()}).asSet()
	method golosinaMasCara() = golosinas.max({g => g.precio()})
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	method golosinasFaltantes(golosinasDeseadas)= 
					golosinasDeseadas.asSet().differece(golosinas.asSet())
	method gustosFaltantes(gustosDeseados) = 
				gustosDeseados.asSet().difference(self.sabores())
				
	method gastoEn(sabor) = self.golosinasDeSabor(sabor).sum({g => g.precio()})
	method precioGolosinaMasCaraDeUnSabor(sabor)= 
			self.golosinasDeSabor(sabor).max({g=>g.precio()}).precio()
	
 	method cantidadGolosinasDeUnSabor(unSabor)= 
			self.golosinasDeSabor(unSabor).size()
	method saborMasPopular()= 
		self.sabores().max({unSabor=>self.cantidadGolosinasDeUnSabor(unSabor)})
	
	/*method saborMasPesado()=completar */
	method comproYDesecho(golosina)=
		golosinasDesechadas.contains(golosina)
}

