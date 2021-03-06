//
//  ViewElement.swift
//  Formalist
//
//  Created by Indragie Karunaratne on 2016-03-11.
//  Copyright © 2016 Seed Platform, Inc. All rights reserved.
//

import UIKit

/// An element that wraps a view. Useful for one-off custom elements.
public final class ViewElement<ValueType: Equatable>: FormElement {
    public typealias ViewConfigurator = (FormValue<ValueType>) -> UIView
    
    fileprivate let viewConfigurator: ViewConfigurator
    fileprivate let value: FormValue<ValueType>
    
    /**
     Designated initializer
     
     - parameter value:            The value to bind to the element
     - parameter viewConfigurator: A block that creates and configures
     a view associated with the element
     
     - returns: An initialized instance of the receiver
     */
    public init(value: FormValue<ValueType>, viewConfigurator: @escaping ViewConfigurator) {
        self.value = value
        self.viewConfigurator = viewConfigurator
    }
    
    public override func render() -> UIView {
        return viewConfigurator(value)
    }
}
