import Foundation
struct BookCategory : Codable {
	let category : String?
	let books : [HomeBooks]?
    var done:Bool = false
    //let taskArray:[Int]?

	enum CodingKeys: String, CodingKey {

		case category = "category"
		case books = "books"
        
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		books = try values.decodeIfPresent([HomeBooks].self, forKey: .books)
	}

}
