import Foundation

struct Venue {
  
  let name: String
  let lake: Bool
  let tackleShop: Bool
  let address: Address
  let description: String
  let amenities: Ameneties
  
}

struct Address {
  
  let street: String
  let town: String
  let county: String
  let postcode: String
  
}

struct Ameneties {

  let numberOfLakes: Int?
  let toilets: Bool?
  let showers: Bool?
  let foodAndDrink: Bool?
  let nightFishing: Bool?
  let wheelchairAccess: Bool?
  let guestsAllowed: Bool?
  let trolleyHire: Bool?
  let takeawayFriendly: Bool?
  let animalFriendly: Bool?
  let tuition: Bool?
  let electricity: Bool?
  let equipmentHire: Bool?
  let wifi: Bool?
  let camping: Bool?
  
  enum CodingKeys: String, CodingKey {
    
    case numberOfLakes    = "num_of_lakes"
    case toilets
    case showers
    case foodAndDrink     = "food_and_drink"
    case nightFishing     = "night_fishing"
    case wheelchairAccess = "wheelchair_access"
    case guestsAllowed    = "guests_allowed"
    case trolleyHire      = "trolley_hire"
    case takeawayFriendly = "takeaway_friendly"
    case animalFriendly   = "animal_friendly"
    case tuition
    case electricity
    case equipmentHire    = "equipment_hire"
    case wifi
    case camping
  }
  
}
