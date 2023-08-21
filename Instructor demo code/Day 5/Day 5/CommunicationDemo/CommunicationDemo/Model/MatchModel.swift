//
//  MatchModel.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import Foundation

// MARK: - CricketMatches
struct CricketMatches: Codable {
    let typeMatches: [TypeMatch]
    let filters: Filters
    let appIndex: AppIndex
    let responseLastUpdated: String
}

// MARK: - AppIndex
struct AppIndex: Codable {
    let seoTitle, webURL: String
}

// MARK: - Filters
struct Filters: Codable {
    let matchType: [String]
}

// MARK: - TypeMatch
struct TypeMatch: Codable {
    let matchType: String
    let seriesMatches: [SeriesMatch]
}

// MARK: - SeriesMatch
struct SeriesMatch: Codable {
    let seriesAdWrapper: SeriesAdWrapper?
    let adDetail: AdDetail?
}

// MARK: - AdDetail
struct AdDetail: Codable {
    let name, layout: String
    let position: Int
}

// MARK: - SeriesAdWrapper
struct SeriesAdWrapper: Codable {
    let seriesID: Int
    let seriesName: String
    let matches: [Match]
    
    enum CodingKeys: String, CodingKey {
        case seriesID = "seriesId"
        case seriesName, matches
    }
}

// MARK: - Match
struct Match: Codable {
    let matchInfo: MatchInfo
    let matchScore: MatchScore?
}

// MARK: - MatchInfo
struct MatchInfo: Codable {
    let matchID, seriesID: Int
    let seriesName, matchDesc: String
    let matchFormat: MatchFormat
    let startDate, endDate: String
    let state: State
    let status: String
    let team1, team2: Team
    let venueInfo: VenueInfo
    let currBatTeamID: Int?
    let seriesStartDt, seriesEndDt: String
    let isTimeAnnounced: Bool
    let stateTitle: String
    let isFantasyEnabled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case matchID = "matchId"
        case seriesID = "seriesId"
        case seriesName, matchDesc, matchFormat, startDate, endDate, state, status, team1, team2, venueInfo
        case currBatTeamID = "currBatTeamId"
        case seriesStartDt, seriesEndDt, isTimeAnnounced, stateTitle, isFantasyEnabled
    }
}

enum MatchFormat: String, Codable {
    case hun = "HUN"
    case odi = "ODI"
    case t20 = "T20"
}

enum State: String, Codable {
    case complete = "Complete"
}

// MARK: - Team
struct Team: Codable {
    let teamID: Int
    let teamName, teamSName: String
    let imageID: Int
    
    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case teamName, teamSName
        case imageID = "imageId"
    }
}

// MARK: - VenueInfo
struct VenueInfo: Codable {
    let id: Int
    let ground, city: String
    let timezone: Timezone
    let latitude, longitude: String
}

enum Timezone: String, Codable {
    case the0000 = "+00:00"
    case the0100 = "+01:00"
    case the0200 = "+02:00"
    case the0300 = "+03:00"
    case the0400 = "-04:00"
    case the0530 = "+05:30"
    case timezone0400 = "+04:00"
}

// MARK: - MatchScore
struct MatchScore: Codable {
    let team1Score, team2Score: TeamScore?
}

// MARK: - TeamScore
struct TeamScore: Codable {
    let inngs1: Inngs1
}

// MARK: - Inngs1
struct Inngs1: Codable {
    let inningsID, runs: Int
    let wickets: Int?
    let overs: Double
    
    enum CodingKeys: String, CodingKey {
        case inningsID = "inningsId"
        case runs, wickets, overs
    }
}
