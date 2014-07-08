
##############################
# The intercross
##############################

library(broman)
library(simcross)

color <- brocolors("crayons")[c("Cornflower", "Blush")]

png(file="../Figs/intercross.png", width=1180, height=800, res=108,
    pointsize=14, bg="transparent")
par(fg="white", bty="n")

plot(0,0,xlim=c(0,864),ylim=c(0,480),xaxt="n",yaxt="n",xlab="",ylab="",type="n")
rect(c(300,328),c(480,480),c(310,338),c(385,385),col=color[1],border=color[1], lend=1, ljoin=1)
rect(c(526,554),c(480,480),c(536,564),c(385,385),col=color[2],border=color[2], lend=1, ljoin=1)

points(432,440,pch=4,cex=2.5,lwd=2)
segments(432,400,432,340,lwd=2)
segments(319,340,545,340,lwd=2)
arrows(c(319,545),c(340,340),c(319,545),c(300,300),lwd=2,len=0.1)

text(300-25,(480+385)/2,expression(P[1]),cex=2,adj=c(1,0.5))
text(564+25,(480+385)/2,expression(P[2]),cex=2,adj=c(0,0.5))

rect(300,287,310,192,col=color[1],border=color[1], lend=1, ljoin=1)
rect(328,287,338,192,col=color[2],border=color[2], lend=1, ljoin=1)
rect(526,287,536,192,col=color[1],border=color[1], lend=1, ljoin=1)
rect(554,287,564,192,col=color[2],border=color[2], lend=1, ljoin=1)

points(432,247,pch=4,cex=2.5,lwd=2)
segments(432,207,432,147,lwd=2)
segments(57,147,849,147,lwd=2)
arrows(seq(57,849,by=88),rep(147,10),seq(57,849,by=88),rep(107,10),lwd=2,len=0.1)

text(300-25,(287+192)/2,expression(F[1]),cex=2,adj=c(1,0.5))
text(564+25,(287+192)/2,expression(F[1]),cex=2,adj=c(0,0.5))

f1 <- create_parent(100,c(1,2))
set.seed(994)
f2 <- vector("list",10)
for(i in 1:10) f2[[i]] <- cross(f1,f1,m=10,obl=TRUE)

xloc <- 38
mult <- 95/f2[[1]]$mat[1,ncol(f2[[1]]$mat)]
for(i in 1:10) {
    rect(xloc,0,xloc+10,95,   col=color[1],border=color[1], lend=1, ljoin=1)
    rect(xloc+28,0,xloc+38,95,col=color[1],border=color[1], lend=1, ljoin=1)

    f2m <- f2[[i]]$mat
    for(j in 2:ncol(f2m)) {
        if(f2m[2,j]==2) {
            rect(xloc,f2m[1,j]*mult,xloc+10,f2m[1,j-1]*mult,col=color[2],border=color[2], lend=1, ljoin=1)
        }
    }
    f2p <- f2[[i]]$pat
    for(j in 2:ncol(f2p)) {
        if(f2p[2,j]==2) {
            rect(xloc+28,f2p[1,j]*mult,xloc+38,f2p[1,j-1]*mult,col=color[2],border=color[2], lend=1, ljoin=1)
        }
    }
    xloc <- xloc+38+50
}
text(38-25,95/2,expression(F[2]),cex=2,adj=c(1,0.5))

dev.off()
