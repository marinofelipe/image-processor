//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")
image

//brightness
let reduceBrightness = Filter(type: .brightness, intensity: -100)
let increaseBrightness = Filter(type: .brightness, intensity: 150)

//rgb 
let increaseRGB = Filter(type: .rgb, intensity: 35)

let filters = [reduceBrightness, increaseBrightness, increaseRGB]


//apply
UIImage.apply(filters, onImage: &image!)
image
