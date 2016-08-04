//
//  MainTableViewController.swift
//  SwiftLearing
//
//  Created by User on 20/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate, UISearchBarDelegate {
    
    var IndexArray: Array<String> = []
    var filteredArray = [String]()
    
      var countryName : String!
    var shouldShowSearchResults = false
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Tableview.dataSource = self
        self.Tableview.delegate = self
        
        IndexArray = ["1. How to Get local Json values","2. Get Web Site HTML Source","3. Local notification","4. Location base activity in Map","5. Push Notification Function","6.  Four Text Field Passcode"];
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
      
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = filteredArray[indexPath.row]
        } else {
            countryName = IndexArray[indexPath.row]
        }
        
        cell.textLabel?.text = countryName //self.IndexArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row
        {
        case 0:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("JsonView") as! ViewController
                self.navigationController?.pushViewController(secondViewController, animated: true)
        case 1:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 2:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 3:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("location") as! LocationViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 4:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PushNotification") as! PushNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 5:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Passcode") as! PasscodeTextFieldVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 6:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 7:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 8:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 9:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebPageSource") as! getWebPageSource
            self.navigationController?.pushViewController(secondViewController, animated: true)
        case 10:
            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
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
