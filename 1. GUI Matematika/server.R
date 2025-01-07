library(shiny)
library(DT)
library(ggplot2)
library(rlang)


shinyServer(function(input, output) {
  # Statistika
  dInput <- reactive({
    in.file <- input$file1
    if (is.null(in.file)){
      return(NULL)
      
    }else
      df <- read.csv(input$file1$datapath,
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
    
  })
  
  output$contents<- DT::renderDataTable({
    d.input <- datatable(dInput())
    d.input
  })
  
  
  nilai_return<-reactive({
    data_awal=data.frame(dInput())
    n = nrow(data_awal)
    returnsaham= matrix(nrow=n-1)
    for(i in 1:n-1)
    {
      returnsaham[i,]<- log(data_awal[i+1,] / data_awal[i,])
    }
    return(returnsaham)
  })
  
  
  
  parameter_var<-reactive({
    b=nilai_return()
    a=matrix(nrow = 2,ncol = 1)
    a[1,1]= mean(b)
    a[2,1]= sd(b)
    return(a)
  })
  
  
  
  
  output$return<-renderDataTable({
    d1=data.frame(dInput())
    n=nrow(d1)
    
    returndata= matrix(nrow=n-1)
    for(i in 1:n-1)
    {
      returndata[i,]<- log(d1[i+1,] / d1[i,])
    }
    return(returndata)
  })
  
  
  
  output$normal<-renderPrint({
    d1=data.frame(dInput())
    n=nrow(d1)
    
    returndata= matrix(nrow=n-1)
    for(i in 1:n-1)
    {
      returndata[i,]<- log(d1[i+1,] / d1[i,])
    }
    a=ks.test(returndata,"pnorm",mean(returndata),sd(returndata))
    print(a)
    ujinorm = ifelse(a$p.value>=0.05,"Data return berdistribusi Normal","Data return tidak berdistribusi Normal")
    cat("Kesimpulan:","\n",ujinorm)
  })
  
  output$pf<-renderPlot({
    d1=data.frame(dInput())
    n=nrow(d1)
    
    returndata= matrix(nrow=n-1)
    for(i in 1:n-1)
    {
      returndata[i,]<- log(d1[i+1,] / d1[i,])
    }
    x=as.vector(returndata)
    iqd <- summary(x)[5] - summary(x)[2]
    plot(density(x, width = 2 * iqd), xlab = "data return", ylab= "densitas", type = "l",
         main="Plot Fungsi Kepadatan Peluang Data Return")
    
    #qqline(x)
  })
  output$qqnormal<-renderPlot({
    d1=data.frame(dInput())
    n=nrow(d1)
    
    returndata= matrix(nrow=n-1)
    for(i in 1:n-1)
    {
      returndata[i,]<- log(d1[i+1,] / d1[i,])
    }
    x=as.vector(returndata)
    qqnorm(x)
  })
  
  output$muvar<-renderUI({
    a=parameter_var()
    mmuvar=a[1,1]
    numericInput('muvar', 'Rata-Rata Return :',mmuvar)
  })
  
  output$sdvar<-renderUI({
    a=parameter_var()
    sdvar2=a[2,1]
    numericInput('sdvar', 'Standar Deviasi Return :',sdvar2)
  })
  
  output$contents<- DT::renderDataTable({
    d.input <- datatable(dInput())
    d.input
  })
  
  output$deskriptif<-renderPrint({
    d1=data.frame(dInput())
    d2 = as.matrix(d1)
    b = ncol(d1)
    a=matrix(nrow = 5,ncol = b)
    colnames(a) = colnames(d1)
    rownames(a)<- c("Rata-rata","Std.dev","Variansi","Maksimum","Minimum")
    
    a[1,1]=mean(d2[,1])
    a[2,1]=sd(d2[,1])
    a[3,1]=var(d2[,1])
    a[4,1]=min(d2[,1])
    a[5,1]=max(d2[,1])
    
    a[1,2]=mean(d2[,2])
    a[2,2]=sd(d2[,2])
    a[3,2]=var(d2[,2])
    a[4,2]=min(d2[,2])
    a[5,2]=max(d2[,2])
    
    print(a)
    
  })
  
  output$korelasi<-renderPrint({
    d1=data.frame(dInput())
    d2 = as.matrix(d1)
    a = cor(d2[,1],d2[,2], method = ("spearman"))
    
    cat("Nilai Korelasi = ",a," ")
    
    if ( a <= 1) 
    {
      print("Korelasi yang terbentuk bersifat sangat kuat")
      if ( a < 0.8) 
      {
        print("Korelasi yang terbentuk bersifat kuat")
      } 
      if ( a < 0.6) 
      {
        print("Korelasi yang terbentuk bersifat sedang")
      }
      if ( a < 0.6) 
      {
        print("Korelasi yang terbentuk bersifat lemah")
      }
    }
  })
  
  # Bangun RUang
  observeEvent(
    input$act_balok,{
      output$out_volume_balok<-renderPrint({
        volume = input$tab1_tag1_p * input$tab1_tag1_l * input$tab1_tag1_t
        cat("Volume =",volume,input$tab1_tag1_satuan,"kubik")
      })
      output$out_luas_balok<-renderPrint({
        luas = 2 * (
          input$tab1_tag1_p * input$tab1_tag1_l +
          input$tab1_tag1_p * input$tab1_tag1_t +
          input$tab1_tag1_l * input$tab1_tag1_t
        )
        cat("Luas Permukaan =",luas,input$tab1_tag1_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_sisi_kubus,{
      output$out_sisi_kubus<-renderPrint({
        sisi = input$tab1_tag2_volume^(1/3)
        cat("Panjang Sisi =",sisi,input$tab1_tag2_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_sisi_balok,{
      output$out_sisi_balok<-renderPrint({
        sisi = input$tab1_tag3_volume / (input$tab1_tag3_s1 * input$tab1_tag3_s2)
        cat("Panjang Sisi =",sisi,input$tab1_tag3_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_tabung,{
      output$out_volume_tabung<-renderPrint({
        volume = pi * input$tab1_tag4_r^2 * input$tab1_tag4_t
        cat("Volume =",round(volume, 2),input$tab1_tag4_satuan,"kubik")
      })
      output$out_luas_tabung<-renderPrint({
        luas = (
          (2 * (pi * input$tab1_tag4_r * input$tab1_tag4_t)) +
          (2 * pi * input$tab1_tag4_r^2)
        )
        cat("Luas Permukaan =",round(luas, 2),input$tab1_tag4_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_tabung_volume_luas,{
      output$out_tabung_volume_luas<-renderPrint({
        t = (input$tab1_tag5_luas / (2 * pi * input$tab1_tag5_r)) - input$tab1_tag5_r
        volume = pi * input$tab1_tag5_r^2 * t
        cat("Volume =",volume,input$tab1_tag5_satuan,"kubik")
      })
    }
  )
  
  observeEvent(
    input$act_kerucut,{
      output$out_volume_kerucut<-renderPrint({
        volume = 1/3 * pi * input$tab1_tag6_r^2 * input$tab1_tag6_h
        cat("Volume =",round(volume, 2),input$tab1_tag6_satuan,"kubik")
      })
      output$out_luas_kerucut<-renderPrint({
        s = (input$tab1_tag6_r^2 + input$tab1_tag6_h^2)^.5
        luas = pi * input$tab1_tag6_r * (input$tab1_tag6_r + s)
        cat("Luas Permukaan =",round(luas, 2),input$tab1_tag6_satuan,"persegi")
      })
      output$out_miring_kerucut<-renderPrint({
        s = (input$tab1_tag6_r^2 + input$tab1_tag6_h^2)^.5
        cat("Sisi Miring =",round(s, 2),input$tab1_tag6_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_limas_tiga,{
      output$out_volume_limas_tiga<-renderPrint({
        luas = 1/2 * input$tab1_tag7_a * input$tab1_tag7_t
        volume = 1/3 * luas * input$tab1_tag7_h
        cat("Volume =",round(volume, 2),input$tab1_tag7_satuan,"kubik")
      })
      output$out_luas_limas_tiga<-renderPrint({
        luas = 1/2 * input$tab1_tag7_a * input$tab1_tag7_t
        cat("Luas Alas =",round(luas, 2),input$tab1_tag7_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_limas_empat,{
      output$out_volume_limas_empat<-renderPrint({
        luas = input$tab1_tag8_p * input$tab1_tag8_l
        volume = 1/3 * luas * input$tab1_tag8_h
        cat("Volume =",round(volume, 2),input$tab1_tag8_satuan,"kubik")
      })
      output$out_luas_limas_empat<-renderPrint({
        luas = input$tab1_tag8_p * input$tab1_tag8_l
        cat("Luas Alas =",round(luas, 2),input$tab1_tag8_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_bola,{
      output$out_volume_bola<-renderPrint({
        volume = 4/3 * pi * input$tab1_tag9_r^3
        cat("Volume =",round(volume, 2),input$tab1_tag9_satuan,"kubik")
      })
      output$out_luas_bola<-renderPrint({
        luas = 4 * pi * input$tab1_tag9_r^2
        cat("Luas Permukaan =",round(luas, 2),input$tab1_tag9_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_persegi,{
      output$out_persegi<-renderPrint({
        luas = input$tab3_tag1_s^2
        cat("Luas =",round(luas, 2),input$tab3_tag1_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_persegi_panjang,{
      output$out_persegi_panjang<-renderPrint({
        luas = input$tab3_tag2_p * input$tab3_tag2_l
        cat("Luas =",round(luas, 2),input$tab3_tag2_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_segitiga,{
      output$out_segitiga<-renderPrint({
        luas = 1/2 * input$tab3_tag3_a * input$tab3_tag3_t
        cat("Luas =",round(luas, 2),input$tab3_tag3_satuan,"persegi")
      })
    }
  )
  
  observeEvent(
    input$act_segitiga_siku,{
      output$out_segitiga_siku<-renderPrint({
        sisi = (input$tab3_tag4_a^2 + input$tab3_tag4_t)^.5
        cat("Sisi Miring =",round(sisi, 2),input$tab3_tag4_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_lingkaran,{
      output$out_luas_lingkaran<-renderPrint({
        luas = pi * input$tab3_tag5_r^2
        cat("Luas =",round(luas, 2),input$tab3_tag5_satuan,"persegi")
      })
      output$out_keliling_lingkaran<-renderPrint({
        keliling = 2 * pi * input$tab3_tag5_r
        cat("Keliling =",round(keliling, 2),input$tab3_tag5_satuan)
      })
    }
  )
  
  observeEvent(
    input$act_trapesium,{
      output$out_trapesium<-renderPrint({
        luas = (input$tab3_tag6_a + input$tab3_tag6_b)/2 * input$tab3_tag6_t
        cat("Luas =",round(luas, 2),input$tab3_tag6_satuan,"persegi")
      })
    }
  )
  
  
})