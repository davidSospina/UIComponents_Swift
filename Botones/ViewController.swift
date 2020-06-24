//
//  ViewController.swift
//  Botones
//
//  Created by David Salgado Ospina on 23/06/20.
//  Copyright © 2020 David Salgado Ospina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    //Variables
    
    // Elementos del Picker
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Buttons
        myButton.setTitle("My button", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        // Pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        // PageControls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        // SegmentedControls
        
        mySegmentedControl.removeAllSegments()
        
        for(index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
    }

    //Actions
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    @IBAction func myPageCOntrolAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
    }
    
}

// Extensión para no agragar más datos al ViewController
// Delegate - interactuar con el ViewController
// Datasource - cargar datos en la vista
extension ViewController: UIPickerViewDataSource,
UIPickerViewDelegate {
    
    // Numero de columnas del Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Cantidad de elementos en el Picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
    }
    
}

