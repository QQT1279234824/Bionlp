# 21-10-25
# onlybug
# ATGC

library(ggplot2)
library(patchwork)

rt = read.table("test.tb",stringsAsFactors = F)
S = runif(nrow(rt),20,80)
rt = cbind(rt,S)
colnames(rt) = c("Y","X","Nc","Size")

# core fun
y1 = (rt$Y - min(rt$Y))*(max(rt$X) - 1) + rt$X
rt$TY = y1
rt$ymax = rt$TY + rt$Size

p1 = ggplot(rt,aes(x = X,y = TY,group = Y)) + 
  # geom_line() + 
  geom_line(aes(color = Nc,
                 size = Size)) + 
  coord_polar(start = 1,theta = 'x') + 
  scale_color_manual(values = c("#95e1d3","#eaffd0","#fce38a","#f38181")) + 
  theme_void()
p2 = ggplot(rt,aes(x = X,y = Y,group = Y)) + 
  geom_point(aes(color = Nc,
                size = Size),alpha = .8) + 
  coord_polar(start = 1,theta = 'x') + 
  scale_color_manual(values = c("#95e1d3","#eaffd0","#fce38a","#f38181")) + 
  theme_void() + 
  guides(size = "none",color = "none")
p1 + p2



