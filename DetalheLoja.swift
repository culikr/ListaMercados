//
//  DetalheLoja.swift
//  ListaDeMercados
//
//  Created by iossenac on 08/10/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit

class DetalheLoja: UIViewController {
    var managedObjectContext =
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    @IBOutlet weak var enderecoLabel: UITextField!
    @IBOutlet weak var nomeLabel: UILabel!
    var mercados: Mercados? {
        didSet {
            //updateUi()
        }
    }
    
    var mercado : Mercado? {
        didSet {
            //updateUis()
        }
    }

    func updateUis() {
        if let mercado = self.mercado {
            nomeLabel.text! = mercado.nome!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   updateUi()
    updateUis()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateUi()
    {
        if let mercados = self.mercados{
            
            nomeLabel.text! =  mercados.nome ?? ""
            enderecoLabel.text! = mercados.endereco ?? ""
           
        }
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func salvaLoja(_ sender: AnyObject) {
        if  let context = managedObjectContext {
            // Swift2 - performBlock
            context.performAndWait {
                self.updateMercados()
                do {
                    try self.mercados?.managedObjectContext!.save()
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
    @IBAction func cancalaLoja(_ sender: AnyObject) {
         _ = self.navigationController?.popViewController(animated: true)
    }
    
    func updateMercados() {
        if let context = managedObjectContext {
            if  let nome = nomeLabel.text,
                let endereco = enderecoLabel.text
                
            {
                
                
                if mercados == nil {
                    mercados = Mercados.createWith(nome: nome, endereco: endereco, context: context)
                    mercado?.addToLojas(mercados!)
                } else {
                    mercados?.nome = nome
                    mercados?.endereco = endereco
                    mercado?.addToLojas(mercados!)
                
                }
            }
        }
    }

    
}
