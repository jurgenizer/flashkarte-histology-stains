//
//  Deck.swift
//  FlashKarte
//
//  Created by Jurgen Geitner on 2016/01/23.
//

/*
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Jurgen Geitner.
 
 Based on a tutorial by Young Bakos, hence the license below:
 
 This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
 4.0 International License, by Yong Bakos.
 */


import Foundation

class Deck {
    
    fileprivate let cards: [Flashcard]

    
    //choose a random card from the deck, if there are cards
    var randomCard: Flashcard? {
        if cards.isEmpty {
            return nil
        } else {
            return cards[Int(arc4random_uniform(UInt32(cards.count)))]
        }
    }
    
    init() {
        let cardData = [
"Haematoxylin and Eosin (H&E)" : "Haematoxylin and Eosin is the most commonly used staining protocol. Haematoxylin stains cell nuclei blue, while eosin stains cytoplasm, connective tissue and other extracellular substances pink or red. Eosin is strongly absorbed by red blood cells, colouring them bright red.",
"Papanicolaou staining" : "Papanicolaou staining, or Pap staining, is a frequently used method for examining cell samples from various bodily secretions. It is frequently used to stain Pap smear specimens. It uses a combination of haematoxylin, Orange G, eosin Y, Light Green SF yellowish, and sometimes Bismarck Brown Y.",
"PAS staining" : "Periodic acid-Schiff staining is used to mark carbohydrates (glycogen, glycoprotein, proteoglycans). It is used to distinguish different types of glycogen storage diseases.",
"Masson's trichrome" : "Masson's trichrome is a three-colour staining protocol. Well-suited to distinguish cells from surrounding connective tissue. Most recipes produce red keratin and muscle fibers, blue or green staining of collagen and bone, light red or pink staining of cytoplasm, and black cell nuclei.",
"Romanowsky stains" : "The Romanowsky stains are all based on a combination of eosinate and methylene blue (sometimes with its oxidation products azure Aand azure B). Common variants include Wright's stain, Jenner's stain, May-Grunwald stain, Leishman stain and Giemsa stain. All are used to examine blood or bone marrow samples. They are preferred over H&E for inspection of blood cells because different types of leukocytes (white blood cells) can be readily distinguished. All are also suited to examination of blood to detect blood-borne parasites such as malaria.",
"Silver staining" : "Silver staining is the use of silver to stain histologic sections. This kind of staining is important especially to show proteins (for example type III collagen) and DNA. It is used to show both substances inside and outside cells. Camillo Golgi originally perfected silver staining for the study of the nervous system. There are a variety of specialised silver staining techniques.",
"Sudan staining" : "Sudan staining is the use of Sudan dyes to stain sudanophilic substances, usually lipids. Sudan III, Sudan IV, Oil Red O, Osmium tetroxide, and Sudan Black B are often used. Sudan staining is often used to determine the level of fecal fat to diagnose steatorrhea.",
 "Ziehl-Neelsen stain" : "Ziehl-Neelsen staining is used to stain species of Mycobacterium tuberculosis that do not stain with the standard laboratory staining procedures such as Gram staining. The stains used are the red coloured Carbol fuchsin that stains the bacteria and a counter stain such as Methylene blue.",
"Schaeffer–Fulton stain" : "The Schaeffer–Fulton stain is a technique designed to isolate endospores by staining any present endospores green, and any other bacterial bodies red. The primary stain is malachite green, and the counterstain is safranin, which dyes any other bacterial bodies red.",
"Azan-Mallory stain" : "Nuclei are stained dark red. Collagen fibres, cartilage matrix and mucus are stained blue. Muscle and erythrocytes are stained orange to red. Cytoplasmic staining varies from pink to reddish brown, depending upon the cell type.",
"Alcian blue stain" : "Alcian blue is a routine stain used to detect mucins. Stained parts are blue to blue-green. Alcian blue staining can be combined with H&E staining, PAS staining and van Gieson staining methods.",
"Verhoef-Van Gieson" : "Verhoeff-Van Gieson or elastic-Van Gieson (EVG) stain. This is a combination of Verhoeff’s elastic stain which is a hematoxylin stain containing ferric chloride and Wright’s iodine solution and Van Gieson stain which contains acid fuchsin, picric acid, and hematoxylin. Stains elastic fibers blue-black to black, collagen pale red, other tissue elements yellow, and nuclei blue to black.",
"Giemsa stain" : "A classic blood film stain for blood smears and bone marrow specimens. Erythrocytes stain pink, platelets show a light pale pink, lymphocyte cytoplasm stains sky blue, monocyte cytoplasm stains pale blue, and leukocyte nuclear chromatin stains magenta.",
"Toluidine blue stain" : "A basic stain. Stains acidic components various shades of blue. Stains nucleus blue and cytoplasm light blue.",
"Nissl stain" : "A method of staining nucleic acids (e.g. ribosomes, RER, heterochromatin, nucleoli). A dye such as methylene blue, toluidine blue or cresyl violet is used.",
"Sudan Black stain" : "This is a stain that colours fat droplets black. There are several Sudan dyes, among which are Sudan III and Sudan IV. These stain fat droplets red as does Oil Red O.",
"Haematoxylin" : "Haematoxylin (hematoxylin in North America) is a nuclear stain. Used with a mordant, haematoxylin stains nuclei blue-violet or brown. It is most often used with eosin in H&E (haematoxylin and eosin) staining—one of the most common procedures in histology.",
"Eosin" : "An acid dye. Most often used as a counterstain to haematoxylin, imparting a pink or red colour to cytoplasm, cell membranes, and some extracellular structures. It also imparts a strong red colour to red blood cells. Eosin may also be used as a counterstain in some variants of Gram staining, and other protocols.",
"Gram staining" : "Gram staining is a method of staining used to differentiate bacterial species into two large groups (gram-positive and gram-negative). The name comes from the Danish bacteriologist Hans Christian Gram, who developed the technique. Gram-positive bacteria stain dark blue or violet. On most Gram-stained preparations, Gram-negative organisms appear red or pink because they are counterstained. Some organisms are gram-variable (meaning they may stain either negative or positive); some are not stained with either dye used in the Gram technique and are not seen.",
"Endospore staining" : "Endospore staining is used to identify the presence or absence of endospores, which make bacteria very difficult to kill. This is particularly useful for identifying endospore-forming bacterial pathogens such as Clostridium difficile. Special techniques for endospore staining include the Schaeffer–Fulton stain and the Moeller stain.",
"Congo Red stain" : "Congo red was previously used as a dye, but its properties (toxicity, colour change) means that it is no longer used for this purpose. Has been used to detect amyloid in muscle and nerve fresh frozen sections."
            
        ]
        cards = cardData.map { Flashcard(term: $0, definition: $1) }
    }
    
}



