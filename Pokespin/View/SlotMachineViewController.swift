//
//  SlotMachineViewController.swift
//  PokeSpin
//
//  Created by Ivan Almada on 18/01/2018.
//  Copyright © 2018 Ivan. All rights reserved.
//

import UIKit

@objc protocol SlotMachineExecutable: NSObjectProtocol {
    func slotMachineExecuted(win: Bool)
}

class SlotMachineViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var pokemonNumber: Int = 0
    weak var delegate: SlotMachineExecutable?

    // MARK: - IBOutlets

    @IBOutlet weak var slotMachinePickerView: UIPickerView!
    @IBOutlet weak var wonLabel: UILabel!
    @IBOutlet weak var wonImageView: UIImageView!
    @IBOutlet weak var spinSlotButton: UIButton!

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

    // MARK: - IBActions

    @IBAction func spinSlotMachine(sender: AnyObject) {
        spin()
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

    // MARK: - Logic
    func spin() {
        spinSlotButton.isEnabled = false
        
        let firstComponentRandomNumber = Int.random(in: 12...24)
        let secondComponentRandomNumber = Int.random(in: 12...24)
        let thirdComponentRandomNumber = Int.random(in: 12...24)

        slotMachinePickerView.selectRow(firstComponentRandomNumber, inComponent: 0, animated: true)
        slotMachinePickerView.selectRow(secondComponentRandomNumber, inComponent: 1, animated: true)
        slotMachinePickerView.selectRow(thirdComponentRandomNumber, inComponent: 2, animated: true)

        let firstSymbol = slotSymbol(row: firstComponentRandomNumber)
        let secondSymbol = slotSymbol(row: secondComponentRandomNumber)
        let thirdSymbol = slotSymbol(row: thirdComponentRandomNumber)

        let firstHit = firstSymbol == secondSymbol
        let secondHit = secondSymbol == thirdSymbol

        let successHit = firstHit && secondHit

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self else { return }
            if successHit {
                self.wonLabel.isHidden = false
                self.wonImageView.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [weak self] in
                    guard let self else { return }
                    self.delegate?.slotMachineExecuted(win: true)
                })
            } else {
                 self.delegate?.slotMachineExecuted(win: false)
            }
        }
    }

}

extension UIColor {
    static let creamyBlue = UIColor(red: 222.0/255.0, green: 241.0/255.0, blue: 252.0/255.0, alpha: 1.0)
}
