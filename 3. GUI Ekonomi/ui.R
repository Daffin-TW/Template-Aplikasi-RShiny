library(shiny)
library(shinydashboard)
library(DT)


shinyUI(dashboardPage(
  dashboardHeader(title=" SMA N 1 Kejayan"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home",tabName="beranda",icon=icon("th")),
      menuItem("Pendapatan",tabName="tab_pendapatan", icon=icon("th")),
      menuItem("Akuntansi",tabName="tab_akuntansi", icon=icon("th"))
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
              tags$b("Aplikasi Pembelajaran Digital Ekonomi Tingkat SMA"),
              br(),
              br(),
              br(),
              fluidRow(column(12, img(height=150,width=130,src="SMANIKE.png"))),
              br(),
              br(),
              h5(align="center",tags$b("Disusun Oleh:")),
              h5(align="center",tags$b("Tim Guru Ekonomi SMA N 1 Kejayan")),
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
                "Aplikasi Pembelajaran Digital Ekonomi Tingkat SMA."
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
        tabName="tab_pendapatan",
        tabsetPanel(
          tabPanel(
            "Pendapatan Nasional",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Gross National Produk (GNP)")
                ),
                numericInput("tab1_tag1_gdp", "GDP (Gross Domestik Produk):",0),
                numericInput("tab1_tag1_wni", "Pendapatan WNI di luar negeri:",0),
                numericInput("tab1_tag1_asg", "Pendapatan Tenaga Kerja Asing:",0),
                textInput("tab1_tag1_uang", "Mata uang yang digunakan:","Rp"),
                actionButton("act_pendapatan_gnp", "Hitung Gross National Produk"),
              ),
              box(
                h5(align="center",tags$b("Hasil Gross National Produk")),
                h5(textOutput("out_pendapatan_gnp"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Gross Domestik Produk (GDP) (Pendekatan Pendapatan)")
                ),
                numericInput("tab1_tag2_w", "Pendapatan Upah:",0),
                numericInput("tab1_tag2_r", "Pendapatan Sewa:",0),
                numericInput("tab1_tag2_i", "Pendapatan Bunga:",0),
                numericInput("tab1_tag2_p", "Laba:",0),
                textInput("tab1_tag2_uang", "Mata uang yang digunakan:","Rp"),
                actionButton(
                  "act_pendapatan_gdp_in", "Gross Domestik Produk"
                ),
              ),
              box(
                h5(align="center",tags$b("Hasil Gross Domestik Product")),
                h5(textOutput("out_pendapatan_gdp_in"),align="center")
              )
            ),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Gross Domestik Produk (GDP) (Pendekatan Pengeluaran)")
                ),
                numericInput("tab1_tag3_c", "Komsumsi Rumah Tangga:",0),
                numericInput("tab1_tag3_i", "Investasi Domestik:",0),
                numericInput("tab1_tag3_g", "Pengeluaran Pemerintah:",0),
                numericInput("tab1_tag3_x", "Ekspor:",0),
                numericInput("tab1_tag3_m", "Impor:",0),
                textInput("tab1_tag3_uang", "Mata uang yang digunakan:","Rp"),
                actionButton(
                  "act_pendapatan_gdp_out", "Hitung Gross Domestik Produk"
                ),
              ),
              box(
                h5(align="center",tags$b("Hasil Gross Domestik Produk")),
                h5(textOutput("out_pendapatan_gdp_out"),align="center")
              )
            )
          ),
          tabPanel(
            "Pendapatan Perkapita",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Pendapatan Per Kapita")
                ),
                numericInput("tab1_tag4_gnp", "GNP (Gross National Product):",0),
                numericInput("tab1_tag4_org", "Jumlah Penduduk:",0),
                textInput("tab1_tag4_uang", "Mata uang yang digunakan:","Rp"),
                actionButton("act_pendapatan_kpt", "Hitung Gross National Produk"),
              ),
              box(
                h5(align="center",tags$b("Hasil Pendapatan Per Kapita")),
                h5(textOutput("out_pendapatan_kpt"),align="center")
              )
            )
          )
        )
      ),
      tabItem(
        tabName="tab_akuntansi",
        tabsetPanel(
          tabPanel(
            "Ekuitas",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Jumlah Ekuitas Pemilik dalam Periode"),
                ),
                numericInput("tab2_tag1_a", "Besar Perubahan Aktiva:",0),
                numericInput("tab2_tag1_k", "Besar Perubahan Kewajiban:",0),
                textInput("tab2_tag1_uang", "Mata uang yang digunakan:","Rp"),
                actionButton("act_ekuitas", "Hitung Jumlah Ekuitas Pemilik"),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Jumlah Ekuitas Pemilik dalam Periode")
                ),
                h5(textOutput("out_ekuitas"),align="center")
              )
            )
          ),
          tabPanel(
            "Debit Akun",
            icon=icon("th"),
            fluidRow(
              box(
                h5(
                  align="center",
                  tags$b("Perhitungan Debit Akun"),
                ),
                numericInput("tab2_tag2_a", "Harga Beli:",0),
                numericInput("tab2_tag2_s", "Biaya Surat-Surat:",0),
                numericInput("tab2_tag2_b", "Biaya Biro Jasa:",0),
                textInput("tab2_tag2_uang", "Mata uang yang digunakan:","Rp"),
                actionButton(
                  "act_debit_akun", "Hitung Debit Akun"
                ),
              ),
              box(
                h5(
                  align="center",
                  tags$b("Hasil Debit Akun")
                ),
                h5(textOutput("out_debit_akun"),align="center")
              )
            )
          )
        )
      )
    )
  )
))