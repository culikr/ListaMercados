//
//  Mercados+CoreDataClass.swift
//  ListaDeMercados
//
//  Created by iossenac on 24/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import Foundation
import CoreData


public class Mercados: NSManagedObject {
    class func createWith(nome:String, endereco: String, context: NSManagedObjectContext) -> Mercados?
    {
        let request = NSFetchRequest<Mercados>(entityName: "Mercados")
        let query = "nome == %@ and endereco == %@  "
        let params:[Any] = [nome,endereco]
        request.predicate = NSPredicate(format: query, argumentArray: params)
        
        if let mercados = (try? context.fetch(request))?.first { // Note the (try?), it bugged.
            print("Found turma: \(mercados)")
            return mercados
        } else if let mercados = NSEntityDescription.insertNewObject(forEntityName: "Mercados", into: context) as? Mercados
        {
            print("Created mercados: \(mercados)")
            mercados.nome = nome
            mercados.endereco = endereco
            
            return mercados
        } else {
            print("No mercados object.")
        }
        /*
         do {
         // swift 2.2
         let result = try context.executeFetchRequest(request)
         // Swift 2.2
         if let turma = resuld.first as? Turma
         return turma
         }
         } catch let error {
         
         }
         */
        
        return nil
    }
    
  

}
