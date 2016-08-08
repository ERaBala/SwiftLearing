//
//  MainTableViewController.swift
//  SwiftLearing
//
//  Created by User on 20/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate, UISearchBarDelegate {
    
//    var IndexArray: Array<String> = []
     var IndexArray = [String]()
    var filteredArray = [String]()
    var dictionaryvalues = [Int : String] ()  // Assain Dictionary value
    
    var Tag = [Int]()
    
      var countryName : String!
    var shouldShowSearchResults = false
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Tableview.dataSource = self
        self.Tableview.delegate = self
        
        IndexArray = ["1.How to Get local Json values","2.Get Web Site HTML Source","3.Local notification","4.Location base activity in Map","5.Push Notification Function","6.Four Text Field Passcode","7.Stripe Integration"];
//        Tag = ["#localjson","#HTML","#LocalNotification","#Map","#PushNotification","#TextField"];
        Tag = [0,1,2,3,4,5,6];
        self.Tableview.reloadData()
      
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredArray.count
        } else {
            return self.IndexArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.Tableview.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
      
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = filteredArray[indexPath.row]
        } else {
            countryName = IndexArray[indexPath.row]
        }
        
        cell.textLabel?.text = countryName //self.IndexArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        print(currentCell.textLabel!.text)
        
        let item = tableView.cellForRowAtIndexPath(indexPath)!.textLabel!.text!
        
        switch item
        {
        case "1.How to Get local Json values":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("JsonView") as! ViewController
                self.navigationController?.pushViewController(secondViewController, animated: true)
        case "2.Get Web Site HTML Source":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case "3.Local notification":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case "4.Location base activity in Map":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("location") as! LocationViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case "5.Push Notification Function":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PushNotification") as! PushNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case "6.Four Text Field Passcode":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Passcode") as! PasscodeTextFieldVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case "7.Stripe Integration":
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
//        case 7:
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        case 8:
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        case 9:
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//        case 10:
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
//            self.navigationController?.pushViewController(secondViewController, animated: true)
        default:
            break;
        }
    }
    
    

    // *************************** Search Datasource and Deligate methods ************************************ // 
    
    func filterTableViewForEnterText(searchText: String)
    {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        let array = (self.IndexArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredArray = array as! [String]
        self.Tableview.reloadData()
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController,
                                 shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text!)
        return true
    }
    

}
