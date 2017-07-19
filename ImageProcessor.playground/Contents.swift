//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")
image

//brightness - predefined
let increaseBrightness = Filter(predefinedFilter: .increaseBrightnessBy80)
let reduceBrightness = Filter(predefinedFilter: .reduceBrightnessBy90)

//rgb - manually set
let increaseRGB = Filter(type: .rgb, intensity: 50)

let filters = [increaseBrightness, reduceBrightness, increaseRGB]


//apply
UIImage.apply(filters, onImage: &image!)
image