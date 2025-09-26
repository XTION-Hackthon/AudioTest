//
//  ContentView.swift
//  AudioTest
//
//  Created by Andy Lyu on 9/26/25.
//

import SwiftUI
import AppKit

struct ContentView: View {
    var body: some View {
        Button(action:{
            setSystemVolume(0.5)
        }){
            Text("设置音量为50%")
        }
    }
}

#Preview {
    ContentView()
}
