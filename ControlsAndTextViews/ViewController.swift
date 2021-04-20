//
//  ViewController.swift
//  ControlsAndTextViews
//
//  Created by David Bueno on 16/4/21.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    @IBOutlet weak var myPageCrontol: UIPageControl!
    
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var mySliderControl: UISlider!
    
    
    @IBOutlet weak var mySteperControl: UIStepper!
    
    
    
    @IBOutlet weak var mySwitchControl: UISwitch!
    
    
    @IBOutlet weak var myProgressView: UIProgressView!
     
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var myStepperLabel: UILabel!
    
    @IBOutlet weak var mySwitchLabel: UILabel!
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    //Variables
    
    //Declara la variable como privada y constante
    private let myPickerViewValues = ["Uno","Dos","Tres","Cuatro","Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Buttons
        myButton.setTitle("Mi botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //Pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //PageControls
        myPageCrontol.numberOfPages = myPickerViewValues.count
        myPageCrontol.currentPageIndicatorTintColor = .blue
        
        myPageCrontol.pageIndicatorTintColor = .gray
        
        
        //Segmented Controls
        
        //primero se borra todos los segmentos
        mySegmentedControl.removeAllSegments()
        
        
        //para crear un segmento de por ejemplo 5 items
        //necesitamos un bucle for
        
        for(index,value) in myPickerViewValues.enumerated(){
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        
        //Sliders
        mySliderControl.minimumTrackTintColor = .red
        mySliderControl.minimumValue = 1
        mySliderControl.maximumValue = Float(myPickerViewValues.count)
        mySliderControl.value = 1
        
        //Steppers
        
        mySteperControl.minimumValue = 1
        mySteperControl.maximumValue = Double(myPickerViewValues.count)
        
        //Switches
        mySwitchControl.onTintColor = .purple
        mySwitchControl.isOn = false
        
        
        //Progress Indicator
        myProgressView.progress = 0
        
        myActivityIndicator.startAnimating()
        myActivityIndicator.color = .orange
        myActivityIndicator.hidesWhenStopped = true
        
        //Labels
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 16)
        myStepperLabel.text = "1"
        
        
        mySwitchLabel.text = "Está apagado"
        
        //TextFields
        myTextField.textColor = .brown
        //El placeholder es la ayuda que indica
        //que debemos introducir en la caja de texto
        myTextField.placeholder = "Escribe algo"
        
        myTextField.delegate = self
        
        //TextView
        myTextView.textColor = .brown
        myTextView.delegate = self
        
        
        
        
    }

    //Actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        
        //Esta acción lo que hace es cambiar el color del
        //fondo cuando se pulsa el botón
        //primero se hace una comprobación
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
        
        myTextView.resignFirstResponder()
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageCrontol.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageCrontol.currentPage]
        
        
        myButton.setTitle(myString, for: .normal)
        
        //para que se sincronice el pagecontrol
        //Con el segmnet control
        mySegmentedControl.selectedSegmentIndex = myPageCrontol.currentPage
        
        mySliderControl.value = Float(myPageCrontol.currentPage)
        
        
        

    }
    
    
    @IBAction func mySegmentControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
      
        let myString = myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        
        myButton.setTitle(myString, for: .normal)
        
        myPageCrontol.currentPage = mySegmentedControl.selectedSegmentIndex
        
        mySliderControl.value = Float(mySegmentedControl.selectedSegmentIndex)
    }
    
    
    @IBAction func mySliderControlAction(_ sender: Any) {
        
        //print(mySliderControl.value)
        
        var progress: Float = 0
        
        switch mySliderControl.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            progress = 0.2
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            progress = 0.4
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            progress = 0.6
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            progress = 0.8
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            progress = 1
        }
        
       
    
        myPageCrontol.currentPage = Int(mySliderControl.value)
        
        
        //igualar el slider con el la barra
        //De progeso
        
        myProgressView.progress = progress
        
        
        
    }
    
    
    
    @IBAction func mySteperControlAction(_ sender: Any) {
        
        let value = mySteperControl.value
        
        mySliderControl.value = Float(value)
        
        mySegmentedControl.selectedSegmentIndex = Int(value)
        
        //Añadiendo propiedades a la label
        myStepperLabel.text = "\(value)"
        
    }
    
    
    
    @IBAction func mySwitchControlAction(_ sender: Any) {
        
        if mySwitchControl.isOn {
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
            
            mySwitchLabel.text = "Está Encendido"
        }else{
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
            mySwitchLabel.text = "Está Apagado"
        }
    }
    
}
// UIpickerViewController, UIPickerViewDelegate

/*
 El datasource es para cargar datos en una vista
 mientras que el delagate es para interactuar con el
 viewcontroler
 */
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    //esta función hace refenrencia al número de
    //columnas que va a tener el pickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Esta función hace referencia a cuántas filas
    // va a tener el listado del pickeview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    //Esto es para decirle que representación visual va a tener los elementos
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    //Función para seleccionar un elemento de la lista y realizar alguna acción
    //con este
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        //Variable constante que guarda los elementos de uno en uno del array
        let myString = myPickerViewValues[row]
        
        //pone como titulo del botón el contenido del elemento selecccionado de
        //lista
        myButton.setTitle(myString, for: .normal)
        
        //para asociar el elemento del pagecontrol
        //con los elementos de la lista
        myPageCrontol.currentPage = row
        
        //para que cuando cambie el elemento de la lista
        //tambien se mueva a su segmento correspondiente
        
        mySegmentedControl.selectedSegmentIndex = row
        
        mySliderControl.value = Float(row)
        
        
    }
    
}


//UITexFieldDelegate
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
        myTextView.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextView.isHidden = true
    }
}
