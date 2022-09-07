object bombon {
	var peso = 15
	
	method precio() = 5
	method peso() = peso
	method mordisco() { peso = 0.max(peso * 0.8 - 1)}
	method gusto() = "frutilla"
	method libreGluten() = true
}

object alfajor {
	var peso = 300
	method precio() = 1
	method peso() = peso
	method mordisco() { peso = 0.max(peso * 0.8)}
	method gusto() = "chocolate"
	method libreGluten() = false	
}

object caramelo {
		var peso = 300
		
	method precio() = 1
	method peso() = peso
	method mordisco() { peso = 0.max(peso - 1)}
	method gusto() = "frutilla"
	method libreGluten() = false
}

object chupetin {
		var peso = 5
		
	method precio() = 2
	method peso() = peso
	method mordisco() { if(peso>2)peso = peso * 0.9}
	method gusto() = "naranja"
	method libreGluten() = true
}

object oblea {
	var peso = 250
	method precio() = 5
	method peso() = peso
	method mordisco() { if(peso>70)peso = peso *0.5 
						else peso = peso * 0.75
	}
	method gusto() = "vainilla"
	method libreGluten() = false
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method peso(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method precio() = pesoInicial * 0.5
	method gusto() = "chocolate"
	method libreGluten() = false
	method peso() = pesoActual
	method mordisco() = 0.max(pesoActual - 2)
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() = golosinaInterior.precio() + 2
	method peso() = golosinaInterior.peso() + 4 
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -= 2 }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() { return golosinaInterior.gusto() }
	method libreGluten() = golosinaInterior.libreDeGluten()	
}

object tuttifrutti {
	const property peso = 5
	const gustos = ["frutilla", "chocolate","naranja"]
	var property libreDeGluten = false
	var cantMordiscos = 0
	
	method precio() = if(libreDeGluten) 7 else 10
	method mordisco() { cantMordiscos = cantMordiscos + 1}
	method gusto() =gustos.get(cantMordiscos%gustos.size())
}