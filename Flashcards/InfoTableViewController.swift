//
//  InfoTableViewController.swift
//  FlashKarte
//
//  Created by Jurgen Geitner on 2016/06/30.
//  Copyright © 2016 Jurgen Geitner. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    //create some data variables
    var refAndAcknowlegements = ["References": ["Wikipedia contributors, \"Staining,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Staining&oldid=723906170 (accessed July 19, 2016). \n\nWikipedia contributors, \"Silver stain,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Silver_stain&oldid=729646492 (accessed July 19, 2016). \n\nWikipedia contributors, \"Schaeffer–Fulton stain,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Schaeffer%E2%80%93Fulton_stain&oldid=693820807(accessed July 21, 2016). \n\nWikipedia contributors, \"Heidenhain's AZAN trichrome stain,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Heidenhain%27s_AZAN_trichrome_stain&oldid=648992082 (accessed July 19, 2016). \n\nWikipedia contributors, \"Alcian blue stain,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Alcian_blue_stain&oldid=705667619 (accessed July 21, 2016). \n\nWikipedia contributors, \"Giemsa stain,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Giemsa_stain&oldid=727590044 (accessed July 19, 2016). \n\nWikipedia contributors, \"Oil Red O,\" Wikipedia, The Free Encyclopedia, https://en.wikipedia.org/w/index.php?title=Oil_Red_O&oldid=685685043 (accessed July 20, 2016). \n\nCCNMTL Production Team, \"Staining Methods Used in This Lab Collection,\" CCNMTL Histology Laboratory Manual, http://histologylab.ccnmtl.columbia.edu/histological_techniques/staining_methods.html (accessed July 21, 2016). \n\nHill, M.A, \"Embryology Histology Stains,\" Embryology online education and research website, https://embryology.med.unsw.edu.au/embryology/index.php/Histology_Stains (accessed July 21, 2016)."], "Acknowledgements": ["This Flashcard app is based on a tutorial available at https://swifteducation.github.io/. \n\nFurther code modifications and enhancements have been made, creating the free FlashKarte range. \n\nBackground image adapted from: \n\nhttps://commons.wikimedia.org/wiki/File%3ACrohn's_disease_-_colon_-_intermed_mag.jpg, \n\nBy Nephron (Own work) [CC BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0) or GFDL (http://www.gnu.org/copyleft/fdl.html)], via Wikimedia Commons"]]
    
    
    //A struct for the references and their data
    struct Objects {
        
        var sectionName : String!
        var sectionData : [String]!
    }
    
    var objectArray = [Objects]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()

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

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return objectArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objectArray[section].sectionData.count
    }


 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = objectArray[indexPath.section].sectionName
        cell.accessoryType = .disclosureIndicator

        return cell
    }
   
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return indexPath
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        
     
            for (key, value) in refAndAcknowlegements {
                
                //lets print our array to see that we've got everything
                print("\(key) -> \(value)")
                
                objectArray.append(Objects(sectionName: key, sectionData: value))
                
            }
        }
            




   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        
        if let destination = segue.destination as? InfoSubViewController {
            
          let indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
            
          let selectedCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
        
            
           //set values of variables in dewsstination search controller 
            
           destination.thankYouTitle = objectArray[indexPath.section].sectionName
            
           destination.thankYouText = objectArray[indexPath.section].sectionData[indexPath.row]
           
           // Configure the cell...
            
           selectedCell.textLabel?.text = objectArray[indexPath.section].sectionName
            
           selectedCell.setSelected(false, animated: true)
            
           selectedCell.accessoryType = .disclosureIndicator
            
            
        }
    }


}
