//
//  StreamView.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2025/03/13.
//

import SwiftUI


struct StreamView: View {
    @State var urlArr:Array<String?>

    private var gridColumnsCount: Int {
        let count = max(urlArr.count, 1)
        // Increase columns as the count grows so everything fits without scrolling.
        // 1->1, 2-4->2, 5-9->3, 10-16->4, 17-25->5, ...
        return Int(ceil(sqrt(Double(count))))
    }

    private var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 0), count: gridColumnsCount)
    }

    private var gridItemCount: Int {
        // Show all tiles
        urlArr.count
    }

    private func bindingForUrl(at index: Int) -> Binding<String?> {
        Binding<String?>(
            get: {
                guard index >= 0, index < urlArr.count else { return nil }
                return urlArr[index]
            },
            set: { newValue in
                guard index >= 0, index < urlArr.count else { return }
                urlArr[index] = newValue
            }
        )
    }

    var body: some View {
        GeometryReader { geo in
            let count = gridItemCount
            let cols = max(gridColumnsCount, 1)
            let rows = max(Int(ceil(Double(count) / Double(cols))), 1)

            // Fit the whole grid into the available height.
            // Width is handled by the grid's flexible columns.
            let tileHeight = geo.size.height / CGFloat(rows)

            LazyVGrid(columns: gridColumns, spacing: 0) {
                ForEach(0..<count, id: \.self) { idx in
                    PlayerView(mediaUrl: bindingForUrl(at: idx))
                        .frame(height: tileHeight)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
			.background(Color.black)
        }
        .ignoresSafeArea()
    }
}

//struct StreamView_Previews: PreviewProvider {
//    static var previews: some View {
//        StreamView(urlArr: [""])
//    }
//}
