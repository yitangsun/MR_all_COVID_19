

library(TwoSampleMR)
library(dplyr)
library(googlesheets)
library(vcfR)
library(stringr)
library(mr.raps)
'%ni%' <- Negate('%in%')
# ieugwasr::api_status()
# $`API version`
# #3.6.7
# $`Total associations`
# [1] 126335269652
# $`Total complete datasets`
# [1] 34670
# $`Total public datasets`
# [1] 34513
library(MRInstruments)
library(MVMR)
library(SNPlocs.Hsapiens.dbSNP144.GRCh37)
library("SNPlocs.Hsapiens.dbSNP151.GRCh38")

Pathway_SNP="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/"
Pathway_geno="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/Genotype/"
Pathway_out="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/MR_result/result_WBC_01_28_5e-8/"

#load("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/SNPS_37_38.RData")


######### Generate outcome dataset using Exposure_SNP_WBC.txt
for (n in c("HGI_round_4_A2","HGI_round_4_B2","HGI_round_5_A2","HGI_round_5_A2_eur","HGI_round_5_B2","HGI_round_5_B2_eur","HGI_round_5_C2","HGI_round_5_C2_eur")) {
  exp_dat_file=paste(Pathway_SNP, n, ".txt", sep="")
  tem_dat <- read.csv(exp_dat_file,header=T, as.is=T,sep = "\t")
  exp_dat_SNP=read.csv('/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/Exposure_SNP_All_trait_01_29.txt',as.is=F,header = F,sep = " ")
  exp_dat_SNP$V1=as.character.factor(exp_dat_SNP$V1)
  exp_dat_SNP$V4=as.character.factor(exp_dat_SNP$V4)
  exp_dat_SNP=exp_dat_SNP[exp_dat_SNP$V5 !="X",]
  exp_dat_SNP$V5=as.integer(exp_dat_SNP$V5)
  colnames(tem_dat)[1] <- "CHR"
  tem_dat$SNP_tem=paste(tem_dat$CHR, tem_dat$POS , sep="_")
  exp_dat_SNP$SNP_tem=paste(exp_dat_SNP$V5, exp_dat_SNP$V2 , sep="_")
  tem_dat<-exp_dat_SNP %>% left_join(tem_dat, by= "SNP_tem")
  Outputfile=paste(Pathway_geno, n, "_All_trait_01_29.txt", sep="")
  write.table(tem_dat, file= Outputfile, row.names = FALSE, quote = FALSE, col.names = TRUE, sep='\t')
}
