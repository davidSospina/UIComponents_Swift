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
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myActivityView: UIActivityIndicatorView!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextValue: UITextView!
    @IBOutlet weak var myTextView: UITextView!
    
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
        myPickerView.isHidden = true
        
        // PageControls
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        
        // SegmentedControls
        
        mySegmentedControl.removeAllSegments()
        
        for(index, value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        //Sliders
        
        mySlider.minimumTrackTintColor = .red
        //mySlider.maximumTrackTintColor = .blue
        mySlider.minimumValue = 0
        mySlider.maximumValue = Float(myPickerViewValues.count)
        
        //Valor por defecto
        mySlider.value = 0
        
        //Stepper
        myStepper.minimumValue = 0
        myStepper.maximumValue = Double(myPickerViewValues.count)
        
        //Switches
        mySwitch.onTintColor = .blue
        mySwitch.isOn = false
        
        //Progress
        myProgressView.progress = 0
        
        myActivityView.color = .orange
        myActivityView.startAnimating()
        myActivityView.hidesWhenStopped = true
        
        // Labels
        myStepperLabel.textColor = .brown
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        myStepperLabel.text = "0"
        
        mySwitchLabel.text = "Apagado"
        
        // TextField
        myTextField.textColor = .brown
        myTextField.placeholder = "Hola mundo"
        myTextField.delegate = self
        
        // TextView
        myTextValue.textColor = .brown
        myTextValue.delegate = self
    }

    //Actions
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
        
        myTextValue.resignFirstResponder()
    }
    
    @IBAction func myPageCOntrolAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControl.currentPage
        
        mySlider.value = Float(myPageControl.currentPage)
        
        myStepper.value =
            Double(myPageControl.currentPage)
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = mySegmentedControl.selectedSegmentIndex
        
        mySlider.value = Float(mySegmentedControl.selectedSegmentIndex)
        
        myStepper.value =
            Double(mySegmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        
        
        var myString = ""
        
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)

        var progress:Float = 0.0
        
        switch mySlider.value {
        case 0..<1:
            myString = myPickerViewValues[0]
            
            progress = 0.0
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 0
            mySlider.value = 0
            myStepper.value = 0
        case 1..<2:
            myString = myPickerViewValues[1]
            progress = 0.2
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 1
            mySlider.value = 1
            myStepper.value = 1
        case 2..<3:
            myString = myPickerViewValues[2]
            progress = 0.4
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 2
            mySlider.value = 2
            myStepper.value = 2
        case 3..<4:
            myString = myPickerViewValues[3]
            progress = 0.6
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 3
            mySlider.value = 3
            myStepper.value = 3
        case 4..<5:
            myString = myPickerViewValues[4]
            progress = 0.8
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 4
            mySlider.value = 4
            myStepper.value = 4
        case 5..<6:
            myString = myPickerViewValues[5]
            progress = 1
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 5
            mySlider.value = 5
            myStepper.value = 5
        default:
            myString = myPickerViewValues[0]
            progress = 0.0
            
            myButton.setTitle(myString, for: .normal)
            
            mySegmentedControl.selectedSegmentIndex = 0
            mySlider.value = 0
            myStepper.value = 0
        }
        
        myProgressView.progress = progress
    }
    @IBAction func myStepperAction(_ sender: Any) {
        let valueStepper = myStepper.value
        
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        
        myPickerView.selectRow(Int(myStepper.value), inComponent: 0, animated: true)
        
        mySlider.value = Float(valueStepper)
        
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = Int(valueStepper)
        
        mySegmentedControl.selectedSegmentIndex = Int(valueStepper)
        
        myStepperLabel.text = "\(valueStepper)"
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityView.stopAnimating()
            mySwitchLabel.text = "Encendido"
        } else{
            myPickerView.isHidden = true
            myActivityView.startAnimating()
            mySwitchLabel.text = "Apagado"
        }
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
        
        mySlider.value = Float(row)
        
        myStepper.value = Double(row)
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
    }
}

extension ViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
    }
}

