//
//  EditaMercadoControler.swift
//  ListaDeMercados
//
//  Created by iossenac on 08/10/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit
import 		CoreData

class EditaMercadoControler: UIViewController {

    
    @IBOutlet weak var segmentoLabel: UITextField!
    var managedObjectContext =
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
    @IBOutlet weak var nomeLabel: UITextField!
    
    @IBOutlet weak var lojaLabel: UITextField!
       //@IBOutlet weak var segmentoLabel: UILabel!
        
       // @IBOutlet weak var lojaLabel: UILabel!
        //@IBOutlet weak var nomeLabel: UILabel!
        var mercado: Mercado? {
            didSet {
                updateUi()
            }
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            updateUi()
            // Do any additional setup after loading the view.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        func updateUi()
        {
            if let mercado = self.mercado{
                
                nomeLabel.text! =  mercado.nome ?? "" 
                segmentoLabel.text! = mercado.segmento ?? ""
                lojaLabel.text! = "\(mercado.numlojas)"
            }
        }
        
        
        
    @IBAction func SalvaDados(_ sender: AnyObject) {
        if  let context = managedObjectContext {
            // Swift2 - performBlock
            context.performAndWait {
                self.updateMercado()
                do {
                    try self.mercado?.managedObjectContext!.save()
                } catch let error {
                    print("Core Data error: \(error)")
                }
            }
        } else {
            // TODO: Handle errors
            print("Failed to get Managed Object Context.")
        }
        // get back to previous scene
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func Canceladados(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)

    }

    func updateMercado() {
        if let context = managedObjectContext {
            if  let nome = nomeLabel.text,
                let seg = segmentoLabel.text,
                let numloja = Int32(lojaLabel.text!)
            {
               
                
                if mercado == nil {
                    mercado = Mercado.createWith(nome: nome, segmento: seg, numloja: numloja , context: context)
                } else {
                    mercado?.nome = nome
                    mercado?.numlojas = numloja
                    mercado?.segmento = seg
               }
             }
        }
    }
    
       
}
