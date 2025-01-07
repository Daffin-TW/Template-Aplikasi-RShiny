library(shiny)
library(DT)
library(ggplot2)
library(rlang)


options(scipen=999)

shinyServer(function(input, output) {
  
  # Hukum Dasar Kimia
  observeEvent(
    input$act_avogadro,{
      output$out_avogadro<-renderPrint({
        v2 = input$tab1_tag1_v1 * input$tab1_tag1_n2 / input$tab1_tag1_n1
        cat("Volume (V₂) = ",round(v2, 3),input$tab1_tag1_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_boyle,{
      output$out_boyle<-renderPrint({
        v2 = input$tab1_tag2_v1 * input$tab1_tag2_p1 / input$tab1_tag2_p2
        cat("Volume (V₂) = ",round(v2, 3),input$tab1_tag2_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_charles,{
      output$out_charles<-renderPrint({
        v2 = input$tab1_tag3_v1 * input$tab1_tag3_t2 / input$tab1_tag3_t1
        cat("Volume (V₂) = ",round(v2, 3),input$tab1_tag3_satuan)
      })
    }
  )
  
  # Larutan dan Molalitas
  observeEvent(
    input$act_molaritas,{
      output$out_molaritas<-renderPrint({
        m = input$tab2_tag1_n / input$tab2_tag1_v
        cat("Molaritas = ",round(m, 3),"mol /",input$tab1_tag3_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_molalitas,{
      output$out_molalitas<-renderPrint({
        m = input$tab2_tag2_n / input$tab2_tag2_m
        cat("Molalitas = ",round(m, 3),"mol / kg")
      })
    }
  )
  
  observeEvent(
    input$act_fraksi_ter,{
      output$out_fraksi_ter<-renderPrint({
        Xter = input$tab2_tag3_nter / (input$tab2_tag3_nter + input$tab2_tag3_npel)
        cat("Fraksi Mol = ",round(Xter, 3))
      })
    }
  )
  
  observeEvent(
    input$act_fraksi_pel,{
      output$out_fraksi_pel<-renderPrint({
        Xpel = input$tab2_tag4_npel / (input$tab2_tag4_nter + input$tab2_tag4_npel)
        cat("Fraksi Mol = ",round(Xpel, 3))
      })
    }
  )
  
  # Gas Ideal
  observeEvent(
    input$act_gas_ideal_mol,{
      output$out_gas_ideal_mol<-renderPrint({
        mol = (
          (input$tab3_tag1_p * input$tab3_tag1_v) /
          (input$tab3_tag1_r * input$tab3_tag1_t)
        )
        cat("Jumlah mol gas = ",round(mol, 3),"mol")
      })
    }
  )
  
  observeEvent(
    input$act_kepadatan_gas,{
      output$out_kepadatan_gas<-renderPrint({
        d = (
          (input$tab3_tag2_p * input$tab3_tag2_m) /
            (input$tab3_tag2_r * input$tab3_tag2_t)
        )
        cat("Kepadatan Gas = ",round(d, 3),"g / L")
      })
    }
  )
  
})