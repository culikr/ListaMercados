//
//  Mercado+CoreDataProperties.swift
//  ListaDeMercados
//
//  Created by iossenac on 24/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import Foundation
import CoreData


extension Mercado {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mercado> {
        return NSFetchRequest<Mercado>(entityName: "Mercado");
    }

    @NSManaged public var segmento: String?
    @NSManaged public var nome: String?
    @NSManaged public var numlojas: Int32
    @NSManaged public var newRelationship: Mercados?

}
