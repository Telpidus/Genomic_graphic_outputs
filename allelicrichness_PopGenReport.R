# load data
library(adegenet)
data <- read.structure("/home/telmagl/Desktop/Tlepidus03_3_2016/Tlepidus03_17507_STRUCTURE.stru", n.ind = 36, n.loc = 17507, col.lab = 1, col.pop = 2, col.others = NULL, row.names(1))

#PopGenReport

require(PopGenReport)
options(max.print=999999)

sink("/home/telmagl/Desktop/ESCUTA.txt")

allel.rich(data, min.alleles = NULL)
