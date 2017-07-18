//: Playground - noun: a place where people can play

import UIKit

// Process the image!
var image = UIImage(named: "sample")

UIImage.applyFilter(withAmount: 2, filteringType: .rgb, onImage: &image!)

image

////////////
//TODO: Search for rgb and other filter alternations to create specific classes/functions etc to filter images
////////////

////brightness////
//Procedure Truncate(value)
//If value < 0 Then value = 0
//If value > 255 Then value = 255
//Return value
//EndProcedure

//colour = GetPixelColour(x, y)
//newRed   = Truncate(Red(colour)   + brightness)
//newGreen = Truncate(Green(colour) + brightness)
//newBlue  = Truncate(Blue(colour)  + brightness)
//PutPixelColour(x, y) = RGB(newRed, newGreen, newBlue)





