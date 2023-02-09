//
//  ContentView.swift
//  MVVM_Weather
//
//  Created by 박경춘 on 2023/02/09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var newLoaction: String = ""
    @StateObject var weatherViewModel = WeatherViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {

        ZStack{
            Color("rw-green").ignoresSafeArea()
            VStack{

                Text(weatherViewModel.locationName).font(.title)
                Text(weatherViewModel.date)
                Image(uiImage:  weatherViewModel.icon!)
                Text(weatherViewModel.summary)
                Text(weatherViewModel.forecastSummary)
                
                HStack(alignment:.center){
                    TextField("Enter your city", text: $newLoaction)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(0.3)
                        .background(Color.white)
                        .opacity(0.5)
                        .frame(width: 200, height: 30)
                    Button(action: {
                        weatherViewModel.changeLocation(to: newLoaction)
                    }, label: {
                        Image(systemName: "location.fill").foregroundColor(Color.white)

                    })
                }


            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
