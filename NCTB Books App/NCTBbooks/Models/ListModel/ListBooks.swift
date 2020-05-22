import Foundation
struct ListBooks : Codable {
	let id : Int?
	let name : String?
	let version : String?
	let category : String?
	let fileURL : String?
	let imageURL : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case version = "version"
		case category = "category"
		case fileURL = "fileURL"
		case imageURL = "imageURL"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		fileURL = try values.decodeIfPresent(String.self, forKey: .fileURL)
		imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
	}

}
