//
//  OffsetKey.swift
//  TaskManagementApp
//
//  Created by Bilal SIMSEK on 12.07.2023.
//

import SwiftUI

struct OffsetKey:PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
