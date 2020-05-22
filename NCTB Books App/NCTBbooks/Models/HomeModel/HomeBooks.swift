import Foundation
struct HomeBooks : Codable {
	let id : Int?
	let name : String?
	let subject : String?
	let version : String?
	let fileURL : String?
	let imageURL : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case subject = "subject"
		case version = "version"
		case fileURL = "fileURL"
		case imageURL = "imageURL"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		subject = try values.decodeIfPresent(String.self, forKey: .subject)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		fileURL = try values.decodeIfPresent(String.self, forKey: .fileURL)
		imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
	}

}
