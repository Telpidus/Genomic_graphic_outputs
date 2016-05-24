# Copyright 2016 Telma Guedes Laurentino <telma.laurentino@gmail.com>
# This file is part of misc_plotters.
# Fst_histogram_gradient.r is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Fst_histogram_gradient.r is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

#TIP: use my script ST2_divergence_graphs_parser.sh to parse genepop data for this histogram 

#install.packages("devtools")
library(devtools)
install_github("easyGgplot2", "kassambara")

library("devtools")
library("easyGgplot2")

#input
maf_perpop <- read.table("/home/telmagl/Desktop/R_ready_inputs/MTZvsSE_R", header = FALSE)


#Run this to see, the YY scales are not coincident when applying the scale_fill_countinuous!

p<- ggplot2.histogram(data=maf_perpop, xName='V1', xtitle="FST", ytitle="#SNPs", addDensityCurve=FALSE, mainTitle="MTZvsSE", 
                  removePanelGrid=TRUE, removePanelBorder=TRUE, backgroundColor="white", color = "white", fill = "white")+
  geom_histogram(aes(fill = ..count..), binwidth=0.1)+
  scale_fill_continuous("#SNPs", low = "yellow", high = "red")+
theme(axis.line.x = element_line(color="black", size = 0.5), axis.line.y = element_line(color="black", size = 0.5))

p+geom_vline(xintercept=mean(maf_perpop$V1, na.rm = TRUE), linetype = 2)
