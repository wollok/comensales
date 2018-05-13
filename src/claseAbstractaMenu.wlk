
class Comensal {
	
	var propina = 0.2
	
	method elegirPlato(menu)
	method elegirBebida(menu)
	
	method propina(cuentaBase) {
		return cuentaBase * propina
	}
	
	
	method cuenta(menu) {
		var cuentaBase = self.elegirPlato(menu).precio() + self.elegirBebida(menu).precio() 
		return  cuentaBase + self.propina(cuentaBase) 
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
	
	override method propina(cuentaBase) {
		return if (cuentaBase > 80) super(cuentaBase) else 0 
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
	method esAlcoholica() = false
	method precio() = 10 
}
object vino {
	method esAlcoholica() = true
	method precio() = 100
}
object cerveza {
	method esAlcoholica() = true
	method precio() = 50
}
object gaseosa {
	method esAlcoholica() = false
	method precio() = 40
}
object licuado {
	method esAlcoholica() = false
	method precio() = 80
}
object jugo {
	method esAlcoholica() = false
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

