//
//  LinksModel.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import Foundation

struct LinksModel: Codable, Hashable {
    var status : Bool?
    var statusCode : Int?
    var message : String?
    var supportWhatsappNumber : String?
    var extraIncome : Float?
    var totalLinks : Int?
    var totalClicks : Int?
    var todayClicks : Int?
    var topSource : String?
    var topLocation : String?
    var startTime : String?
    var linksCreatedToday : Int?
    var appliedCampaign : Int?
    var data : DataModel?
    
    enum CodingKeys: String, CodingKey {
        
        case status, statusCode, message, data, startTime
        case supportWhatsappNumber = "support_whatsapp_number"
        case extraIncome = "extra_income"
        case totalLinks = "total_links"
        case totalClicks = "total_clicks"
        case todayClicks = "today_clicks"
        case topSource = "top_source"
        case topLocation = "top_location"
        case linksCreatedToday = "links_created_today"
        case appliedCampaign = "applied_campaign"
    }
    

}

struct DataModel: Codable, Hashable {
    var recentLinks : [LinkData?]
    var topLinks : [LinkData?]
    var overallChartData : [String: Int]
    enum CodingKeys: String, CodingKey {

        case recentLinks = "recent_links"
        case topLinks = "top_links"
        case overallChartData = "overall_url_chart"
    }
 
}

struct LinkData: Codable, Hashable {
    var urlID : Double?
    var webLink : String?
    var smartLink : String?
    var title : String?
    var totalClicks : Int?
    var originalImage : String?
    var thumbnail : String?
    var timesAgo : String?
    var createdAt : String?
    var domainID : String?
    var urlPreffix : String?
    var urlSuffix : String?
    var app : String?

    enum CodingKeys: String, CodingKey {
        
        case title, thumbnail, app
        case urlID = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case timesAgo = "times_ago"
        case createdAt = "created_at"
        case domainID = "domain_id"
        case urlPreffix = "url_prefix"
        case urlSuffix = "url_suffix"
    }
    

}

