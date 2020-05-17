//
//  CubeTransition.swift
//  LoaderUI
//
//  Created by Vinh Nguyen on 5/10/20.
//  Copyright © 2020 Vinh Nguyen. All rights reserved.
//

import SwiftUI

struct CubeTransition: View {
    private let duration = 1.6
    private let timingFunction = TimingFunction.easeInOut
    private let keyTimes = [0, 0.25, 0.5, 0.75, 1]
    private let scaleValues: [CGFloat] = [1, 0.5, 1, 0.5, 1]
    private let rotationValues = [0.0, -.pi / 2, -.pi, -1.5 * .pi, -2 * .pi]
    private let translationDirectionValues: [[UnitPoint]] = [[.zero, .init(x: 1, y: 0), .init(x: 1, y: 1), .init(x: 0, y: 1), .zero],
                                                             [.zero, .init(x: -1, y: 0), .init(x: -1, y: -1), .init(x: 0, y: -1), .zero]]
    
    var body: some View {
        GeometryReader(content: self.render)
    }
    
    func render(geometry: GeometryProxy) -> some View {
        let dimension = min(geometry.size.width, geometry.size.height)
        let rectangleDimension = dimension / 3
        let timingFunctions = Array(repeating: timingFunction, count: keyTimes.count - 1)
        let positions = [CGPoint(x: rectangleDimension / 2, y: rectangleDimension / 2),
                         CGPoint(x: dimension - rectangleDimension / 2, y: dimension - rectangleDimension / 2)]
        let translationValues = translationDirectionValues.map {
            $0.map {
                UnitPoint(x: $0.x * (dimension - rectangleDimension), y: $0.y * (dimension - rectangleDimension))
            }
        }
        
        return
            ZStack {
                ForEach(0..<2, id: \.self) { index in
                    KeyframeAnimationController(beginTime: 0,
                                                duration: self.duration,
                                                timingFunctions: timingFunctions,
                                                keyTimes: self.keyTimes) {
                                                    Rectangle()
                                                        .scaleEffect(self.scaleValues[$0])
                                                        .rotationEffect(Angle(radians: self.rotationValues[$0]))
                                                        .frame(width: rectangleDimension, height: rectangleDimension)
                                                        .position(positions[index])
                                                        .offset(x: translationValues[index][$0].x, y: translationValues[index][$0].y)
                    }
                }
            }
            .frame(width: dimension, height: dimension, alignment: .center)
    }
}

struct CubeTransition_Previews: PreviewProvider {
    static var previews: some View {
        CubeTransition()
    }
}
