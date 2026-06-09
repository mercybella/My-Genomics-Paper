library(trackViewer)
protein_length <- 807
protein <- GRanges("tret",IRanges(1, protein_length))
SNP <- c(362, 475, 707, 787)
TRET_RB <- GRanges("tret", IRanges(SNP, width=1, names=c("F362S", "G475R", "W707R", "M787R")))
features <- GRanges("tret", IRanges(341, 790, names = "Sugar Transport Major Facilitator Superfamily Domain"))
features$fill <- c("#228B22")
features$height <- 0.05
TRET_RB$color <- "red"

library(grid)

pdf("TRET_RB.pdf", width = 14, height = 5)
lolliplot(TRET_RB, features, ranges = protein)

dev.off()