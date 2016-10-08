//
//  DetalheSegmentoTableViewController.swift
//  ListaDeMercados
//
//  Created by iossenac on 08/10/16.
//  Copyright © 2016 culik. All rights reserved.
//

import UIKit
import CoreData

class DetalheSegmentoTableViewController:  CoreDataTableViewController,UISplitViewControllerDelegate {

    
    weak var mercado: Mercado? {
        didSet {
            requestFetchController()
        }
    }

    
    func requestFetchController() {
        if let context = managedObjectContext, let mercado = self.mercado
        {
            let request = NSFetchRequest<NSManagedObject>(entityName: "Mercados")
            request.predicate = NSPredicate(format: "nome == %@", argumentArray: [mercado.nome!])
            
            request.sortDescriptors = [
                NSSortDescriptor(key:"nome", ascending: true)
            ]
            fetchedResultsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil)
        } else {
            fetchedResultsController = nil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestFetchController()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nil
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let mercados = fetchedResultsController?.object(at: indexPath) as? Mercados {
            var (nome, endereco) = ("","")
            mercados.managedObjectContext?.performAndWait {
                let c = mercados.nome ?? ""
                let i = mercados.endereco ?? ""
                nome = c
                endereco = i
                
            }
            cell.textLabel?.text = nome
            cell.detailTextLabel?.text = endereco
        }
        return cell
    }
    	

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier=="insereMercado"{
            if let destino = segue.destination as? DetalheLoja {
               
                    destino.mercado = self.mercado
                
            
            
            }
        }
    }

    
    

}
