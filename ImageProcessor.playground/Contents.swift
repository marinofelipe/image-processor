//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")
image

//brightness
let increaseBrightness = Filter(predefinedFilter: .increaseBrightnessBy80)
let reduceBrightness = Filter(predefinedFilter: .reduceBrightnessBy90)

//rgb 
let increaseRGB = Filter(predefinedFilter: .increaseRgbBy20)

let filters = [reduceBrightness, increaseBrightness, increaseRGB]


//apply
UIImage.apply(filters, onImage: &image!)
image
