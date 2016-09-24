		//
//  MercadosTableViewController.swift
//  Lista de Mercados
//
//  Created by iossenac on 17/09/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit
import CoreData

class MercadosTableViewController: CoreDataTableViewController,UISplitViewControllerDelegate {
    
    var detailViewController : MercadoDetailViewController? = nil
    // MARK: Model
    let mercados = [
       
        (segmento:"mercado",nome:"Zafari",numlojas:1),
        (segmento:"loja",nome:"Nacional",numlojas:1),
        (segmento:"loja",nome:"Rissul",numlojas:1),
        (segmento:"mercado",nome:"BIG",numlojas:1),
        ]
    
    

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
    
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requisicao = NSFetchRequest<NSManagedObject>(entityName: "Mercado")
        requisicao.sortDescriptors = [
            NSSortDescriptor(key: "segmento", ascending: false)
        ]
        if let context = managedObjectContext {
            fetchedResultsController = NSFetchedResultsController(fetchRequest: requisicao, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        }
        else {
           fetchedResultsController = nil
        }
        self.splitViewController?.delegate = self
        
       /* if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController =
                controllers[controllers.count-1].navigationController
                as? MercadoDetailViewController
        }*/
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nil
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mercados.count
    }

  */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         let (segmento,nome,numloja) = mercados[(indexPath as NSIndexPath).row]
        // Configure the cell...
        //cell.textLabel?.text = mercados[indexPath.row].nome
        if let celula = cell as? MercadoTableViewCell {
            
            celula.configure(segmento,nome,numloja)
            
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="mostraDetalhe"{
            if let navcon = segue.destination as? UINavigationController {
                   if let destino = navcon.visibleViewController as? MercadoDetailViewController,
                    let indexPath = tableView.indexPathForSelectedRow {
                    destino.mercado = fetchedResultsController?.object(at: indexPath) as? Mercado
                    }
                }
                
        
        }
    }
    

}
		
