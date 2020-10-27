//
//  JSONs.swift
//  karton-ios
//
//  Created by Ece Azizoğlu on 2.08.2020.
//  Copyright © 2020 Ece Azizoğlu. All rights reserved.
//

import Foundation

let tr_content_json = """
[{
    "detail": "Problem çözmedeki temel elemanları görelim.",
    "docsLink": "https://codenotesalpay.web.app/1.html",
    "id": 0,
    "instruction": "https://codenotesalpay.web.app/1-problem/index.html",
    "name": "Kurt, Kuzu ve Ot",
    "practiceType": "url"
}, {
    "detail": "Bir algoritmanın, farklı parametreler için nasıl uygulandığını görelim.",
    "docsLink": "https://codenotesalpay.web.app/2.html",
    "id": 1,
    "instruction": "https://codenotesalpay.web.app/2-hanoi-tower/index.html",
    "name": "Hanoi Kuleleri",
    "practiceType": "url"
}, {
    "detail": "Renkler ve resimler bilgisayarda nasıl depolanır?",
    "docsLink": "https://codenotesalpay.web.app/3.html#0",
    "id": 2,
    "instruction": "https://codenotesalpay.web.app/3-color-picker/colorwheel.html",
    "name": "Piksel ve Renk",
    "practiceType": "url"
}, {
    "detail": "Gördüğün çizimleri arkadaşlarına anlatmada ne kadar başarılı olacaksın?",
    "docsLink": "https://codenotesalpay.web.app/4.html",
    "id": 3,
    "instruction": "processing kartları ile ilk program",
    "name": "Yönergeleri Takip Et",
    "practiceType": "demo"
}, {
    "detail": "Kodlama, bir program yazmak için ne anlama geliyorsa, haritalar da yön bulmak için aynı anlama gelir.",
    "docsLink": "https://codenotesalpay.web.app/5.html",
    "id": 4,
    "instruction": "https://codenotesalpay.web.app/5-maps/index.html",
    "name": "Haritalar",
    "practiceType": "url"
}, {
    "detail": "Mantık operatörlerini küçük bir oyun ile anlayalım",
    "docsLink": "https://codenotesalpay.web.app/6.html",
    "id": 5,
    "instruction": "https://codenotesalpay.web.app/6-guess-game/index.html",
    "name": "İşlemler ve Mantık",
    "practiceType": "url"
}, {
    "detail": "Mesajlarımızın başkaları tarafından okunmamasını nasıl sağlarız?",
    "docsLink": "https://codenotesalpay.web.app/7.html",
    "id": 6,
    "instruction": "encrypt ve decrypt komutlarını kullanın.",
    "name": "Kriptografi",
    "practiceType": "demo"
}, {
    "detail": "Farkında olmadan birçok algoritma oluşturdun. Artık tanımını öğrenme zamanı geldi.",
    "docsLink": "https://codenotesalpay.web.app/8.html",
    "id": 7,
    "instruction": "ilk algoritmamızı yapalım.",
    "name": "Algoritma Nedir?",
    "practiceType": "demo"
}, {
    "detail": "Beste yazmak ve kod yazmak birbirinden çok farklı işler değildir.",
    "docsLink": "https://codenotesalpay.web.app/9.html",
    "id": 8,
    "instruction": "ilk algoritmamızı yapalım.",
    "name": "Müzik Aleti Yapalım",
    "practiceType": "demo"
}, {
    "detail": "Tangram, basit şekillerden karmaşık yapıları oluşturmamızı sağlar.",
    "docsLink": "https://codenotesalpay.web.app/10.html",
    "id": 9,
    "instruction": "ilk algoritmamızı yapalım.",
    "name": "Tangram ve Algoritma",
    "practiceType": "demo"
}, {
    "detail": "Oluşturduğumuz yapılar içinde, bazı özellikleri kaydetmek isteyebiliriz.",
    "docsLink": "https://codenotesalpay.web.app/11.html",
    "id": 10,
    "instruction": "ilk algoritmamızı yapalım.",
    "name": "Veriler ve Değişkenler",
    "practiceType": "demo"
}, {
    "detail": "Problem çözme tekniklerinden biri olan balık kılçığı ile, denizleri korumak için bir çözüm geliştirelim.",
    "docsLink": "https://codenotesalpay.web.app/12.html",
    "id": 11,
    "instruction": "ilk algoritmamızı yapalım.",
    "name": "Balık Kılçığı",
    "practiceType": "demo"
}]
"""

