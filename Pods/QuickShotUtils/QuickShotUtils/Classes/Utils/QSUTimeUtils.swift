//
//  QSUTimeUtils.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public class QSUDateUtils {
  static var SimpleDateFormatter : DateFormatter {
    let dtf = DateFormatter()
    dtf.dateFormat = "yyyy-MM-dd"
    return dtf
  }
  static var LockedDateFormatter : DateFormatter {
    let dtf = DateFormatter()
    dtf.dateFormat = "dd MMM HH:ss"
    return dtf
  }
  static var APIDateFormatter : DateFormatter {
    let dtf = DateFormatter()
    dtf.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
    return dtf
  }
  static var DayMonthFormatter : DateFormatter {
    let dtf = DateFormatter()
    dtf.dateFormat = "dd MMM"
    return dtf
  }
  static var TimeFormatter : DateFormatter {
    let dtf = DateFormatter()
    dtf.dateFormat = "HH:mm"
    return dtf
  }
}

public class QSUTimeZoneUtils {
  
  // "GMT-2"
  static func getAbbreviatedTimeZone() -> String { return NSTimeZone.local.abbreviation(for: Date()) ?? "" }
  
  // "America/Sao_Paulo"
  static func getTimeZoneName() -> String { return NSTimeZone.local.identifier }
  
  //all known timezones abbreviations
  static func timeZoneAbbreviations() -> [String:String] { return NSTimeZone.abbreviationDictionary }
  
  //all known timezones names
  static func timeZoneNames() -> [String] { return TimeZone.knownTimeZoneIdentifiers }
  
  static func isDaylightSavingTime() -> Bool {
    return NSTimeZone.local.isDaylightSavingTime(for: Date())
  }
  
  static func daylightSavingTimeOffset() -> TimeInterval {
    return NSTimeZone.local.daylightSavingTimeOffset()
  }
  
  static func nextDaylightSavingTimeTransition() -> Date? {
    return NSTimeZone.local.nextDaylightSavingTimeTransition
  }
  
  static func  nextDaylightSavingTimeTransitionAfterNext(dateToConsider: Date?) -> Date? {
    guard
      let nextDaylightSavingTimeTransition = dateToConsider
      else { return nil }
    return NSTimeZone.local.nextDaylightSavingTimeTransition(after: nextDaylightSavingTimeTransition)
  }
  
  static func getDeviceLocaleWithLanguage() -> String {
    let langId = Locale.current.languageCode == nil ? "" : Locale.current.languageCode! as String
    let countryId = Locale.current.regionCode == nil ? "" : Locale.current.regionCode! as String as String
    let language = "\(langId)_\(countryId)" // en_US on my machine
    
    return language;
  }
  
  static func getDeviceLocale() -> String {
    let langId = Locale.current.languageCode == nil ? "??" : Locale.current.languageCode! as String
    let language = "\(langId)" // en on my machine
    
    return language;
  }
}
