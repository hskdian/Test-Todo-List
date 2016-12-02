//
//  ViewController.swift
//  Test
//
//  Created by Shift Health on 2016-10-31.
//
//

import UIKit

class ViewController: UIViewController {

    var item : Item?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func setLabelText(_ sender: UIButton) {
        nameLabel.text = nameTextField.text
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as AnyObject? === saveButton {
            let name = nameTextField.text ?? ""
            item = Item(name: name)
        }
    }
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        let isInAddMode = presentingViewController is UINavigationController
        
        if isInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

