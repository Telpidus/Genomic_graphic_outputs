#VCF to IBS analysis

library ("SNPRelate")

par(xpd=TRUE)

#input
vcf.fn<-"/home/telmagl/Desktop/Tlepidus03_3_2016/Tlepidus03_36_noLD_17535.recode.vcf"#load the data
snpgdsVCF2GDS(vcf.fn,"test.gds",method="copy.num.of.ref")#import to class. use method= biallelic.only for biallelic snps

#summary of the vcf imported
snpgdsSummary("test.gds")

#open the translated vcf imported
genofile<-snpgdsOpen("test.gds")

# Identity-By-State Analysis

ibs <- snpgdsIBS(genofile, num.thread=2)

#import population names
pop_code <- scan("/home/telmagl/Desktop/Tlepidus03_3_2016/Allpops_matrix2PCA.txt", what=character())

# individulas in the same population are clustered together
pop.idx <- order(pop_code)

image(ibs$ibs[pop.idx, pop.idx], col=terrain.colors(32))

