//
//  MVVMTabelView.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/2/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class MVVMTabelView: UIViewController {

    let Employ : [ViewModel] = (UIApplication.shared.delegate as! AppDelegate).EmpDetails
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

extension MVVMTabelView : UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return Employ.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let EmplViewModel = Employ[indexPath.row]
        
        cell.textLabel?.text = EmplViewModel.nameTxt
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
