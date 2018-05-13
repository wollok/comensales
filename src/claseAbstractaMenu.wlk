
class Comensal {
	
	var propina = 0.2
	
	method elegirPlato(menu)
	method elegirBebida(menu)
	
	method propina(cuentaBase) {
		return cuentaBase * propina
	}
	
	method gasto(menu) {
		const cuenta = self.elegirPlato(menu).precio() + self.elegirBebida(menu).precio() 
		return  cuenta + self.propina(cuenta) 
	}	
}

class Ricachon inherits Comensal {

	override method elegirPlato(menu) {
		return menu.platos().max{ plato => plato.precio() }
	}

	override method elegirBebida(menu) {
		return menu.bebidas().max{ bebida => bebida.precio() }
	}
}

class Gasolero inherits Comensal {
	override method elegirPlato(menu) {
		return menu.platos().min{ plato => plato.precio() }
	}

	override method elegirBebida(menu) {
		return menu.bebidas().min{ bebida => bebida.precio() }
	}
}

class GasoleroPlus inherits Gasolero {
	
	override method propina(cuenta) {
		return if (cuenta > 80) super(cuenta) else 0 
	}
}

class Menu {

	method bebidas() {
		return #{ gaseosa, vino, cerveza, agua }
	}

}

class MenuParrilla inherits Menu {

	method platos() {
		return #{ asado, vacio, choripan }
	}

}

class MenuMinutas inherits Menu {

	method platos() {
		return #{ milanesa, hamburguesa, papasFritas }
	}

}

class MenuGourmet inherits Menu {

	method platos() {
		return #{ sushi, conejo, ensaladaWaldorf }
	}

	override method bebidas() {
		return super() + #{ licuado, jugo }
	}

}

object agua {
	method precio() = 10 
}
object vino {
	method precio() = 100
}
object cerveza {
	method precio() = 50
}
object gaseosa {
	method precio() = 40
}
object licuado {
	method precio() = 80
}
object jugo {
	method precio() = 40
}

object asado {	
	method precio() = 100
}

object vacio {
	method precio() = 120
}

object choripan {
	method precio() = 50
}

object milanesa {
	method precio() = 80
}

object hamburguesa {
	method precio() = 60
}

object papasFritas {
	method precio() = 30
}

object sushi {
	 method precio() = 140
}

object conejo {
	method precio() = 160
}

object ensaladaWaldorf {
	method precio() = 80
}

