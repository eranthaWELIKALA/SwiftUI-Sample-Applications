//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Erantha Welikala on 1/10/22.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
            LazyVGrid(
                columns: [adaptiveGrid(width: width)], spacing: 0) {
                ForEach(items,  content: { item in
                    content(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                })
            }
        }
    }
}

private func adaptiveGrid(width: CGFloat) -> GridItem {
    var gridItem = GridItem(.adaptive(minimum: width))
    gridItem.spacing = 0
    return gridItem
}

private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
    var columnCount = 1
    var rowCount = itemCount
    repeat {
        let itemWidth = size.width / CGFloat(columnCount)
        let itemHeight = itemWidth / itemAspectRatio
        if CGFloat(rowCount) * itemHeight < size.height {
            break
        }
        columnCount += 1
        rowCount = (itemCount + (columnCount - 1)) / columnCount
    } while columnCount < itemCount
    if columnCount > itemCount {
        columnCount = itemCount
    }
    return floor(size.width / CGFloat(columnCount))
}

struct AspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojyMemoryGame(with: EmojyMemoryGame.themes.first?.key ?? "Vehicles")
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: {
            card in
            CardView(card)
                .padding(4)
                .onTapGesture(perform: {
                    game.choose(card)
                })
        })
    }
}
