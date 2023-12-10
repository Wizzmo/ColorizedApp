//
//  ViewController.swift
//  RGBSlider
//
//  Created by Maxim Makarov on 17.11.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var colourPanelView: UIView!
    
    @IBOutlet var redColourIntensityLabel: UILabel!
    @IBOutlet var greenColourIntensityLabel: UILabel!
    @IBOutlet var blueColourIntensityLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    unowned var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colourPanelView.layer.cornerRadius = 20
        
        changeViewBackgroundColour()
        setupLabels()
    }
    
    // MARK: - IB Actions
    @IBAction func redSliderValueChanged() {
        changeViewBackgroundColour()
        redColourIntensityLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderValueChanged() {
        changeViewBackgroundColour()
        greenColourIntensityLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderValueChanged() {
        changeViewBackgroundColour()
        blueColourIntensityLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - Private Methods
    private func setupLabels() {
        redColourIntensityLabel.text = String(round(redSlider.value  * 100) / 100)
        greenColourIntensityLabel.text = String(round(greenSlider.value  * 100) / 100)
        blueColourIntensityLabel.text = String(round(blueSlider.value  * 100) / 100)
    }
    
    private func changeViewBackgroundColour() {
        colourPanelView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
}

