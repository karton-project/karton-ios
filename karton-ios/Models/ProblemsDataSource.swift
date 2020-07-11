//
//  ProblemsDataSource.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 05.07.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

class ProblemsDataSource {
    var problemsArray: [Problem] = []
    
    init() {
        problemsArray.append(Problem(name: "Kurt, Kuzu ve Ot", imageName: "0", description: "Problem çözmedeki temel elemanları öğrenelim."))
        
        problemsArray.append(Problem(name: "Hanoi Kuleleri", imageName: "1", description: "Bir algoritmanın farklı parametreler için nasıl kullanıldığını öğrenelim."))
        
        problemsArray.append(Problem(name: "Piksel ve Renk", imageName: "2", description: "Renkler ve resimler bilgisayarda nasıl depolanır?"))
        
        problemsArray.append(Problem(name: "Yönergeleri Takip Et", imageName: "3", description:"Gördüğün çizimleri arkadaşlarına anlatmakta ne kadar başarılı olacaksın?"))
        
        problemsArray.append(Problem(name: "Haritalar", imageName: "4", description: "Kodlama, bir program için ne anlama geliyorsa, haritalar da yön bulmak için aynı anlama gelir."))
        
        problemsArray.append(Problem(name: "İşlemler ve Mantık", imageName: "5", description: "Mantık operatörlerini küçük bir oyun ile anlayalım."))
        
        problemsArray.append(Problem(name: "Kriptografi", imageName: "6", description: "Mesajlarımızın başkaları tarafından okunmamasını nasıl sağlarız?"))
        
        problemsArray.append(Problem(name: "Algoritma Nedir?", imageName: "7", description: "Farkında olmadan birçok algoritma oluşturdun. Artık tanımını öğrenme zamanı geldi."))
        
        problemsArray.append(Problem(name: "Müzik Aleti Yapalım", imageName: "8", description: "Beste yapmak ve kod yazmak birbirinden çok farklı şeyler değildir."))
        
        problemsArray.append(Problem(name: "Tangram ve Algoritma", imageName: "9", description: "Tangram, basit şekillerden karmaşık yapıları oluşturmamızı sağlar."))
        
        problemsArray.append(Problem(name: "Veriler ve Değişkenler", imageName: "10", description: "Oluşturduğumuz yapılar içinde, bazı özellikleri kaydetmek isteyebiliriz."))
        
        problemsArray.append(Problem(name: "Balık Kılçığı", imageName: "11", description: "Problem çözme tekniklerinden biri olan balık kılçığı ile denizleri korumak için bir çözüm geliştirelim."))
    }
}

