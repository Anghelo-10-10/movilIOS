import SwiftUI

struct ContentView: View {
    @State private var isShowingScore = false
    @State private var scoreTitle = ""
    var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
    
    var correctAnswer = Int.random(in: 0 ..< 2)
    
    var body: some View {
        ZStack{
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 30){
               Text("Tap the flag of")
                Text(countries[correctAnswer])
                
                ForEach(0 ..< 2) { number in
                    Button {
                        flagTapped(with: number)
                    } label: {
                        Image(countries[number])
                    }
                }
                
            }
        }
        .alert(scoreTitle, isPresented: $isShowingScore, actions: {})
                
    }
    func flagTapped(with number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        isShowingScore = true
    }

    
}

#Preview {
    ContentView()
}
