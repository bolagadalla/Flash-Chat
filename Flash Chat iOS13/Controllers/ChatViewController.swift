//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Bola Gadalla on 28/02/20.
//  Copyright © 2020 Bola Gadalla. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [Message(sender: "1@2.com", message: "hello1"), Message(sender: "1@2.com", message: "hello2"), Message(sender: "1@2.com", message: "hel61516516515615616511561651561651165166516511561651sfd1bgvgs6d1g6s5d1gfs]d1g65s1dg65sd1g61sdg561weg1se65g1ew1g65e1swgd61vgeswdg1v6es1g6531egewg1ewsdgewsgedlo3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        navigationItem.title = K.appName
        
        // Registering the Custom Cell to the table view
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton)
    {
        
    }
    
    @IBAction func signoutPressed(_ sender: UIBarButtonItem)
    {
        let firebaseAuth = Auth.auth()
        do
        {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch let signOutError as NSError
        {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    
}

// Responsible for populating the tabel view
extension ChatViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return messages.count
    }
    
    // Creates a cell to add it to the tabel view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Creates a cell in the table view with call identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        // Adds the data to the cell and populate it
        cell.label.text = messages[indexPath.row].message
        return cell
    }
}
