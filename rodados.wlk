import wollok.vm.*
class Corsa {
  var property color = "azul"

  method velociadaMax() = 150
  method capacidad() = 4
  method peso() = 1300   

}

class Kwid {
  var property tanqueAdicional = false

  method capacidad() = if(tanqueAdicional) 3 else 4
  method peso() = if(tanqueAdicional) 1350 else 1200
  method velocidadMax() = if(tanqueAdicional ) 120 else 110
  method color() = "azul" 
}

object trafic {
    var property interior = comodo
    var property motor = pulenta

    method capacidad() = interior.capacidad()
    method velocidadMaxima() =  motor.velMax()
    method color() = "blanco"
    method peso() = 4000 + interior.peso() + motor.peso()
}

class Especial {
  var property peso = 0
  var property velociadMaxima = 0
  var property color = "blanco"
  var property capacidad = 4
}

object comodo {
  method peso() = 700
  method capacidad() = 5 
}
object popular {
  method peso() = 1000
  method capacidad() = 12
}
object pulenta {
  method peso() = 800
  method velMax() = 130
}
object bataton {
  method peso() = 500
  method velMax() = 80
}