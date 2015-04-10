//
//  ViewController.swift
//  SimpleTableSwift
//
//  Created by Vitor Kawai Sala on 10/04/15.
//  Copyright (c) 2015 Vitor Kawai Sala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var dados : DataSource = DataSource.sharedInstance

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "celula")
    }

    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - TableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "celula")

        if var label = cell.textLabel{
            label.text = dados.data[indexPath.row]
        }
        
        cell.textLabel?.text! = dados.data[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected \(dados.data[indexPath.row])")
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        var temp : String = dados.data[sourceIndexPath.row]
        dados.removeObject(sourceIndexPath.row)
        dados.insert(temp, atIndex:destinationIndexPath.row)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        dados.removeObject(indexPath.row)
        tableView.reloadData()
    }

    // MARK: - Outros Métodos

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func btnEdit(sender: AnyObject) {
        tableView.setEditing(!tableView.editing, animated: true)
        if(tableView.editing){
            (sender as! UIBarButtonItem).title = "Done"
        }
        else{
            (sender as! UIBarButtonItem).title = "Edit"
        }
    }

}

