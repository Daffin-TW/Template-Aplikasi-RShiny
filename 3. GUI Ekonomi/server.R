library(shiny)
library(DT)
library(ggplot2)
library(rlang)


options(scipen=999)

shinyServer(function(input, output) {
  
  # Pendapatan
  observeEvent(
    input$act_pendapatan_gnp,{
      output$out_pendapatan_gnp<-renderPrint({
        gnp = input$tab1_tag1_gdp + input$tab1_tag1_wni - input$tab1_tag1_asg
        cat("GNP = ",input$tab1_tag1_uang,format(gnp, nsmall=1, big.mark=","))
      })
    }
  )
  
  observeEvent(
    input$act_pendapatan_gdp_in,{
      output$out_pendapatan_gdp_in<-renderPrint({
        gdp = (
          input$tab1_tag2_w + input$tab1_tag2_r + 
          input$tab1_tag2_i + input$tab1_tag2_p
        )
        cat("GDP = ",input$tab1_tag2_uang,format(gdp, nsmall=1, big.mark=","))
      })
    }
  )
  
  observeEvent(
    input$act_pendapatan_gdp_out,{
      output$out_pendapatan_gdp_out<-renderPrint({
        gdp = (
          input$tab1_tag3_c + input$tab1_tag3_i + input$tab1_tag3_g + 
          input$tab1_tag3_x - input$tab1_tag3_m
        )
        cat("GDP = ",input$tab1_tag3_uang,format(gdp, nsmall=1, big.mark=","))
      })
    }
  )
  
  observeEvent(
    input$act_pendapatan_kpt,{
      output$out_pendapatan_kpt<-renderPrint({
        pendapatan = input$tab1_tag4_gnp / input$tab1_tag4_org
        cat(
          "Pendapatan Per Kapita = ",
          input$tab1_tag3_uang,format(pendapatan, nsmall=1, big.mark=",")
        )
      })
    }
  )
  
  # Akuntansi
  observeEvent(
    input$act_ekuitas,{
      output$out_ekuitas<-renderPrint({
        ekuitas = input$tab2_tag1_a - input$tab2_tag1_k
        cat(
          "Jumlah Ekuitas Pemilik = ",
          input$tab2_tag1_uang,format(ekuitas, nsmall=1, big.mark=",")
        )
      })
    }
  )
  
  observeEvent(
    input$act_debit_akun,{
      output$out_debit_akun<-renderPrint({
        debit = input$tab2_tag2_a + input$tab2_tag2_s + input$tab2_tag2_b
        cat(
          "Debit Akun = ",
          input$tab2_tag2_uang,format(debit, nsmall=1, big.mark=",")
        )
      })
    }
  )
})