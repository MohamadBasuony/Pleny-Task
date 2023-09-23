//
//  TabbarView.swift
//  Pleny-Task
//
//  Created by Mohamad Basuony on 23/09/2023.
//

import SwiftUI

struct TabbarView: View {
    
    @State public var tabViewSelection = 0
    
    private var singleTabWidth = UIScreen.main.bounds.width / 5
    init() {
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 2),
            colors: [
                UIColor.clear.cgColor,
                UIColor.lightGray.withAlphaComponent(0.1).cgColor
            ]
        )
        let appearance = UITabBarAppearance()
        appearance.shadowImage = image
        appearance.backgroundColor = UIColor.white

        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            TabView(selection: $tabViewSelection){
                PostsViewConfigurator.configure()
                    .tabItem {
                        Asset.Assets.home.image
                    }.tag(0)

                
                ShopView()
                    .tabItem {
                        Asset.Assets.shop.image
                    }.tag(1)

                
                DiscountView()
                    .tabItem {
                        Asset.Assets.discount.image
                    }.tag(2)

                
                GalleryView()
                    .tabItem {
                        Asset.Assets.gallery.image
                    }.tag(3)
                
                ProfileView()
                    .tabItem {
                        Asset.Assets.profile.image
                    }.tag(4)

            }
            .accentColor(Asset.Colors.primaryColor.color)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
