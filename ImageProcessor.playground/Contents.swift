//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")

//brightness
var filter = Filter(type: .brightness, intensity: -100)
UIImage.apply(filter, onImage: &image!)
image

filter = Filter(type: .brightness, intensity: 150)
UIImage.apply(filter, onImage: &image!)
image


//rgb 
filter = Filter(type: .rgb, intensity: 35)
UIImage.apply(filter, onImage: &image!)
image

