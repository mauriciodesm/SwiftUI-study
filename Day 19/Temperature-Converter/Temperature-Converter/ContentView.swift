import SwiftUI

struct ContentView: View {
    
    @State private var temperature = 0.0
    @State private var unit = "Celsius"
    
    private var farenheitToCelsius: Double {
        let realTemperature = Double(5 * (temperature - 32)/9 )
        return realTemperature
    }
    
    private var celsiusToFarenheit: Double {
        let realTemperature = (9/5) * (temperature) + 32
        return realTemperature
    }
    
    let units = ["Celsius", "Farenheit"]
    
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Temperature", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Input the temperature value:")
                }
                
                Section{
                    Picker("Select the unit to be converted", selection: $unit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section {
                    if unit == "Celsius" {
                        let unitConverted = String(celsiusToFarenheit)
                        Text("\(unitConverted) ºF")
                    }
                    if unit == "Farenheit" {
                        let unitConverted = String(farenheitToCelsius)
                        Text("\(unitConverted) ºC ")
                    }
                } header: {
                  Text("Temperature converted")
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
