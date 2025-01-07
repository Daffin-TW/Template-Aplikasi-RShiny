library(shiny)
library(shinydashboard)
library(DT)


shinyUI(dashboardPage(
  dashboardHeader(title=" SMA N 1 Kejayan"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home",tabName="beranda",icon=icon("th")),
      menuItem("Bangun Ruang",tabName="tab_bangun_ruang", icon=icon("th")),
      menuItem("Statistika",tabName="tab_statistika",icon=icon("th")),
      # menuItem("Integral",tabName="tab_integral",icon=icon("th")),
      # menuItem("Turunan",tabName="tab_turunan",icon=icon("th"))
      menuItem("Bangun datar",tabName="tab_bangun_datar",icon=icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName="beranda",
        tabsetPanel(
          tabPanel(
            "Halaman muka",icon=icon("th"),
            br(),
            br(),
            h3(
              align="center",
              tags$b("Aplikasi Pembelajaran Digital Matematika Tingkat SMA"),
              br(),
              br(),
              br(),
              fluidRow(column(12, img(height=150,width=130,src="SMANIKE.png"))),
              br(),
              br(),
              h5(align="center",tags$b("Disusun Oleh:")),
              h5(align="center",tags$b("Tim Guru Matematika SMA N 1 Kejayan")),
              h5(
                align="center",
                tags$b("TIM Pengabdian Masyarakat UPN Veteran Jawa Timur")
              ),
              br(),
              h5(
                align="center",
                tags$b(
                "DIREKTORAT RISET, TEKNOLOGI, DAN PENGABDIAN KEPADA
                MASYARAKAT DIREKTORAT JENDERAL PENDIDIKAN TINGGI, RISET, DAN 
                TEKNOLOGI KEMENTERIAN PENDIDIKAN, KEBUDAYAAN, RISET, DAN 
                TEKNOLOGI")
              ),
            )
          ), 
          tabPanel(
            "Kata Pengantar",
            icon=icon("th"),
            br(),
            h4(align="center",tags$b("KATA PENGANTAR")),
            br(),
            h5(
              align="justify",
              "Puji syukur penulis panjatkan kehadirat Allah SWT karena atas 
              rahmat dan karunia-Nya penulis dapat menyelesaikan program GUI 
              dengan judul",
              tags$b(
                "Aplikasi Pembelajaran Digital Matematika Tingkat SMA."
              ),
                "Penulis menyadari bahwa tanpa bantuan dari berbagai pihak, 
                program ini tidak akan dapat terselesaikan dengan baik. Oleh 
                karena itu pada kesempatan ini penulis ingin mengucapkan
                terima kasih kepada:"
              ),
            br(),
            p(tags$h5(
              align="left",
              "1. Kementerian Pendidikan Kebudayaan, Ristek, dan Teknologi")
            ),
            p(tags$h5(align="left","2. Rektor UPN Veteran Jawa Timur.")),
            p(tags$h5(align="left","3. Kepala Sekolah SMA N 1 Kejayan.")),
            p(tags$h5(
              align="left",
              "4. Semua pihak yang telah mendukung dalam menyelesaikan 
              program GUI ini.")
            ),
            br(),
            h5(
              align="justify",
              "Kami menyadari bahwa program GUI ini jauh dari sempurna, 
              oleh karena itu penulis sangat mengharapkan kritik dan saran yang 
              bersifat membangun dan semoga GUI ini dapat bermanfaat bagi 
              semua pihak."
            ),
            br(),
            br(),
            h5(align="right","Surabaya, Agustus 2024"),
            br(),
            h5(align="right","Tim Abdimas")
          ) 
        )
      ),
      tabItem(
        tabName="tab_bangun_ruang",
        tabsetPanel(
          tabPanel(
            "Balok dan Kubus",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Masukkan nilai parameter:")
                ),
                numericInput("tab1_tag1_p", "Panjang Balok/Kubus:",0),
                numericInput("tab1_tag1_l", "Lebar Balok/Kubus:",0),
                numericInput("tab1_tag1_t", "Tinggi Balok/Kubus:",0),
                textInput("tab1_tag1_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_balok", "Hitung Volume"),
              ),
              box(
                h5(align="center",tags$b("Volume Balok/Kubus")),
                h5(textOutput("out_volume_balok"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Permukaan Balok/Kubus")),
                column(12,align="center",offset=0,textOutput("out_luas_balok"))
              ),
              box(
                h5(
                  align="justify",
                  "Balok adalah bangun ruang tiga dimensi yang dibentuk oleh 
                  tiga pasang persegi atau persegi panjang, dengan paling tidak 
                  satu pasang di antaranya berukuran berbeda. Balok memiliki 6 
                  sisi, 12 rusuk dan 8 titik sudut. Balok yang dibentuk oleh 
                  enam persegi sama dan sebangun disebut sebagai kubus."
                )
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Panjang Sisi Kubus Berdasarkan Volume"),
                ),
                numericInput("tab1_tag2_volume", "Volume Kubus:",0),
                textInput("tab1_tag2_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_sisi_kubus", "Hitung Panjang Sisi"),
              ),
              box(
                h5(align="center",tags$b("Hasil Perhitungan Panjang Sisi")),
                h5(textOutput("out_sisi_kubus"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Panjang Sisi Balok Berdasarkan Volume"),
                ),
                numericInput("tab1_tag3_volume", "Volume Balok:",0),
                numericInput("tab1_tag3_s1", "Panjang Sisi Pertama:",0),
                numericInput("tab1_tag3_s2", "Panjang Sisi Kedua:",0),
                textInput("tab1_tag3_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_sisi_balok", "Hitung Panjang Sisi Ketiga"),
              ),
              box(
                h5(align="center",tags$b("Hasil Perhitungan Panjang Sisi Ketiga")),
                h5(textOutput("out_sisi_balok"),align="center")
              )
            )
          ),
          tabPanel(
            "Tabung",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Masukkan nilai parameter:")
                ),
                numericInput("tab1_tag4_t", "Tinggi Tabung:",0),
                numericInput("tab1_tag4_r", "Jari-jari Tabung:",0),
                textInput("tab1_tag4_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_tabung", "Hitung"),
              ),
              box(
                h5(align="center",tags$b("Volume Tabung")),
                h5(textOutput("out_volume_tabung"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Permukaan Tabung")),
                column(12,align="center",offset=0,textOutput("out_luas_tabung"))
              ),
              box(
                h5(
                  align="justify",
                  "Tabung atau silinder adalah bangun ruang tiga dimensi yang 
                  dibentuk oleh dua buah lingkaran identik yang sejajar dan 
                  sebuah persegi panjang yang mengelilingi kedua lingkaran 
                  tersebut. Tabung memiliki 3 sisi dan 2 rusuk."
                ),
                column(12, img(height=150,width=190,src="tabung.png"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menenentukan Volume berdasarkan Luas Permukaan")
                ),
                numericInput("tab1_tag5_luas", "Luas Permukaan Tabung:",0),
                numericInput("tab1_tag5_r", "Jari-jari Tabung:",0),
                textInput("tab1_tag5_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_tabung_volume_luas", "Hitung Volume"),
              ),
              box(
                h5(align="center",tags$b("Volume Tabung")),
                h5(textOutput("out_tabung_volume_luas"),align="center")
              )
            )
          ),
          tabPanel(
            "Kerucut",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Masukkan nilai parameter:")
                ),
                numericInput("tab1_tag6_h", "Tinggi Kerucut:",0),
                numericInput("tab1_tag6_r", "Jari-jari Kerucut:",0),
                textInput("tab1_tag6_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_kerucut", "Hitung"),
              ),
              box(
                h5(align="center",tags$b("Volume Kerucut")),
                h5(textOutput("out_volume_kerucut"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Permukaan Kerucut")),
                column(12,align="center",offset=0,textOutput("out_luas_kerucut"))
              ),
              box(
                h5(align="center",tags$b("Sisi Miring Kerucut")),
                column(12,align="center",offset=0,textOutput("out_miring_kerucut"))
              )
            )
          ),
          tabPanel(
            "Limas",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Volume dan Luas Alas Limas Segitiga:")
                ),
                numericInput("tab1_tag7_a", "Alas Segitiga:",0),
                numericInput("tab1_tag7_t", "Tinggi Segitiga:",0),
                numericInput("tab1_tag7_h", "Tinggi Sisi Tegak:",0),
                textInput("tab1_tag7_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_limas_tiga", "Hitung"),
              ),
              box(
                h5(align="center",tags$b("Volume Limas")),
                h5(textOutput("out_volume_limas_tiga"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Alas Limas")),
                column(
                  12,align="center",offset=0,textOutput("out_luas_limas_tiga")
                )
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Volume dan Luas Alas Limas Persegi Panjang:")
                ),
                numericInput("tab1_tag8_p", "Panjang Sisi:",0),
                numericInput("tab1_tag8_l", "Lebar Sisi:",0),
                numericInput("tab1_tag8_h", "Tinggi Sisi Tegak:",0),
                textInput("tab1_tag8_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_limas_empat", "Hitung"),
              ),
              box(
                h5(align="center",tags$b("Volume Limas")),
                h5(textOutput("out_volume_limas_empat"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Alas Limas")),
                column(
                  12,align="center",offset=0,textOutput("out_luas_limas_empat")
                )
              )
            )
          ),
          tabPanel(
            "Bola",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Volume dan Luas Permukaan Bola:")
                ),
                numericInput("tab1_tag9_r", "Jari-jari Bola:",0),
                textInput("tab1_tag9_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_bola", "Hitung"),
              ),
              box(
                h5(align="center",tags$b("Volume Bola")),
                h5(textOutput("out_volume_bola"),align="center")
              ),
              box(
                h5(align="center",tags$b("Luas Permukaan Bola")),
                column(
                  12,align="center",offset=0,textOutput("out_luas_bola")
                )
              )
            )
          )
        )
      ),
      tabItem(
        tabName="tab_statistika",
        tabsetPanel(
          tabPanel(
            "Nilai Data",
            icon=icon("th"),
            fluidRow(
              sidebarPanel(
                # Input: Select a file
                fileInput(
                  "file1",
                  h1(
                    "Choose CSV File",align="center",style = "font-size:30px;"
                  ),
                  multiple = FALSE,
                  accept = c(
                    "text/csv",
                    "text/comma-separated-values,text/plain",
                    ".csv"
                  )
                ),
                       
                # Horizontal line ----
                tags$hr(),
                       
                # Input: Checkbox if file has header ----
                checkboxInput("header", "Header", TRUE),
                       
                # Input: Select separator ----
                radioButtons(
                  "sep", "Separator",
                  choices = c(
                    Comma = ",",
                    Semicolon = ";",
                    Tab = "\t"
                  ),
                  selected = ","
                ),
                       
                # Input: Select quotes ----
                radioButtons(
                  "quote", "Quote",
                  choices = c(
                    None = "",
                    "Double Quote" = '"',
                    "Single Quote" = "'"
                  ),
                  selected = '"'),
                ),
                mainPanel("",DT::dataTableOutput("contents"))
              )
            ),
          tabPanel(
            "Analisis Deskriptif",icon=icon("th"),
            box(
              h5(tags$b("Statistika Deskriptif Data"),align="center"),
              column(
                12,align="center",offset=0,verbatimTextOutput("deskriptif"))
            ),
            box(
              h5(tags$b("Nilai korelasi"),align="center"),
              column(12,align="center",offset=0,verbatimTextOutput("korelasi"))
            )
          )
        )
      ),
      tabItem(
        tabName="tab_bangun_datar",
        tabsetPanel(
          tabPanel(
            "Persegi dan Persegi Panjang",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Luas Persegi:")
                ),
                numericInput("tab3_tag1_s", "Panjang Sisi Persegi:",0),
                textInput("tab3_tag1_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_persegi", "Hitung Luas"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Luas Persegi")),
                h5(textOutput("out_persegi"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Luas Persegi Panjang:")
                ),
                numericInput("tab3_tag2_p", "Panjang Persegi:",0),
                numericInput("tab3_tag2_l", "Lebar Persegi:",0),
                textInput("tab3_tag2_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_persegi_panjang", "Hitung Luas"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Luas Persegi Panjang")),
                h5(textOutput("out_persegi_panjang"),align="center")
              )
            )
          ),
          tabPanel(
            "Segitiga",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Luas Segitiga:")
                ),
                numericInput("tab3_tag3_a", "Alas Segitiga:",0),
                numericInput("tab3_tag3_t", "Tinggi Segitiga:",0),
                textInput("tab3_tag3_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_segitiga", "Hitung Luas"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Luas Segitiga")),
                h5(textOutput("out_segitiga"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Panjang Sisi Miring Segitiga Siku:")
                ),
                numericInput("tab3_tag4_a", "Alas Segitiga:",0),
                numericInput("tab3_tag4_t", "Tinggi Segitiga:",0),
                textInput("tab3_tag4_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_segitiga_siku", "Hitung Sisi Miring"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Sisi Miring Segitiga")),
                h5(textOutput("out_segitiga_siku"),align="center")
              )
            )
          ),
          tabPanel(
            "Lingkaran",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Masukkan Parameter:")
                ),
                numericInput("tab3_tag5_r", "Jari-jari Lingkaran:",0),
                textInput("tab3_tag5_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_lingkaran", "Hitung Luas dan Keliling"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Luas Lingkaran")),
                h5(textOutput("out_luas_lingkaran"),align="center")
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Keliling Lingkaran")),
                column(
                  12,align="center",offset=0,textOutput("out_keliling_lingkaran")
                )
              ),
            )
          ),
          tabPanel(
            "Trapesium",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Masukkan Parameter:")
                ),
                numericInput("tab3_tag6_a", "Alas Trapesium:",0),
                numericInput("tab3_tag6_b", "Atap Trapesium:",0),
                numericInput("tab3_tag6_t", "Tinggi Trapesium:",0),
                textInput("tab3_tag6_satuan", "Satuan yang digunakan:","cm"),
                actionButton("act_trapesium", "Hitung Luas Trapesium"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Luas Trapesium")),
                h5(textOutput("out_trapesium"),align="center")
              ),
            )
          ),
        )
      )
      # tabItem(
      #   tabName="tab_integral",
      #   tabsetPanel(
      #     tabPanel(
      #       "Integral Tak Tentu",
      #       icon=icon("th"),
      #       fluidRow(
      #         box(
      #           h5(
      #             align="center",
      #             tags$b("Tentukan Fungsi f(x):")
      #           ),
      #           textInput("tab3_tag1_f", "Fungsi f(x):","x^(1/2)"),
      #           actionButton("act_integral_tak_tentu", "Hitung"),
      #         ),
      #         box(
      #           h5(align="center",tags$b("Integral Fungsi f(X)")),
      #           h5(textOutput("out_integral_tak_tentu"),align="center")
      #         )
      #       )
      #     ),
      #     tabPanel(
      #       "Tab",
      #       icon=icon("th"),
      #       fluidRow(
      #         
      #       )
      #     )
      #   )
      # )
    )
  )
))