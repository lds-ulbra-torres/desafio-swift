import Foundation

struct ApiPersons: Decodable {
    let count: Int
    let next: String?
    let results: [Persons]
    
}

struct Persons: Decodable{
    let name, height, mass, hair_color: String
    let skin_color, eye_color, birth_year, gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
}

