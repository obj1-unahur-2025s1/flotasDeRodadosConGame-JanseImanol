import rodados.*

class Dependecioa {
    const property flota = []
    var property empleados = 0

    method agregarFlota(rodado) {flota.add(rodado)}
    method quitarFlota(rodado) {flota.remove(rodado)}
    method pesoTotalFlota() = flota.sum{{r=>r.peso()}}
    method estaBienEquipado() = self.almenosRodados(3) and self.todosRodadosVelMax(100)
    method almenosRodados(num) =  flota.size() >= num
    method todosRodadosVelMax(num) = flota.all({v=>v.velociadMaxima() >= num}) 

}