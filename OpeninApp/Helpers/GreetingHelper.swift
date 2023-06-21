//
//  GreetingHelper.swift
//  OpeninApp
//
//  Created by Yashwanthi Manchala on 19/06/2023.
//

import Foundation
func greetingLogic() -> String {
  let date = NSDate()
  let calendar = NSCalendar.current
  let currentHour = calendar.component(.hour, from: date as Date)
  let hourInt = Int(currentHour.description)!
  
  let NEW_DAY = 0
  let NOON = 12
  let SUNSET = 18
  let MIDNIGHT = 24

  var greetingText = "Hello" // Default greeting text
  if hourInt >= NEW_DAY && hourInt <= NOON {
      greetingText = "Good Morning"
  }
  else if hourInt > NOON && hourInt <= SUNSET {
      greetingText = "Good Afternoon"
  }
  else if hourInt > SUNSET && hourInt <= MIDNIGHT {
      greetingText = "Good Evening"
  }
  
  return greetingText
}
