//
//  ViewController.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 29/12/2016.
//  Copyright © 2016 Cláudio Ribeiro. All rights reserved.
//

import Foundation
import XCGLogger

struct CinemaLoggerConstants{
  static let LOGGER_CONFIG_FILE = "LoggerPlistName";
  
  static let LOG_LEVEL_KEY = "LogLevel";
  static let DISPLAY_THREADNAME_KEY = "DisplayThreadName";
  static let DISPLAY_LOG_LEVEL_KEY = "DisplayLogLevel";
  static let DISPLAY_FILENAME_KEY = "DisplayFileName";
  static let DISPLAY_LINENUMBERS_KEY = "DisplayLineNumbers";
  static let WRITE_AT_FILE_KEY = "WriteAtFile";
  static let FILE_LOG_LEVEL_KEY = "FileLogLevel";
}

class CinemaLogger : XCGLogger{
  
  //one line singleton
  static let sharedInstance = CinemaLogger();
    
  private init() {
    super.init();
    initLoggerConfiguration();
  }
  
  var logConfigLevel: Level?;
  
  private func initLoggerConfiguration(){
    //load settings from plist file and apply to logger
    //let loggerConfigFile = Bundle.main.infoDictionary?[CinemaLoggerConstants.LOGGER_CONFIG_FILE] as! String;
    
    let path = Bundle.main.path(forResource: "LoggerConfig", ofType: "plist");
    
    var dict: NSDictionary?
    dict = nil;
    if(path != nil){
      dict = NSDictionary(contentsOfFile: path!);
    }
    
    if(dict != nil){
      //if no config is loaded, a default log config is used
      let loglevel = logLevelForConfig(loglevel: dict![CinemaLoggerConstants.LOG_LEVEL_KEY] as! String);
      logConfigLevel = loglevel;
      let sthname = dict![CinemaLoggerConstants.DISPLAY_THREADNAME_KEY] as! Bool;
      let sllevel = dict![CinemaLoggerConstants.DISPLAY_LOG_LEVEL_KEY] as! Bool;
      let sfname = dict![CinemaLoggerConstants.DISPLAY_FILENAME_KEY] as! Bool;
      let slnumbers = dict![CinemaLoggerConstants.DISPLAY_LINENUMBERS_KEY] as! Bool;
      
      let filepath = dict![CinemaLoggerConstants.WRITE_AT_FILE_KEY] as! String;
      let fileloglevel = logLevelForConfig(loglevel: dict![CinemaLoggerConstants.FILE_LOG_LEVEL_KEY] as! String);
      
      setup(level: loglevel, showThreadName: sthname, showLevel: sllevel, showFileNames: sfname, showLineNumbers: slnumbers, writeToFile: filepath, fileLevel: fileloglevel);
    }
  }
  
  
  private func logLevelForConfig(loglevel:String) -> Level {
    switch loglevel{
    case "Verbose":
      return .verbose;
    case "Debug":
      return .debug;
    case "Info":
      return .info;
    case "Warning":
      return .warning;
    case "Error":
      return .error;
    case "Severe":
      return .severe;
    case "None":
      return .none;
    default:
      return .severe;
    }
  }
  
}
