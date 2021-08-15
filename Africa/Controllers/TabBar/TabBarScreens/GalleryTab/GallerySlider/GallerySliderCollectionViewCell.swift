//
//  GallerySliderCollectionViewCell.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 15/08/21.
//

import UIKit

protocol GallerySliderCollectionViewCellDelegate: AnyObject {
    func sliderValueChanged(value: Float)
}

class GallerySliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slider: UISlider!
    
    weak var delegate: GallerySliderCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        slider.minimumValue = 0
        slider.value = 1
        slider.maximumValue = 2
        slider.maximumTrackTintColor = Colors.shared.greyTintColor
        slider.minimumTrackTintColor = Colors.shared.orangeAppColor
    }
    
    @IBAction func valueChanged(sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        delegate?.sliderValueChanged(value: roundedValue)
    }
}
