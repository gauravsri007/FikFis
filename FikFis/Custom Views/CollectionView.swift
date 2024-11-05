//
//  CollectionView.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI
import XLPagerTabStrip

struct CollectionView: View {
    let item : Card
    @State var size: CGFloat = 82
    @State var header : String

    var body: some View {
        NavigationLink(destination: ProductCategoryList()){
        VStack {
            Image("\(item.imageUrl)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipped()
                .cornerRadius(12)
            Text(item.title)
                .font(.custom_font(.medium, size: 12))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: size, height: 60, alignment: .top)
        }
        .frame(width: size, height: size + 60)
                       }
    }
}

#Preview {
    CollectionView(item: Card(id: 2, title: "Mens shoes", imageUrl: "product1"), header: "main")
}


struct PagerTabStripWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ButtonBarPagerTabStripViewController {
        // Create an instance of ButtonBarPagerTabStripViewController
        let pagerTabStripVC = ButtonBarPagerTabStripViewController()
        pagerTabStripVC.delegate = context.coordinator
        return pagerTabStripVC
    }

    func updateUIViewController(_ uiViewController: ButtonBarPagerTabStripViewController, context: Context) {
        // Update any properties as needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PagerTabStripIsProgressiveDelegate {
        func updateIndicator(for viewController: XLPagerTabStrip.PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
            
        }
        
        func updateIndicator(for viewController: XLPagerTabStrip.PagerTabStripViewController, fromIndex: Int, toIndex: Int) {
            
        }
        
        var parent: PagerTabStripWrapper

        init(_ parent: PagerTabStripWrapper) {
            self.parent = parent
        }

        // Handle any delegate methods here if needed
    }
}
