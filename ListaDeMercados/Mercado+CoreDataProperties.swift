		//
//  Mercado+CoreDataProperties.swift
//  ListaDeMercados
//
//  Created by iossenac on 08/10/16.
//  Copyright © 2016 culik. All rights reserved.
//

import Foundation
import CoreData


extension Mercado {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mercado> {
        return NSFetchRequest<Mercado>(entityName: "Mercado");
    }

    @NSManaged public var nome: String?
    @NSManaged public var numlojas: Int32
    @NSManaged public var segmento: String?
    @NSManaged public var lojas: NSSet?

}

// MARK: Generated accessors for lojas
extension Mercado {

    @objc(addLojasObject:)
    @NSManaged public func addToLojas(_ value: Mercados)

    @objc(removeLojasObject:)
    @NSManaged public func removeFromLojas(_ value: Mercados)

    @objc(addLojas:)
    @NSManaged public func addToLojas(_ values: NSSet)

    @objc(removeLojas:)
    @NSManaged public func removeFromLojas(_ values: NSSet)

}
