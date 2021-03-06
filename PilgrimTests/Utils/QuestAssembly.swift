import Foundation
@testable import Pilgrim

class QuestAssembly: PilgrimAssembly {

    override func makeBindings() {
        super.makeBindings()
        makeInjectable(knight, byType: Knight.self)
        makeInjectable(holyGrailQuest, byType: Quest.self)
        makeInjectable(holyGrailQuest, byKey: "damselQuest")
    }

    func knight() -> Knight {
        objectGraph(Knight(quest: damselInDistressQuest()))
    }

    /**
     HolyGrailQuest is a struct that conforms to the Quest protocol.
     */
    func holyGrailQuest() -> Quest {
        shared(HolyGrailQuest())
    }

    /**
     HolyGrailQuest is a struct that conforms to the Quest protocol.
     */
    func damselInDistressQuest() -> Quest {
        shared(DamselInDistressQuest())
    }
}
