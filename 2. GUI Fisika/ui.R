library(shiny)
library(shinydashboard)
library(DT)


shinyUI(dashboardPage(
  dashboardHeader(title=" SMA N 1 Kejayan"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home",tabName="beranda",icon=icon("th")),
      menuItem("Vektor",tabName="tab_vektor", icon=icon("th")),
      menuItem("Gerak",tabName="tab_gerak", icon=icon("th")),
      menuItem("Gaya",tabName="tab_gaya", icon=icon("th"))
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
              tags$b("Aplikasi Pembelajaran Digital Fisika Tingkat SMA"),
              br(),
              br(),
              br(),
              fluidRow(column(12, img(height=150,width=130,src="SMANIKE.png"))),
              br(),
              br(),
              h5(align="center",tags$b("Disusun Oleh:")),
              h5(align="center",tags$b("Tim Guru Fisika SMA N 1 Kejayan")),
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
                "Aplikasi Pembelajaran Digital Fisika Tingkat SMA."
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
        tabName="tab_vektor",
        tabsetPanel(
          tabPanel(
            "Penjumlahan Vektor",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Besar Resultan Dua Vektor Tegak Lurus")
                ),
                numericInput("tab1_tag1_vektor_a", "Vektor A:",0),
                numericInput("tab1_tag1_vektor_b", "Vektor B:",0),
                textInput("tab1_tag1_satuan", "Satuan yang digunakan:","N"),
                actionButton("act_resultan_tegak", "Hitung Resultan Vektor"),
              ),
              box(
                h5(align="center",tags$b("Hasil Resultan Vektor")),
                h5(textOutput("out_resultan_tegak"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Besar Resultan Dua Vektor Membentuk Sudut (θ)"),
                ),
                numericInput("tab1_tag2_vektor_a", "Vektor A:",0),
                numericInput("tab1_tag2_vektor_b", "Vektor B:",0),
                numericInput("tab1_tag2_sudut", "Sudut θ:",0),
                textInput("tab1_tag2_satuan", "Satuan yang digunakan:","N"),
                actionButton("act_resultan_sudut", "Hitung Resultan Vektor"),
              ),
              box(
                h5(align="center",tags$b("Hasil Resultan Vektor")),
                h5(textOutput("out_resultan_sudut"),align="center")
              )
            )
          ),
          tabPanel(
            "Komponen Vektor",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Komponen Vektor A Terhadap Sumbu x dan y"),
                ),
                numericInput("tab1_tag3_vektor_a", "Vektor A:",0),
                numericInput("tab1_tag3_sudut", "Sudut θ:",0),
                textInput("tab1_tag3_satuan", "Satuan yang digunakan:","N"),
                actionButton("act_komponen", "Hitung Komponen Vektor"),
              ),
              box(
                h5(align="center",tags$b("Hasil Komponen Vektor Terhadap Sumbu x")),
                h5(textOutput("out_komponen_x"),align="center")),
              box(
                h5(tags$b("Hasil Komponen Vektor Terhadap Sumbu y"),align="center"),
                column(12,align="center",offset=0,textOutput("out_komponen_y"))
              )
            )
          ),
          tabPanel(
            "Sudut Diapit",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Besar Sudut yang Diapit oleh Vektor A dan B"),
                ),
                numericInput("tab1_tag4_vektor_a", "Vektor A:",0),
                numericInput("tab1_tag4_vektor_b", "Vektor B:",0),
                numericInput("tab1_tag4_vektor_ab", "Vektor A + B:",0),
                actionButton("act_sudut_diapit", "Hitung Sudut Diapit"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Sudut Diapit oleh Vektor A dan B")
                ),
                h5(textOutput("out_sudut_diapit"),align="center")
              ),
            )
          )
        )
      ),
      tabItem(
        tabName="tab_gerak",
        tabsetPanel(
          tabPanel(
            "Gerak Lurus Beraturan",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Kecepatan berdasarkan Perpindahan dan Waktu"),
                ),
                numericInput("tab2_tag1_s", "Perpindahan:",0),
                numericInput("tab2_tag1_t", "Waktu:",0),
                textInput("tab2_tag1_satuan_s", "Satuan jarak yang digunakan:","m"),
                textInput("tab2_tag1_satuan_t", "Satuan waktu yang digunakan:","s"),
                actionButton("act_glb_kecepatan", "Hitung Kecepatan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Kecepatan")
                ),
                h5(textOutput("out_glb_kecepatan"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Perpindahan berdasarkan Kecepatan dan Waktu"),
                ),
                numericInput("tab2_tag2_v", "Kecepatan:",0),
                numericInput("tab2_tag2_t", "Waktu (sekon):",0),
                textInput("tab2_tag2_satuan", "Satuan jarak yang digunakan:","m"),
                actionButton("act_glb_perpindahan", "Hitung Perpindahan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Perpindahan")
                ),
                h5(textOutput("out_glb_perpindahan"),align="center")
              )
            )
          ),
          tabPanel(
            "Gerak Lurus Berubah Beraturan",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Kecepatan Sesaat berdasarkan Percepatan dan Waktu"),
                ),
                numericInput("tab2_tag3_v0", "Kecepatan Awal:",0),
                numericInput("tab2_tag3_a", "Percepatan:",0),
                numericInput("tab2_tag3_t", "Waktu:",0),
                textInput("tab2_tag3_satuan_s", "Satuan jarak yang digunakan:","m"),
                textInput("tab2_tag3_satuan_t", "Satuan waktu yang digunakan:","s"),
                actionButton("act_glbb_kecepatan", "Hitung Kecepatan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Kecepatan")
                ),
                h5(textOutput("out_glbb_kecepatan"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Perpindahan berdasarkan Percepatan dan Waktu"),
                ),
                numericInput("tab2_tag4_v0", "Kecepatan Awal:",0),
                numericInput("tab2_tag4_a", "Percepatan:",0),
                numericInput("tab2_tag4_t", "Waktu (sekon):",0),
                textInput("tab2_tag4_satuan", "Satuan jarak yang digunakan:","m"),
                actionButton("act_glbb_perpindahan", "Hitung Perpindahan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Perpindahan")
                ),
                h5(textOutput("out_glbb_perpindahan"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Percepatan berdasarkan Kecepatan dan Waktu"),
                ),
                numericInput("tab2_tag5_v", "Kecepatan Sesaat:",0),
                numericInput("tab2_tag5_v0", "Kecepatan Awal:",0),
                numericInput("tab2_tag5_t", "Waktu:",0),
                textInput("tab2_tag5_satuan_s", "Satuan jarak yang digunakan:","m"),
                textInput("tab2_tag5_satuan_t", "Satuan waktu yang digunakan:","s"),
                actionButton("act_glbb_percepatan", "Hitung Percepatan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Perpindahan")
                ),
                h5(textOutput("out_glbb_percepatan"),align="center")
              )
            )
          )
        )
      ),
      tabItem(
        tabName="tab_gaya",
        tabsetPanel(
          tabPanel(
            "Hukum Percepatan",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Gaya Total berdasarkan Massa dan Percepatan"),
                ),
                numericInput("tab3_tag1_m", "Massa Benda (Kg):",0),
                numericInput("tab3_tag1_a", "Percepatan Benda (m/s²):",0),
                textInput("tab3_tag1_satuan", "Satuan gaya yang digunakan:","N"),
                actionButton("act_newtonii_gaya", "Hitung Gaya Resultan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Gaya Resultan")
                ),
                h5(textOutput("out_newtonii_gaya"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Percepatan berdasarkan Gaya Total dan Massa"),
                ),
                numericInput("tab3_tag2_f", "Gaya Total (N):",0),
                numericInput("tab3_tag2_m", "Massa Benda (Kg):",0),
                textInput("tab3_tag2_satuan", "Satuan gaya yang digunakan:","m/s²"),
                actionButton("act_newtonii_percepatan", "Hitung Percepatan"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Percepatan")
                ),
                h5(textOutput("out_newtonii_percepatan"),align="center")
              )
            )
          )
        )
      )
    )
  )
))