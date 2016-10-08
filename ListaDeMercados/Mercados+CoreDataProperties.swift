//
//  Mercados+CoreDataProperties.swift
//  ListaDeMercados
//
//  Created by iossenac on 08/10/16.
//  Copyright © 2016 culik. All rights reserved.
//

import Foundation
import CoreData
 

extension Mercados {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mercados> {
        return NSFetchRequest<Mercados>(entityName: "Mercados");
    }

    @NSManaged public var endereco: String?
    @NSManaged public var nome: String?
    @NSManaged public var mercado: Mercado?

}
