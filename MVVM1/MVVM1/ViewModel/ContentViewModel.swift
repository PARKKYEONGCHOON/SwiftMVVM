//
//  ContentViewModel.swift
//  MVVM1
//
//  Created by 박경춘 on 2023/02/09.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var kyeongchoon = Person(name: "경춘", age: 30)

    var name: String{
        kyeongchoon.name
    }
    
    var age: String{
        return "30"
    }
    
    func changeName(_ name: String){
        kyeongchoon.name = name
    }
    
}

