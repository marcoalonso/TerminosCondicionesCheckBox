//
//  Settings.swift
//  CheckBoxTerminosXIB
//
//  Created by Marco Alonso Rodriguez on 24/03/23.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var isOn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Toggle(isOn: $isOn) {
                        Text("Dark Mode ")
                    }
                    Toggle(isOn: $isOn) {
                        Text("Sound Enabled")
                    }
                    Toggle(isOn: $isOn) {
                        Text("Large Font")
                    }
                    Spacer()
                }
                .navigationTitle("Settings")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
