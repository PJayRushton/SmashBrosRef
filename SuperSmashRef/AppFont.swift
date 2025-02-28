import SwiftUI
import UIKit

// Define the available text styles
enum AppTextStyle {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case caption

    var textStyle: Font.TextStyle {
        switch self {
            case .largeTitle: return .largeTitle
            case .title1: return .title
            case .title2: return .title2
            case .title3: return .title3
            case .headline: return .headline
            case .body: return .body
            case .caption: return .caption
        }
    }

    var uiTextStyle: UIFont.TextStyle {
        switch self {
            case .largeTitle: return .largeTitle
            case .title1: return .title1
            case .title2: return .title2
            case .title3: return .title3
            case .headline: return .headline
            case .body: return .body
            case .caption: return .caption1
        }
    }
}

// Define the available font weights
enum AppFontWeight {
    case regular
    case medium
    case semibold
    case bold
    case thin

    var weight: Font.Weight {
        switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .semibold: return .semibold
            case .bold: return .bold
            case .thin: return .thin
        }
    }
}

// Custom view modifier for app fonts
struct AppFontModifier: ViewModifier {
    let style: AppTextStyle
    let weight: AppFontWeight

    func body(content: Content) -> some View {
        content
            .font(.custom("Avenir", size: UIFont.preferredFont(forTextStyle: style.uiTextStyle).pointSize))
            .fontWeight(weight.weight)
    }
}

// Extension to make the modifier easier to use
extension View {
    func appFont(style: AppTextStyle, weight: AppFontWeight = .regular) -> some View {
        modifier(AppFontModifier(style: style, weight: weight))
    }
}

// End of file. No additional code.
