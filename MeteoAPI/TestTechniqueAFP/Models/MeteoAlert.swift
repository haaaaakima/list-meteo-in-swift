import SwiftUI
import Foundation

enum MeteoAlert {
        case yellow, orange, red
        
        var color: Color {
            switch self {
            case .yellow:
                return .yellow
            case .orange:
                return .orange
            case .red:
                return .red
            }
        }
    }
