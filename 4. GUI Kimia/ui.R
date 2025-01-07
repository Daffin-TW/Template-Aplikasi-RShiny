library(shiny)
library(shinydashboard)
library(DT)


shinyUI(dashboardPage(
  dashboardHeader(title=" SMA N 1 Kejayan"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home",tabName="beranda",icon=icon("th")),
      menuItem("Hukum Dasar Kimia",tabName="tab_hukum_dasar", icon=icon("th")),
      menuItem(
        "Larutan dan Molalitas",tabName="tab_larutan_molalitas", icon=icon("th")
      ),
      menuItem("Gas Ideal",tabName="tab_gas_ideal", icon=icon("th"))
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
              tags$b("Aplikasi Pembelajaran Digital Kimia Tingkat SMA"),
              br(),
              br(),
              br(),
              fluidRow(column(12, img(height=150,width=130,src="SMANIKE.png"))),
              br(),
              br(),
              h5(align="center",tags$b("Disusun Oleh:")),
              h5(align="center",tags$b("Tim Guru Kimia SMA N 1 Kejayan")),
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
                "Aplikasi Pembelajaran Digital Kimia Tingkat SMA."
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
        tabName="tab_hukum_dasar",
        tabsetPanel(
          tabPanel(
            "Hukum Avogadro",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Volume Gas berdasarkan Jumlah mol")
                ),
                numericInput("tab1_tag1_v1", "Volume Gas (V₁):",0),
                numericInput("tab1_tag1_n1", "Jumlah mol Gas 1 (n₁):",0),
                numericInput("tab1_tag1_n2", "Jumlah mol Gas 2 (n₂):",0),
                textInput("tab1_tag1_satuan", "Satuan yang digunakan:","Liter"),
                actionButton("act_avogadro", "Hitung Volume Gas"),
              ),
              box(
                h5(align="center",tags$b("Hasil HitungVolume Gas")),
                h5(textOutput("out_avogadro"),align="center")
              )
            )
          ),
          tabPanel(
            "Hukum Boyle",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Perubahan Tekanan dan Volume Gas")
                ),
                numericInput("tab1_tag2_v1", "Volume Gas (V₁):",0),
                numericInput("tab1_tag2_p1", "Tekanan Gas 1 (P₁):",0),
                numericInput("tab1_tag2_p2", "Tekanan Gas 2 (P₂):",0),
                textInput("tab1_tag2_satuan", "Satuan yang digunakan:","Liter"),
                actionButton("act_boyle", "Hitung Volume Gas"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Volume Gas")),
                h5(textOutput("out_boyle"),align="center")
              )
            )
          ),
          tabPanel(
            "Hukum Charles",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Perubahan Tekanan dan Volume Gas")
                ),
                numericInput("tab1_tag3_v1", "Volume Gas (V₁):",0),
                numericInput("tab1_tag3_t1", "Suhu 1 (T₁):",0),
                numericInput("tab1_tag3_t2", "Suhu Gas 2 (T₂):",0),
                textInput("tab1_tag3_satuan", "Satuan yang digunakan:","Liter"),
                actionButton("act_charles", "Hitung Volume Gas"),
              ),
              box(
                h5(align="center",tags$b("Hasil HitungVolume Gas")),
                h5(textOutput("out_charles"),align="center")
              )
            )
          )
        )
      ),
      tabItem(
        tabName="tab_larutan_molalitas",
        tabsetPanel(
          tabPanel(
            "Molaritas",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Molaritas berdasarkan Jumlah mol dan Volume"),
                ),
                numericInput("tab2_tag1_n", "Jumlah mol Zat Terlarut (n):",0),
                numericInput("tab2_tag1_v", "Volume Larutan (V):",0),
                textInput("tab2_tag1_satuan", "Satuan yang digunakan:","Liter"),
                actionButton("act_molaritas", "Hitung Molaritas"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Molaritas")
                ),
                h5(textOutput("out_molaritas"),align="center")
              )
            )
          ),
          tabPanel(
            "Molalitas",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b(
                    "Menghitung Molalitas berdasarkan Jumlah mol dan Massa Pelarut"
                  ),
                ),
                numericInput("tab2_tag2_n", "Jumlah mol Zat Terlarut (n):",0),
                numericInput("tab2_tag2_m", "Massa Pelarut (kg):",0),
                actionButton("act_molalitas", "Hitung Molalitas"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Molalitas")
                ),
                h5(textOutput("out_molalitas"),align="center")
              )
            )
          ),
          tabPanel(
            "Fraksi Mol (X)",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b(
                    "Menghitung Perbandingan Jumlah mol Komponen untuk Zat Terlarut"
                  ),
                ),
                numericInput("tab2_tag3_nter", "Jumlah mol Terlarut:",0),
                numericInput("tab2_tag3_npel", "Jumlah mol Pelarut:",0),
                actionButton("act_fraksi_ter", "Hitung Fraksi Mol"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Fraksi Mol")
                ),
                h5(textOutput("out_fraksi_ter"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b(
                    "Menghitung Perbandingan Jumlah mol Komponen untuk Zat Terlarut"
                  ),
                ),
                numericInput("tab2_tag4_nter", "Jumlah mol Terlarut:",0),
                numericInput("tab2_tag4_npel", "Jumlah mol Pelarut:",0),
                actionButton("act_fraksi_pel", "Hitung Fraksi Mol"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Hitung Fraksi Mol")
                ),
                h5(textOutput("out_fraksi_pel"),align="center")
              )
            )
          )
        )
      ),
      tabItem(
        tabName="tab_gas_ideal",
        tabsetPanel(
          tabPanel(
            "Dasar Gas Ideal",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Jumlah mol")
                ),
                numericInput("tab3_tag1_p", "Tekanan (P):",0),
                numericInput("tab3_tag1_v", "Volume Gas (V):",0),
                numericInput("tab3_tag1_t", "Suhu Kelvin (T):",0),
                numericInput("tab3_tag1_r", "Konstanta Gas Ideal (R):",0.0821),
                actionButton("act_gas_ideal_mol", "Hitung Jumlah mol"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Jumlah mol")),
                h5(textOutput("out_gas_ideal_mol"),align="center")
              )
            )
          ),
          tabPanel(
            "Kepadatan Gas",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Menghitung Kepadatan Gas")
                ),
                numericInput("tab3_tag2_p", "Tekanan (P):",0),
                numericInput("tab3_tag2_m", "Massa Molar (M):",0),
                numericInput("tab3_tag2_t", "Suhu Kelvin (T):",0),
                numericInput("tab3_tag2_r", "Konstanta Gas Ideal (R):",0.0821),
                actionButton("act_kepadatan_gas", "Hitung Kepadatan Gas"),
              ),
              box(
                h5(align="center",tags$b("Hasil Hitung Kepadatan Gas")),
                h5(textOutput("out_kepadatan_gas"),align="center")
              )
            )
          )
        )
      )
    )
  )
))