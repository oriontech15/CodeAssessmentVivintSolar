//
//  RandomUserTableViewController.swift
//  CodeAssessment
//
//  Created by Justin Smith on 8/25/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class RandomUserTableViewController: UITableViewController {
    
    var users: [User] = []
    var numberOfResults = 10
    
    @IBOutlet weak var resultsSegementedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refreshResults), forControlEvents: .ValueChanged)
        
        self.resultsSegementedControl.selectedSegmentIndex = 2
        
        if let users = UserController.sharedInstance.fetchUsersInContext() {
            self.users = users
        }
    }
    
    @IBAction func numberOfResultsChanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            numberOfResults = 1
        case 1:
            numberOfResults = 5
        case 2:
            numberOfResults = 10
        case 3:
            numberOfResults = 15
        case 4:
            numberOfResults = 20
        default:
            numberOfResults = 10
        }
        
        refreshResults()
    }
    
    @IBAction func fetchButtonTapped() {
        refreshResults()
    }
    
    func refreshResults() {
        UserController.sharedInstance.deleteUsers(self.users)
        UserController.sharedInstance.fetchUsers(self.numberOfResults) { (users) in
            if let users = users {
                self.users = users
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as? UserTableViewCell
        let user = self.users[indexPath.row]
        cell?.updateWithUser(user)
        
        return cell ?? UITableViewCell ()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
