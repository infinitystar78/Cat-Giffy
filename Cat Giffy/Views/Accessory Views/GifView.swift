//
//  GifView.swift
//  Cat Giffy
//
//  Created by M W on 19/01/2022.
//

import FLAnimatedImage
import Foundation
import SwiftUI

struct GifView: UIViewRepresentable {
    let animatedView = FLAnimatedImageView()
    var urlString: String

    func makeUIView(context: Context) -> some UIView {
        let view = UIView()

        let urlString = urlString
        let url = URL(string: urlString)!
        let gifData = try? Data(contentsOf: url)
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor),

        ])
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
