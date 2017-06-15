//
//  MainTableViewController.swift
//  SwiftLearing
//
//  Created by User on 20/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController {
    
    var IndexArray          = [String]()
    var filteredArray       = [String]()
    var dictionaryvalues    = [Int : String] ()  // Assain Dictionary value
    
    var Tag = [Int]()
    
    var countryName : String!
    var shouldShowSearchResults = false
    
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Tableview.dataSource = self
        self.Tableview.delegate = self
        
        IndexArray = ["1.Get local Json values", "2.Get Web Site HTML Source", "3.Local Push Notification", "4.Location base activity in Map", "5.Push Notification Function", "6.Text Field Passcode", "7.Stripe Integration", "8.MVVM", "9.Instagram"];
        //        Tag = ["#localjson","#HTML","#LocalNotification","#Map","#PushNotification","#TextField"];
        
        self.Tableview.reloadData()
        
    }
    
//    MARK: called when 'return' key pressed. return NO to ignore.
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool //
    {
        return true;
    }
    
}


//  MARK:- Tableview DataSource and Delegate Method

extension MainTableViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredArray.count
        } else {
            return self.IndexArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.Tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            countryName = filteredArray[indexPath.row]
        } else {
            countryName = IndexArray[indexPath.row]
        }
        
        cell.textLabel?.text = countryName //self.IndexArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        print(currentCell.textLabel!.text!)
        
        let item = tableView.cellForRow(at: indexPath)!.textLabel!.text!
        
        switch item
        {
        case "1.Get local Json values":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "JsonView") as! ViewController
            UserDefaultFunction(defaultName: "JsonView", defaultKey: "TUTORIAL_ID") .NSStringForKey()
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "2.Get Web Site HTML Source":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebPageSource") as! getWebPageSource
            UserDefaultFunction(defaultName: "WebPageSource", defaultKey: "TUTORIAL_ID") .NSStringForKey()
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "3.Local notification":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "LocalNotification") as! LocalNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "4.Location base activity in Map":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "location") as! LocationViewController
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "5.Push Notification Function":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "PushNotification") as! PushNotificationVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "6.Text Field Passcode":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Passcode") as! PasscodeTextFieldVC
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "7.Stripe Integration":
//            let storyboard = UIStoryboard(name: "Fabric", bundle: nil)
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "StripsViewController") as! StripsViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "8.MVVM":
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "MVVM") as! MVVMTabelView
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        case "9.Instagram":
            let storyboard = UIStoryboard(name: "Fabric", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "InstagramIntegation") as! InstagramIntegation
            self.navigationController?.pushViewController(secondViewController, animated: true)
//        case 10:
//            let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LocalNotification") as! LocalNotificationVC
//            self.navigationController?.pushViewController(secondViewController, animated: true)
        default:
            break;
        }
    }
}


//  MARK:-  Search Datasource and Deligate methods

extension MainTableViewController : UISearchDisplayDelegate, UISearchBarDelegate {
    
    func filterTableViewForEnterText(_ searchText: String)
    {
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        let array = (self.IndexArray as NSArray).filtered(using: searchPredicate)
        self.filteredArray = array as! [String]
        self.Tableview.reloadData()
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        self.filterTableViewForEnterText(searchString!)
        return true
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController,
                                 shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterTableViewForEnterText(self.searchDisplayController!.searchBar.text!)
        return true
    }
    
}
