library(shiny)
library(DT)
library(ggplot2)
library(rlang)


shinyServer(function(input, output) {
  
  # Vektor
  observeEvent(
    input$act_resultan_tegak,{
      output$out_resultan_tegak<-renderPrint({
        # Rumus Pythagoras
        resultan = (
            input$tab1_tag1_vektor_a^2 + input$tab1_tag1_vektor_b^2
          )^0.5
        cat("Resultan Vektor",round(resultan, 2)," ",input$tab1_tag1_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_resultan_sudut,{
      output$out_resultan_sudut<-renderPrint({
        resultan = (
              input$tab1_tag2_vektor_a^2 + 
              input$tab1_tag2_vektor_b^2 +
              2 * input$tab1_tag2_vektor_a * 
              input$tab1_tag2_vektor_b * cos(input$tab1_tag2_sudut/180 * pi)
          )^0.5
        cat("Resultan Vektor",round(resultan, 2)," ",input$tab1_tag2_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_komponen,{
      output$out_komponen_x<-renderPrint({
        komponen_x = (
          input$tab1_tag3_vektor_a * cos(input$tab1_tag3_sudut/180 * pi)
        )
        cat("Komponen Vektor",round(komponen_x, 2)," ",input$tab1_tag3_satuan)
      })
      output$out_komponen_y<-renderPrint({
        komponen_y = (
          input$tab1_tag3_vektor_a * sin(input$tab1_tag3_sudut/180 * pi)
        )
        cat("Komponen Vektor",round(komponen_y, 2)," ",input$tab1_tag3_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_sudut_diapit,{
      output$out_sudut_diapit<-renderPrint({
        cos_tetha = (
          (
            input$tab1_tag4_vektor_ab^2 -
            input$tab1_tag4_vektor_a^2 - 
            input$tab1_tag4_vektor_b^2
          ) / -(2 * input$tab1_tag4_vektor_a * input$tab1_tag4_vektor_b)
        )
        sudut = suppressWarnings(acos(cos_tetha) * (180/pi))
        
        if (is.na(sudut)) {
          cat("Parameter tidak valid")
        }
        else {
          cat("Sudut",round(sudut, 2)," Derajat")
        }
      })
    }
  )
  
  # Gerak dan Kecepatan
  observeEvent(
    input$act_glb_kecepatan,{
      output$out_glb_kecepatan<-renderPrint({
        kecepatan = input$tab2_tag1_s / input$tab2_tag1_t
        
        if (is.na(kecepatan) | is.infinite((kecepatan))) {
          cat("Parameter tidak valid")
        }
        else {
          cat(
            "Kecepatan",round(kecepatan, 2),
            " ",input$tab2_tag1_satuan_s,"/",input$tab2_tag1_satuan_t
          )
        }
      })
    }
  )
  
  observeEvent(
    input$act_glb_perpindahan,{
      output$out_glb_perpindahan<-renderPrint({
        perpindahan = input$tab2_tag2_v * input$tab2_tag2_t
        cat(
          "Perpindahan",round(perpindahan, 2)," ",input$tab2_tag2_satuan
        )
      })
    }
  )
  
  observeEvent(
    input$act_glbb_kecepatan,{
      output$out_glbb_kecepatan<-renderPrint({
        kecepatan = input$tab2_tag3_v0 + input$tab2_tag3_a * input$tab2_tag3_t
        cat(
          "Kecepatan",round(kecepatan, 2),
          " ",input$tab2_tag3_satuan_s,"/",input$tab2_tag3_satuan_t
        )
      })
    }
  )
  
  observeEvent(
    input$act_glbb_perpindahan,{
      output$out_glbb_perpindahan<-renderPrint({
        perpindahan = (
          input$tab2_tag4_v0 * input$tab2_tag4_t +
          0.5 * input$tab2_tag4_a * input$tab2_tag4_t^2
        )
        cat("Perpindahan",round(perpindahan, 2)," ",input$tab2_tag4_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_glbb_percepatan,{
      output$out_glbb_percepatan<-renderPrint({
        percepatan = (input$tab2_tag5_v - input$tab2_tag5_v0) / input$tab2_tag5_t
        if (is.na(percepatan) | is.infinite((percepatan))) {
          cat("Parameter tidak valid")
        }
        else {
          cat(
            "Percepatan",round(percepatan, 2),
            " ",input$tab2_tag5_satuan_s,"/",input$tab2_tag5_satuan_t, "kuadrat"
          )
        }
      })
    }
  )
  
  # Gaya
  observeEvent(
    input$act_newtonii_gaya,{
      output$out_newtonii_gaya<-renderPrint({
        gaya = input$tab3_tag1_m * input$tab3_tag1_a
        cat("Gaya Total",round(gaya, 2)," ",input$tab3_tag1_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_newtonii_percepatan,{
      output$out_newtonii_percepatan<-renderPrint({
        percepatan = input$tab3_tag2_f / input$tab3_tag2_m
        if (is.na(percepatan) | is.infinite((percepatan))) {
          cat("Parameter tidak valid")
        }
        else {
          cat(
            "Percepatan",round(percepatan, 2)," ",input$tab3_tag2_satuan
          )
        }
      })
    }
  )
})