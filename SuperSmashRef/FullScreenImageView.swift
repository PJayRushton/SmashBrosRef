import SwiftUI

struct FullScreenImageView: View {
    let image: Image
    @Environment(\.dismiss) private var dismiss
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
                        .onEnded { _ in
                            withAnimation {
                                scale = 1.0
                            }
                        }
                )
        }
        .overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(20)
            }
        }
        .statusBar(hidden: true)
    }
}