let tr_example_json = """
[{
      "name": "Merhaba Dünya!",
      "programList": [
        {
          "name": "Kırmızı Daire",
          "code": [
            {
              "command": "doldur",
              "input": "r: 255 g: 0 b: 0",
              "type": "RGB"
            },
            {
              "command": "elips",
              "input": "x:200 y:200 w:250 h:250",
              "type": "XYWH"
            }

          ]
        },
        {
          "name": "Mavi Dikdörtgen",
          "code": [
            {
              "command": "doldur",
              "input": "r: 0 g: 0 b: 255",
              "type": "RGB"
            },
            {
              "command": "dörtgen",
              "input": "x:200 y:200 w:100 h:150",
              "type": "XYWH"
            }
          ]
        }
      ]
    },
    {
      "name": "Renkler ve Şekiller",
      "programList": [
        {
          "name": "Turuncu Daire ve Kare",
          "code": [
            {
              "command": "doldur",
              "input": "r: 255 g: 130 b: 0"
            },
            {
              "command": "elips",
              "input": "x:200 y:200 w:100 h:100"
            },
            {
              "command": "dörtgen",
              "input": "x:150 y:150 w:50 h:50"
            }
          ]
        },
        {
          "name": "Turuncu Daire ve Pembe Kare",
          "code": [
            {
              "command": "doldur",
              "input": "r: 255 g: 130 b: 0"
            },
            {
              "command": "elips",
              "input": "x:200 y:200 w:100 h:100"
            },
            {
              "command": "doldur",
              "input": "r: 255 g: 0 b: 190"
            },
            {
              "command": "dörtgen",
              "input": "x:150 y:150 w:50 h:50"
            }
          ]
        }
      ]
    },
    {
      "name": "Çizim Yapma",
      "programList": [
        {
          "name": "Araba",
          "code": [
            {
              "command": "doldur",
              "input": "r: 232 g: 103 b: 103"
            },
            {
              "command": "kenar",
              "input": "r: 165 g: 165 b: 165"
            },
            {
              "command": "dörtgen",
              "input": "x:100 y:50 w:150 h:100"
            },
            {
              "command": "elips",
              "input": "x:125 y:175 w:50 h:50"
            },
            {
              "command": "elips",
              "input": "x:225 y:175 w:50 h:50"
            }
          ]
        },
        {
          "name": "Kedi",
          "code": [
            {
              "command": "dörtgen",
              "input": "x: 100 y: 150 w: 100 h: 200"
            },
            {
              "command": "doldur",
              "input": "r: 200 g:100 b:100"
            },
            {
              "command": "elips",
              "input": "x: 100 y: 350 w:50 h:50"
            },
            {
              "command": "elips",
              "input": "x: 200 y: 350 w: 50 h: 50"
            },
            {
              "command": "üçgen",
              "input": "x: 60 y: 60 w: 50 h: 40"
            },
            {
              "command": "üçgen",
              "input": "x: 190 y: 60 w: 50 h: 40"
            },
            {
              "command": "doldur",
              "input": "r: 100 g: 90 b:120"
            },
            {
              "command": "elips",
              "input": "x: 150 y: 150 w: 200 h: 200"
            },
            {
              "command": "doldur",
              "input": "r: 255 g: 255 b: 255"
            },
            {
              "command": "elips",
              "input": "x: 120 y: 100 w: 50 h:50"
            },
            {
              "command": "elips",
              "input": "x: 180 y: 100 w: 50 h: 50"
            },
            {
              "command": "doldur",
              "input": "r: 0 g: 0 b: 0"
            },
            {
              "command": "elips",
              "input": "x: 120 y: 100 w: 20 h: 20"
            },
            {
              "command": "elips",
              "input": "x: 180 y: 100 w: 20 h: 20"
            },
            {
              "command": "kenar",
              "input": "r: 255 g: 255 b: 255"
            },
            {
              "command": "çizgi",
              "input": "sx: 150 sy: 170 ex: 120 ey: 180"
            },
            {
              "command": "çizgi",
              "input": "sx: 150 sy: 170 ex: 130 ey: 190"
            },
            {
              "command": "çizgi",
              "input": "sx: 150 sy: 170 ex: 180 ey: 180"
            },
            {
              "command": "çizgi",
              "input": "sx: 150 sy: 170 ex: 170 ey: 190"
            }
          ]
        }
      ]
    },
    {
      "name": "Değişkenler ve Animasyon",
      "programList": [
        {
          "name": "Dokunmatik Çizgiler",
          "code": [
            {
              "command": "doldur",
              "input": "r: 0 g: 0 b: 0"
            },
            {
              "command": "çizgi",
              "input": "sx: dokunX sy: 0 ex: dokunX ey: height"
            }
          ]
        },
        {
          "name": "Dokunmatik Renkler",
          "code": [
            {
              "command": "eğer:",
              "input": "dokunX > 250"
            },
            {
              "command": "doldur",
              "input": "r: 0 g: 0 b: 255"
            },
            {
              "command": "değilse",
              "input": ""
            },
            {
              "command": "doldur",
              "input": "r: 255 g: 0 b: 0"
            },
            {
              "command": "bitir",
              "input": ""
            },
            {
              "command": "elips",
              "input": "x: 100 y: 100 w: 100 h: 100"
            }
          ]
        }
      ]
    },
    {
      "name": "Fonksiyon ve Döngüler",
      "programList": [
        {
          "name": "On İki Araba",
          "code": [
            {
              "command": "fonksiyon tanımla:",
              "input": "araba"
            },
            {
              "command": "doldur",
              "input": "r: 232 g: 103 b: 103"
            },
            {
              "command": "kenar",
              "input": "r: 165 g: 165 b: 165"
            },
            {
              "command": "dörtgen",
              "input": "x:100 y:50 w:150 h:100"
            },
            {
              "command": "elips",
              "input": "x:125 y:175 w:50 h:50"
            },
            {
              "command": "elips",
              "input": "x:225 y:175 w:50 h:50"
            },
            {
              "command": "bitir",
              "input": ""
            },
            {
              "command": "tekrarla:",
              "input": "12"
            },
            {
              "command": "çağır",
              "input": "araba"
            },
            {
              "command": "ötele",
              "input": "x: 50 y: 20"
            },
            {
              "command": "bitir",
              "input": ""
            }
          ]
        },
        {
          "name": "İç İçe Döngü",
          "code": [
            {
              "command": "değişken tanımla",
              "input": "n: konumx v: 40"
            },
            {
              "command": "değişken tanımla",
              "input": "n: konumy v: 40"
            },
            {
              "command": "tekrarla:",
              "input": "5"
            },
            {
              "command": "tekrarla:",
              "input": "5"
            },
            {
              "command": "elips",
              "input": "x: konumx y: konumy w: 30 h: 30"
            },
            {
              "command": "bitir",
              "input": ""
            },
            {
              "command": "değer ata",
              "input": "n: konumx v: 40"
            },
            {
              "command": "değerini artır",
              "input": "n: konumy v: 50"
            },
            {
              "command": "değerini artır",
              "input": "n: konumx v: 50"
            },
            {
              "command": "bitir",
              "input": ""
            }
          ]
        }
      ]
    }]
"""

