library(stringr)
library(magrittr)
library(ggplot2)
library(dplyr)
library(tibble)
library(tidyr)
library(gage)
library(gageData)
library(methods)

setwd('/fh/fast/meshinchi_s/workingDir/TARGET/AML_TARGET/RNA/mRNAseq/analysis/2018.07.03_M6_M7_Del5q_DEGs/')
source("~/scripts/RNAseq_Analysis/DifferentialExpn_PathwayAnalysis/GAGE_GSEA_Function.r")


NSD1 <- get(load("TARGET_AML_1031_del5q_M6_M7_vs_OtherAMLs.RData"))
filename <- "TARGET_AML_hd.1031_Del5q_M6_M7_vs_otherAML_GAGE_GSA"
C2.KEGG <- readRDS("~/RNA_seq_Analysis/0000.00.01_GSEA_geneSets_gmt/c2.cp.kegg.v6.0.symbols.RDS")


print("starting1")

GSA <- lapply(Del5q_M6_M7, gage_from_pipeline, type="expn",geneset=C2.KEGG)
  save(GSA,file=paste0(filename, "_expn_C2.KEGG.RData"))
  rm(GSA)
  gc()

print("done1")

print("starting2")

GSA.FC <- lapply(Del5q_M6_M7, gage_from_pipeline, type="FC",geneset=C2.KEGG)
  save(GSA.FC,file=paste0(filename, "_FC_C2.KEGG.RData"))
  rm(GSA.FC)
  gc()


rm(C2.KEGG)
print("done2")

print("starting3")


C2.All <- readRDS("~/RNA_seq_Analysis/0000.00.01_GSEA_geneSets_gmt/c2.all.v6.0.symbols.RDS")

GSA.C2.All <- lapply(Del5q_M6_M7, gage_from_pipeline, type="expn",geneset=C2.All)
save(GSA.C2.All,file=paste0(filename, "_expn_C2.All.RData"))
rm(GSA.C2.All)
gc()

rm(GSA.C2.All)
print("done3")


print("starting4")

GSA.KEGG <- lapply(Del5q_M6_M7, gage_from_pipeline, type="expn",geneset=NULL) 
  save(GSA.KEGG,file=paste0(filename, "_expn_HSA.KEGG.RData"))
  rm(GSA.KEGG)
  gc() 

print("done4")



  



