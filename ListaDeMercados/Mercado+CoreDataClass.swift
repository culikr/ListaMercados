//
//  Mercado+CoreDataClass.swift
//  ListaDeMercados
//
//  Created by iossenac on 24/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import Foundation
import CoreData


public class Mercado: NSManagedObject {
    
    class func createWith(nome:String, segmento: String,  numloja: Int32, context: NSManagedObjectContext) -> Mercado?
    {
        let request = NSFetchRequest<Mercado>(entityName: "Mercado")
        let query = "nome == %@ and segmento == %@ "
        let params:[Any] = [nome,segmento]
        request.predicate = NSPredicate(format: query, argumentArray: params)
        
        if let mercado = (try? context.fetch(request))?.first { // Note the (try?), it bugged.
            print("Found turma: \(mercado)")
            return mercado
        } else if let mercado = NSEntityDescription.insertNewObject(forEntityName: "Mercado", into: context) as? Mercado
        {
            print("Created mercado: \(mercado)")
            mercado.nome = nome
            mercado.segmento = segmento
            mercado.numlojas = numloja
              return mercado
        } else {
            print("No mercado object.")
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
