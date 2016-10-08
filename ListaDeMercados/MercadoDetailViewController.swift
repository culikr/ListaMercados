	//
//  MercadoDetailViewController.swift
//  Lista de Mercados
//
//  Created by iossenac on 17/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit

class MercadoDetailViewController: UIViewController {

    
    @IBOutlet weak var segmentoLabel: UILabel!
    
    @IBOutlet weak var lojaLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
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
    
    
    
}
