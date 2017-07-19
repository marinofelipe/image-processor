//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")

UIImage.applyFilter(withAmount: 10, operation: .increase, type: .rgb, onImage: &image!)

image

//brightness
UIImage.applyFilter(withAmount: -100, operation: .increase, type: .brightness, onImage: &image!)

image

