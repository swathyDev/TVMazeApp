/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ShowList : Codable {
	let id : Int?
	let url : String?
	let name : String?
	let type : String?
	let language : String?
	let genres : [String]?
	let status : String?
	let runtime : Int?
	let averageRuntime : Int?
	let premiered : String?
	let officialSite : String?
	let schedule : Schedule?
	let rating : Rating?
	let weight : Int?
	let network : Network?
	let webChannel : WebChannel?
	let dvdCountry : String?
	let externals : Externals?
	let image : Image?
	let summary : String?
	let updated : Int?
	let links : Links?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case url = "url"
		case name = "name"
		case type = "type"
		case language = "language"
		case genres = "genres"
		case status = "status"
		case runtime = "runtime"
		case averageRuntime = "averageRuntime"
		case premiered = "premiered"
		case officialSite = "officialSite"
		case schedule = "schedule"
		case rating = "rating"
		case weight = "weight"
		case network = "network"
		case webChannel = "webChannel"
		case dvdCountry = "dvdCountry"
		case externals = "externals"
		case image = "image"
		case summary = "summary"
		case updated = "updated"
		case links = "links"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		genres = try values.decodeIfPresent([String].self, forKey: .genres)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
		averageRuntime = try values.decodeIfPresent(Int.self, forKey: .averageRuntime)
		premiered = try values.decodeIfPresent(String.self, forKey: .premiered)
		officialSite = try values.decodeIfPresent(String.self, forKey: .officialSite)
		schedule = try values.decodeIfPresent(Schedule.self, forKey: .schedule)
		rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
		weight = try values.decodeIfPresent(Int.self, forKey: .weight)
		network = try values.decodeIfPresent(Network.self, forKey: .network)
		webChannel = try values.decodeIfPresent(WebChannel.self, forKey: .webChannel)
		dvdCountry = try values.decodeIfPresent(String.self, forKey: .dvdCountry)
		externals = try values.decodeIfPresent(Externals.self, forKey: .externals)
		image = try values.decodeIfPresent(Image.self, forKey: .image)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		updated = try values.decodeIfPresent(Int.self, forKey: .updated)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
	}

}
