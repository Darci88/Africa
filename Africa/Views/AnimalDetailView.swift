//
//  AnimalDetailView.swift
//  Africa
//
//  Created by user219285 on 3/27/23.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                //hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //MARK: - 1. Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                //headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal
                    )
                //MARK: - 3. Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                
                //facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }.padding(.horizontal)
                
                //MARK: - 6. Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National parks")
                    InsetMapView()
                }.padding(.horizontal)
                
                //link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
            } //vstack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[1])
        }
    }
}
