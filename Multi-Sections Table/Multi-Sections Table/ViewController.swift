//
//  ViewController.swift
//  Multi-Sections Table
//
//  Created by Ahmed Almansor on 8/31/18.
//  Copyright © 2018 A.A. All rights reserved.
//

import UIKit
// Data Source Class for table data
class TableDataClass: NSObject {
    
    var  Name: String?
    
}

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate,  UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate{
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredData = [TableDataClass]()
    var Table1Data =  [TableDataClass]()
    var Table2Data =  [TableDataClass]()
    var Table3Data =  [TableDataClass]()
    var Table4Data =  [TableDataClass]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ClearBtn: UIButton!
    
    @IBOutlet weak var Table1Btn: UIButton!
    @IBOutlet weak var Table2Btn: UIButton!
    @IBOutlet weak var Table3Btn: UIButton!
    @IBOutlet weak var Table4Btn: UIButton!
    
    var SectionSelected = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide clear btn
        ClearBtn.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        // search delegates
        searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        // Loading data....
        LoadData()
    }
    // Data source function
    func LoadData(){
       let NewData = TableDataClass()
        // filling Table 1
        NewData.Name = "Ahmed"
        Table1Data.append(NewData)
        let NewData2 = TableDataClass()
        NewData2.Name = "Jhon"
        Table1Data.append(NewData2)
        // filling Table 2
        let NewData3 = TableDataClass()
        NewData3.Name = "Sarah"
        Table2Data.append(NewData3)
        let NewData4 = TableDataClass()
        NewData4.Name = "David"
        Table2Data.append(NewData4)
        // filling Table 3
        let NewData5 = TableDataClass()
        NewData5.Name = "Ryan"
        Table3Data.append(NewData5)
        let NewData6 = TableDataClass()
        NewData6.Name = "Rob"
        Table3Data.append(NewData6)
        // filling Table 4
        let NewData7 = TableDataClass()
        NewData7.Name = "Bob"
        Table4Data.append(NewData7)
        let NewData8 = TableDataClass()
        NewData8.Name = "Raul"
        Table4Data.append(NewData8)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    // Btns
    
    @IBAction func ClearBtnPressed(_ sender: UIButton) {
        searchController.isActive = false
        tableView.reloadData()
        filteredData.removeAll()
        ClearBtn.isHidden = true
    }
    @IBAction func SearchBtnPressed(_ sender: UIButton) {
        ClearBtn.isHidden = false
        //tableView.tableHeaderView = searchController.searchBar
        
        self.present(searchController, animated: true, completion:  nil)
    }
    
    @IBAction func Table1BtnSelected(_ sender: UIButton) {
        SectionSelected = 3
        // set text color
        Table1Btn.setTitleColor(UIColor.white, for: .normal)
        Table2Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table3Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table4Btn.setTitleColor(UIColor.darkGray, for: .normal)
        
        //set backgroundcolor
        Table1Btn.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        Table2Btn.backgroundColor = UIColor.clear
        Table3Btn.backgroundColor = UIColor.clear
        Table4Btn.backgroundColor = UIColor.clear
        tableView.reloadData()
    }
    
    @IBAction func Table2BtnSelected(_ sender: UIButton) {
        SectionSelected = 2
        Table1Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table2Btn.setTitleColor(UIColor.white, for: .normal)
        Table3Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table4Btn.setTitleColor(UIColor.darkGray, for: .normal)
        
        //set backgroundcolor
        Table1Btn.backgroundColor = UIColor.clear
        Table2Btn.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        Table3Btn.backgroundColor = UIColor.clear
        Table4Btn.backgroundColor = UIColor.clear
        tableView.reloadData()
    }
    @IBAction func Table3BtnSelected(_ sender: UIButton) {
        SectionSelected = 1
        Table1Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table2Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table3Btn.setTitleColor(UIColor.white, for: .normal)
        Table4Btn.setTitleColor(UIColor.darkGray, for: .normal)
        //set backgroundcolor
        Table1Btn.backgroundColor = UIColor.clear
        Table2Btn.backgroundColor = UIColor.clear
        Table3Btn.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        Table4Btn.backgroundColor = UIColor.clear
        
        tableView.reloadData()
    }
    @IBAction func Table4BtnSelected(_ sender: UIButton) {
        SectionSelected = 0
        Table1Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table2Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table3Btn.setTitleColor(UIColor.darkGray, for: .normal)
        Table4Btn.setTitleColor(UIColor.white, for: .normal)
        //set backgroundcolor
        Table1Btn.backgroundColor = UIColor.clear
        Table2Btn.backgroundColor = UIColor.clear
        Table3Btn.backgroundColor = UIColor.clear
        Table4Btn.backgroundColor = UIColor.black.withAlphaComponent(0.40)
        tableView.reloadData()
    }
    
    // MARK: - Search functions
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if !searchController.searchBar.text!.isEmpty{
            
            filteredData(searchController.searchBar.text!)
            
        }else{
            tableView.reloadData()
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.searchBar.text!.isEmpty{
            filteredData(searchController.searchBar.text!)
        }
        
    }
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
            return 1
        }else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            
            return filteredData.count
        }else{
            if SectionSelected == 0 {return Table4Data.count}
            if SectionSelected == 1 {return Table3Data.count}
            if SectionSelected == 2 {return Table2Data.count}
            if SectionSelected == 3 {return Table1Data.count}
        }
        
        
        return 0
    }
    
    // Header Title functions
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive {
            return NSLocalizedString("Search", comment: "")
        }else{
            if SectionSelected == 0{
                return NSLocalizedString("Table 4", comment: "")
            }
            else if SectionSelected == 1{
                return NSLocalizedString("Table 3", comment: "")
            }
            else if SectionSelected == 2{
                return NSLocalizedString("Table 2", comment: "")
            }
            else if SectionSelected == 3{
                return NSLocalizedString("Table 1", comment: "")
            }
            
        }
        return ""
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let tableViewHeaderFooterView = view as? UITableViewHeaderFooterView {
            tableViewHeaderFooterView.textLabel?.textColor = UIColor.white
            tableViewHeaderFooterView.textLabel?.textAlignment = .center
            (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.40)
            tableViewHeaderFooterView.layer.borderWidth = CGFloat(0.15)
            tableViewHeaderFooterView.layer.borderColor = UIColor.white.cgColor
            
        }
    }
    // filter users
    func filteredData(_ searchText: String, scope: String = "All") {
        let filteredDataA = Table4Data.filter({ item in
            if let name = item.Name, let query = searchController.searchBar.text {
                return name.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
            }
            return false
        })
        let filteredDataB = Table3Data.filter({ item in
            if let name = item.Name, let query = searchController.searchBar.text {
                return name.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
            }
            return false
        })
        let filteredDataC = Table2Data.filter({ item in
            if let name = item.Name, let query = searchController.searchBar.text {
                return name.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
            }
            return false
        })
        let filteredDataD = Table1Data.filter({ item in
            if let name = item.Name, let query = searchController.searchBar.text {
                return name.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) != nil
                
            }
            
            return false
        })
        filteredData = filteredDataA + filteredDataB + filteredDataC + filteredDataD
        tableView.reloadData()
    }
    
    // tableViewDataSource
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableTableViewCell
        if searchController.isActive{
            let filteredName = self.filteredData[indexPath.row]
            cell.NameLabel.text = filteredName.Name
            return cell
        }else{
            if SectionSelected == 0 {
                let TableData = Table4Data[indexPath.row]
                cell.NameLabel.text = TableData.Name
                return cell
            }else if SectionSelected == 1{
                let TableData = Table3Data[indexPath.row]
                cell.NameLabel.text = TableData.Name
                return cell
            }else if SectionSelected == 2{
                let TableData = Table2Data[indexPath.row]
                cell.NameLabel.text = TableData.Name
                return cell
            }else if SectionSelected == 3{
                let TableData = Table1Data[indexPath.row]
                cell.NameLabel.text = TableData.Name
                return cell
            }
            
        }
        
        return cell
    }
    

}

