import SwiftUI

struct CharacterStatsView: View {
    let character: Character

    var powerString: String {
        "Power (\(character.stats.power))"
    }
    var speedString: String {
        "Agility (\(character.stats.speed))"
    }
    var longRangeString: String {
        "Long Range (\(character.stats.longRange))"
    }


    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Stats")
                .appFont(style: .title2, weight: .bold)
            
            StatBar(label: powerString, value: character.stats.power)
            StatBar(label: speedString, value: character.stats.speed)
            StatBar(label: longRangeString, value: character.stats.longRange)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct StatBar: View {
    let label: String
    let value: Int
    private let maxSegments = 7
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .appFont(style: .body)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 4) {
                ForEach(0..<maxSegments, id: \.self) { index in
                    Rectangle()
                        .fill(index < value ? Color.blue : Color(.systemGray4))
                        .frame(maxWidth: .infinity)
                        .frame(height: 8)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}

#Preview {
    CharacterStatsView(character: .steve)
        .padding()
}

