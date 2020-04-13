//
//  MenuData.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
class MenuData {

public static let meditations = [
    Meditation(id: "1", title: "METTA MEDITATION", icon: "metta-meditation",type: 1,
                detail: [
                    DetailMeditation(title: "Description", desc: ["Recitation of words and phrases to evoke positive feelings, first towards oneself, and eventually towards all others, primarily since it tends to be difficult to love others without first loving oneself.", "This type of meditation may increase positive emotions and has been linked to reduced depression, anxiety, and post-traumatic stress or PTSD."], isOpen: true),
                    DetailMeditation(title: "Instruction", desc: ["Sit in a comfortable and relaxed manner.", "Start by taking 2-3 deep breaths.", "Clear the mind of any concerns and preoccupations.", "For a few minutes, feel or imagine the breath moving through the centre of the chest.", "Recite phrases, such as: “May I be happy. May I be well. May I be safe. May I be peaceful and at ease.” Recite the phrases with the intention of wishing someone those sentiments.", "After finishing repeating and reciting the phrases for oneself, repeat the process for others, starting at those closest. Recite phrases, such as “May you be happy. May you be well. May you be safe. May you be peaceful and at ease.” Imagine that person in the mind as these sentiments are being expressed."], isOpen: true),
                    DetailMeditation(title: "Precaution", desc: ["During this meditation, one may feel negative feelings such as anger, grief, or sadness. These emotions are attributed to the softening of the heart. There is no need to judge oneself for having these feelings. One may continue meditating to produce positive emotions to overcome these negative emotions, or move to mindfulness practice to alleviate them."], isOpen: true)
        ]),
    
      Meditation(id: "2", title: "Body Scan Meditation", icon: "body-scan",type: 1,
                       detail: [
                           DetailMeditation(title: "Description", desc: ["Scans one’s own body to bring awareness to the general condition of one’s body parts. This meditation Is used to notice any aches, pains, tensions, or other discomforts. This meditation doesn’t necessarily alleviate the problems, but lets one understand them to eventually, better manage them."], isOpen: true),
                           DetailMeditation(title: "Instruction", desc: ["Get into a comfortable position, either laying down or sitting.", "Start by taking a few deep breaths. Breath from the belly instead of the chest.", "Start by bringing awareness to your feet. Notice any sensations or pains in your feet or any emotions related to it. Gently breathe throughout this step.", "If there are any uncomfortable sensations, tensions, or pains, visualise those feelings leaving your body with the breaths.", "Continue this meditation with each area of the body, gradually moving up from your feet until you reach the top of your head."], isOpen: true)
               ]),
      
      Meditation(id: "3", title: "Mindful Meditation", icon: "mindfulness",type: 1,
              detail: [
                  DetailMeditation(title: "Description", desc: ["Mindfulness meditation is a form or meditation that promotes awareness of the present moment, instead of dwelling on the past or worrying about the future. The meditation attempts to reduce one’s fixation on negative emotions and lessen impulsive, emotional reactions. It can also improve focus, memory, and relationship satisfaction."], isOpen: true),
                  DetailMeditation(title: "Instruction", desc: ["Get into a comfortable position.", "Soften the gaze. Allow what appears before your eyes without focusing on it.", "Relax the entire body. Note especially the shoulders, face, and jaw, which tends to hold tension.", "Focus on the intention and goal. ‘What are you doing this meditation for?’", "Focus on the breath. Feel the rising and falling of the chest and stomach with each breath.", "Let the mind wander. Do not attempt to fight wandering thoughts, instead, remain focused on breathing.", "Once finished, slowly bring your attention to the present moment and surroundings. Slowly move the fingers, limbs, and the rest of the body before getting up. Think about how the body feels in the current moment, from top to bottom. Think about the feelings and emotions at that moment."], isOpen: true)
      ]),
      
      Meditation(id: "4", title: "Breath Awareness Meditation", icon: "breath-awareness",type: 1,
                      detail: [
                          DetailMeditation(title: "Description", desc: ["Breath awareness is a type of mindful meditation that encourages mindful breathing. Practitioners breathe slowly and deeply, counting their breaths or otherwise focusing on their breaths. The goal is to [focus only on breathing] and to ignore other thoughts that enter the mind. As a form of mindfulness meditation, breath awareness offers many of the same benefits as mindfulness. Those include reduced anxiety, improved concentration, and greater emotional flexibility."], isOpen: true),
                          DetailMeditation(title: "Instruction", desc: ["Take a reposed, seated posture. Your back should be straight and your body as relaxed as possible.", "Close your eyes, and bring your attention to your breathing process. Simply notice you are breathing. Do not attempt to change your breath in any way. Breath simply and normally.", "Try to notice both the in breath and the out breath; the inhale and the exhale. “Notice” means to actually feel the breathing in your body with your body. It is not necessary to visualize your breathing or to think about it in any way except to notice it with your somatic awareness.", "Each time your attention wanders from the act of breathing, return it to noticing the breath. Do this gently and without judgment.", "Remember to really feel into the act of breathing.", "Repeat this sequence over and over, giving each step your full attention as you do it.", "Suggested time is at least 10 minutes. Thirty minutes is better, if you are capable of it."], isOpen: true)
              ]),
      
      Meditation(id: "5", title: "Zen Meditation", icon: "zen-meditation",type: 1,
                               detail: [
                                   DetailMeditation(title: "Description", desc: ["The goal is to find a comfortable position, focus on breathing, and mindfully observe one’s thoughts without judgment. This form of meditation is similar to mindfulness meditation but requires more discipline and practice. People may prefer it if they are seeking both relaxation and a new spiritual path"], isOpen: true),
                                   DetailMeditation(title: "Instruction", desc: ["Whatever position you choose—sitting on a chair, sitting or kneeling on a cushion or low bench—choose a posture you can hold comfortably for 10 minutes.", "Once you’re seated, roll your hips slightly forward, allowing your belly to relax and your breath to move freely.", "Center your spine by gently swaying from left to right in decreasing arcs.", "Push the crown of your head toward the ceiling, straightening and extending your spine. Then relax your shoulders.", "Your head should not tilt forward, backward or lean to the side. Your ears should be over your shoulders with your nose in line with the navel.", "Lower your eyes to a 45-degree angle, looking about three feet in front of you without focusing your gaze. If there is a wall there, look as if you were seeing through the wall.", "Keep your lips and teeth gently closed with the tip of your tongue against the roof of your mouth behind your front teeth. Swallow and suck the saliva from your mouth, creating a vacuum.", "Rest your hands on your lap, thighs, or lower abdomen, where they do not create stress on your arms. Place your hands left hand on top of the right, palms up, tips of your thumbs lightly touching, forming a wide oval. This is called the “cosmic mudra” or resting bringing wisdom (left hand) together with compassion (right hand) to your practice and daily life.", "The whole point is to find an alert, energetic posture that will allow you to sit very still. Check yourself each time you sit, forming the habit of careful attentiveness to your body posture before practice.", "Breathe in through the nose, letting the air fill your lower abdomen as if it were a balloon, then gently release it with a slow, deep breath out… in and out, in and out.", "Count one on the in-breath, two on the out-breath, three on the in-breath, four on the out-breath, and so on—up to ten. Then begin at one again. If it is more comfortable for you, you may count the out-breaths only and follow the in-breath without counting. If a thought causes you to stray from the counting, just take notice of that, return your focus to the breath, and begin counting again, starting at one."], isOpen: true)
                       ]),
      
     Meditation(id: "6", title: "Transcendental Meditation", icon: "transcendental-meditation",type: 1,
                                        detail: [
                                            DetailMeditation(title: "Description", desc: ["Transcendental Meditation is a spiritual form of meditation where practitioners remain seated and breathe slowly. The goal is to transcend or rise above the person’s current state of being."], isOpen: true),
                                            DetailMeditation(title: "Instruction", desc: ["Sit in a comfortable chair with your feet on the ground and hands in your lap. Leave your legs and arms uncrossed.", "Close your eyes, and take a few deep breaths to relax the body.", "Open your eyes, and then close them again. Your eyes will remain closed during the 20-minute practice.", "Repeat a mantra in your mind. This is typically a Sanskrit sound learned from a TM teacher.", "When you recognize you're having a thought, simply return to the mantra.", "After 20 minutes, begin to move your fingers and toes to ease yourself back to the world.", "Open your eyes.", "Sit for a few more minutes until you feel ready to continue with your day."], isOpen: true)
                                    ]),
    ]
    
    public static let sounds = [
        Meditation(id: "1", title: "Sound 1", icon: "sound-1",type: 2, detail: nil),
        Meditation(id: "2", title: "Sound 2", icon: "sound-2",type: 2,detail: nil),
        Meditation(id: "3", title: "Sound 3", icon: "sound-3",type: 2,detail: nil),
        Meditation(id: "4", title: "Sound 4", icon: "sound-4",type: 2,detail: nil),
        Meditation(id: "5", title: "Sound 5", icon: "sound-5",type: 2,detail: nil),
    ]
    
    
    
    
    
    public static func getMeditation() -> [Meditation]{
        return meditations
    }
    
    
    public static func getSound() -> [Meditation]{
        return sounds
    }
    
    public static func getRecomended() -> [Meditation]{
       
       var recomend = [Meditation]()
        for _ in 1..<3 {
            let randomInt = Int.random(in: 0..<5)
            let randomMeditation = meditations[randomInt]
            let randomSound = sounds[randomInt]
        
            recomend.append(randomMeditation)
            recomend.append(randomSound)
           
        }
        return recomend
    }
    
}
