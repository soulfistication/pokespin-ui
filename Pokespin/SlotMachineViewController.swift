//
//  SlotMachineViewController.swift
//  Pokespin
//
//  Created by Montserrat Arroyo on 2/20/25.
//

import UIKit

class SlotMachineViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var slotMachinePickerView: UIPickerView
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        slotMachinePickerView = UIPickerView()
        slotMachinePickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        slotMachinePickerView.translatesAutoresizingMaskIntoConstraints = false
        super.init(coder: coder)
        slotMachinePickerView.delegate = self
        slotMachinePickerView.dataSource = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("Not supported")
    }
    
    init() {
        slotMachinePickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        slotMachinePickerView.translatesAutoresizingMaskIntoConstraints = false
        super.init(nibName: nil, bundle: nil)
        slotMachinePickerView.delegate = self
        slotMachinePickerView.dataSource = self
        
    }
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Setup UI

    func setupUI() {
        view.backgroundColor = UIColor.creamyBlue
        slotMachinePickerView.selectRow(4, inComponent: 0, animated: true)
        slotMachinePickerView.selectRow(4, inComponent: 1, animated: true)
        slotMachinePickerView.selectRow(4, inComponent: 2, animated: true)
    }
    
    // MARK: - UIPickerView Data Source

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfColumnsInSlotMachine
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.numberOfRowsInSlotMachine
    }

    // MARK: - UIPickerView Delegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return slotSymbol(row: row)
    }

    // MARK: - Helpers

    private func slotSymbol(row: Int) -> String {
        if row % 4 == 0 {
            return "♠️"
        } else if row % 4 == 1 {
            return "♥️"
        } else if row % 4 == 2 {
            return "♣️"
        } else if row % 4 == 3 {
            return "♦️"
        }
        return "💊"
    }
}

extension UIColor {
    static let creamyBlue = UIColor(red: 222.0/255.0, green: 241.0/255.0, blue: 252.0/255.0, alpha: 1.0)
}
