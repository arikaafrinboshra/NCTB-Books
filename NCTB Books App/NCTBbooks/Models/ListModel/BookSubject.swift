import Foundation
struct BookSubject : Codable {
	let subject : String?
	let books : [ListBooks]?
    var isCollups : Bool = false

	enum CodingKeys: String, CodingKey {

		case subject = "subject"
		case books = "books"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		subject = try values.decodeIfPresent(String.self, forKey: .subject)
		books = try values.decodeIfPresent([ListBooks].self, forKey: .books)
	}

}
