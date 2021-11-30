//
//  Color+Extension.swift
//  Swapi
//
//  Created by Joel Sene on 29/11/21.
//

import SwiftUI
import UIKit

extension Color {
    public static var mainColor: Color {
        return Color(red: 200.0/255.0, green: 205.0/255.0, blue: 212.0/255)
    }
    public static var secondaryColor: Color {
        return Color(red: 69.0/255.0, green: 57.0/255.0, blue: 61.0/255)
    }
    public static var titleColor: Color {
        return Color(red: 27.0/255.0, green: 20.0/255.0, blue: 22.0/255)
    }
    public static var darkTextColor: Color {
        return Color(red: 64.0/255.0, green: 116.0/255.0, blue: 172.0/255)
    }
    public static var lightTextColor: Color {
        return Color(red: 45.0/255.0, green: 196.0/255.0, blue: 236.0/255)
    }
}

extension UIColor {
    public static var mainColor: UIColor {
        return UIColor(red: 200.0/255.0, green: 205.0/255.0, blue: 212.0/255, alpha: 1)
    }
    public static var secondaryColor: UIColor {
        return UIColor(red: 69.0/255.0, green: 57.0/255.0, blue: 61.0/255, alpha: 1)
    }
    public static var titleColor: UIColor {
        return UIColor(red: 27.0/255.0, green: 20.0/255.0, blue: 22.0/255, alpha: 1)
    }
    public static var darkTextColor: UIColor {
        return UIColor(red: 64.0/255.0, green: 116.0/255.0, blue: 172.0/255, alpha: 1)
    }
    public static var lightTextColor: UIColor {
        return UIColor(red: 45.0/255.0, green: 196.0/255.0, blue: 236.0/255, alpha: 1)
    }
}
