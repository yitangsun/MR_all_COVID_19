library(TwoSampleMR)
library(dplyr)
library(googlesheets)
library(vcfR)
library(stringr)
library(mr.raps)
'%ni%' <- Negate('%in%')
# ieugwasr::api_status()
# $`API version`
# #3.6.9
# $`Total associations`
# [1] 126335542182
# $`Total complete datasets`
# [1] 34670
# $`Total public datasets`
# [1] 34513
library(MRInstruments)
library(MVMR)
#library(SNPlocs.Hsapiens.dbSNP144.GRCh37)
#library("SNPlocs.Hsapiens.dbSNP151.GRCh38")

Pathway_SNP="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/"
Pathway_geno="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/Genotype/"
Pathway_out="/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/MR_result/result_ALL_03_21/"
#Trait_filename="All_Trait_IEU_GWAS_01_31.txt"
Trait_filename="All_Trait_IEU_GWAS.txt"
Out_SNP_filename="Exposure_SNP_All_trait.txt"
Out_Geno_filename="_All_trait_03_21.txt"
COVID_LIST=c("HGI_round_4_A1","HGI_round_4_A2","HGI_round_4_B1","HGI_round_4_B2","HGI_round_4_C1","HGI_round_4_C2","HGI_round_5_A2_eur","HGI_round_5_A2_eur_leave_ukbb","HGI_round_5_B1_eur","HGI_round_5_B1_eur_leave_ukbb","HGI_round_5_B2_eur","HGI_round_5_B2_eur_leave_ukbb","HGI_round_5_C2_eur","HGI_round_5_C2_eur_leave_ukbb")


#load("/scratch/ys98038/UKB/plink2_format/COVID_19/Analyses/SNP/SNPS_37_38.RData")
Inputfile=paste(Pathway_SNP, Trait_filename, sep="")
Trait <- read.csv(Inputfile,header=F, as.is=T,sep = "\t")

len_exp_file=length(Trait$V1)
for (n in 2:len_exp_file) {
  exp_dat <- extract_instruments(Trait$V1[n])
  exp_dat$pos.exposure_end=exp_dat$pos.exposure+1
  exp_dat$chr.exposure_new=paste("chr",exp_dat$chr.exposure, sep="") 
  exp_dat<-exp_dat%>%select(chr.exposure_new, pos.exposure, pos.exposure_end, SNP, chr.exposure)
  Outputfile=paste(Pathway_SNP, Out_SNP_filename, sep="")
  write.table(exp_dat, file= Outputfile, append = TRUE, row.names = FALSE,col.names = FALSE, quote = FALSE, sep=' ')
}



######### Generate outcome dataset using Exposure_SNP_WBC.txt
for (n in COVID_LIST) {
  exp_dat_file=paste(Pathway_SNP, n, ".txt", sep="")
  tem_dat <- read.csv(exp_dat_file,header=T, as.is=T,sep = "\t")
  Input_SNP_filename=paste(Pathway_SNP, Out_SNP_filename, sep="")
  exp_dat_SNP=read.csv(Input_SNP_filename,as.is=F,header = F,sep = " ")
  exp_dat_SNP$V1=as.character.factor(exp_dat_SNP$V1)
  exp_dat_SNP$V4=as.character.factor(exp_dat_SNP$V4)
  exp_dat_SNP$V5=as.character.factor(exp_dat_SNP$V5)
  exp_dat_SNP=exp_dat_SNP[exp_dat_SNP$V5 !="X",]
  exp_dat_SNP$V5=as.integer(exp_dat_SNP$V5)
  colnames(tem_dat)[1] <- "CHR"
  tem_dat$CHR=as.integer(tem_dat$CHR)
  tem_dat$POS=as.integer(tem_dat$POS)
  tem_dat$SNP_tem=paste(tem_dat$CHR, tem_dat$POS , sep="_")
  exp_dat_SNP$SNP_tem=paste(exp_dat_SNP$V5, exp_dat_SNP$V2 , sep="_")
  tem_dat<-exp_dat_SNP %>% left_join(tem_dat, by= "SNP_tem")
  Outputfile=paste(Pathway_geno, n, Out_Geno_filename, sep="")
  write.table(tem_dat, file= Outputfile, row.names = FALSE, quote = FALSE, col.names = TRUE, sep='\t')
}
