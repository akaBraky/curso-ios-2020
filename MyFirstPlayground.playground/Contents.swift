import UIKit

var str = "Hello, playground"
class Album {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
    }
    func getPerformance() -> String {
        return "The album \(nombre) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(nombre: String, studio: String) {
        self.studio = studio
        super.init(nombre: nombre)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(nombre) sold lots"
    }
}
