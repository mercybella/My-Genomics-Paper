library(trackViewer)
protein_length <- 490
protein <- GRanges("tret",IRanges(1, protein_length))
SNP <- c(45, 158, 390, 392, 408, 470)
TRET_RA <- GRanges("tret", IRanges(SNP, width=1, names=c("F45S", "G158R", "W390R", "M392V", "V408F", "M470R")))
features <- GRanges("tret", IRanges(22, 473, names = "Sugar Transport Major Facilitator Superfamily Domain"))
features$fill <- c("#228B22")
features$height <- 0.05
TRET_RA$color <- "red"

library(grid)

pdf("TRET_RA.pdf", width = 14, height = 5)
lolliplot(TRET_RA, features, ranges = protein)

dev.off()