import rodados.*

class Dependecioa {
    const property flota = []
    const property pedidos = []
    var property empleados = 0

    method agregarFlota(rodado) {flota.add(rodado)}
    method quitarFlota(rodado) {flota.remove(rodado)}
    method pesoTotalFlota() = flota.sum{{r=>r.peso()}}
    method estaBienEquipado() = self.almenosRodados(3) and self.todosRodadosVelMax(100)
    method almenosRodados(num) =  flota.size() >= num
    method todosRodadosVelMax(num) = flota.all({v=>v.velociadMaxima() >= num}) 

    method totalPasajerosEnPedidos() = pedidos.sum({p=>p.cantPasajeros()})
    method pedidosNoPuedenSerSatifechos() = pedidos.filter({p=> not self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
    method hayAlgunRodadoQueSatisfaceUnPedido(unPedido) = flota.any({r=> unPedido.puedeSatifacer(r)})  

    method todosLosPedidosTienenIncompatible(unColor) = pedidos.all({p=>p.coloresIncopatibles().contains(unColor)})
    method relajarTodosLosPedidos() {pedidos.forEach({p=>p.relajar()})} 

}

class Pedido {
    var property distancia
    var property tiempoMax
    var property cantPasajeros
    const property coloresIncopatibles = []

    method initialize() {
      if(!distancia.between(1, 1000)){
        self.error(distancia.toString() + " no es valida")
      }

      if(!tiempoMax.between(1, 1000)){
        self.error(tiempoMax.toString() + "no es valida")
      }

      if(!cantPasajeros.between(1, 10)){
        self.error(cantPasajeros.toString() + " no es valida")
      }
    }

    method agregarColorIncompatible(unColor) {
      if(!colores.validos().contains(unColor)){
        self.error(unColor.toString() + " no es un color valido")
      }
      coloresIncopatibles.add(unColor)
    }

    method velocidadRequerida() = distancia / tiempoMax
    method puedeSatifacer(unAuto) = 
        unAuto.velociadMaxima() >= self.velocidadRequerida() +10
        && unAuto.capacidad() >= cantPasajeros
        && not self.colorIncompatible(unAuto.color())
    method colorIncompatible(unColor) = coloresIncopatibles.contains(unColor) 

    method acelerar() {tiempoMax = 1.max(tiempoMax -1)}
    method relajar() {tiempoMax = tiempoMax + 1} 
}