//
//  Pulse.swift
//  
//
//  Created by Jayden OH on 2021/06/25.
//

@propertyWrapper
public struct Pulse<Value> {

  public var value: Value {
    didSet {
      self.riseValueUpdatedCount()
    }
  }
  var valueUpdatedCount = UInt.min

  public init(wrappedValue: Value) {
    self.value = wrappedValue
  }

  public var wrappedValue: Value {
    get { return self.value }
    set { self.value = newValue }
  }

  public var projectedValue: Pulse<Value> {
    return self
  }

  private mutating func riseValueUpdatedCount() {
    if self.valueUpdatedCount == UInt.max {
      self.valueUpdatedCount = UInt.min
    } else {
      self.valueUpdatedCount += 1
    }
  }
}
