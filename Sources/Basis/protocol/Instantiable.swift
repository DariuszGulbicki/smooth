public protocol Instantiable {
    
    associatedtype Class

    func instantiate() -> Class

}