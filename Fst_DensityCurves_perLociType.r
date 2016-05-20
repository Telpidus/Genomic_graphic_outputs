library(ggplot2)

fst_curves <- read.table ("/home/telmagl/Desktop/FAZER/ST2 to parse_to histogram/INPUTS_r/MTZvsSE_NSE", header=TRUE)


#Calculate mean of each group 
library(plyr)
mu <- ddply(fst_curves, "SUBSET", summarise, grp.mean=mean(FST, na.rm=TRUE))
vu <- ddply(fst_curves, "SUBSET", summarise, grp.var=var(FST, na.rm=TRUE))
su <- ddply(fst_curves, "SUBSET", summarise, grp.sd=sd(FST, na.rm=TRUE))
head(mu)
head(vu)
head(su)

# Create graph and add mean lines
p<-ggplot(fst_curves, aes(x=FST, color=SUBSET), na.rm=TRUE, trim=TRUE) +
  geom_density()+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=SUBSET),
             linetype="dashed")
p

# Use custom color palettes
p+scale_fill_manual(values=c("#999999", "#E69F00"))

p

# Use grey scale
#p + scale_color_grey() + theme_classic()
