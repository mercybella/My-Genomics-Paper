library(trackViewer)
protein_length <- 816
protein <- GRanges("tps",IRanges(1, protein_length))
SNP <- c(538, 718, 752)
TPS <- GRanges("tps", IRanges(SNP, width=1, names=c("T538I", "R718D", "R752C")))
features <- GRanges("tps", IRanges(c(19, 530), 
                                    width=c(495, 759),
                                    names=c("UDP", "HAD")))
features$fill <- c("#FF8833", "#51C6E6")
features$height <- c(0.05, 0.05)
TPS$color <- "red"

cat_pos <- c(
  204, 306, 311, 383, 405, 407, 408, 409, 413,
  113, 176, 344,
  534, 536, 541, 543, 574, 575, 576, 580,
  639, 641, 648, 650, 679, 680, 681, 683,
  692, 719, 720, 723
)

catalytic <- GRanges("tps",
  ranges = IRanges(cat_pos, width = 1, names = c("H204", "R306", "K311", "V383", 
                                                 "D405", "M407", "N408", "L409", 
  "E413", "Y113", "D176", "R344", "D534", "D536", "P541", "A543", "S574", "G575", 
  "R576", "N580", "E639", "K641", "H648", "R650", 
  "H679", "C680", "A681", "E683", "K692", "D719", "D720", "D723"))
)
catalytic$color <- "blue"

full <- GRangesList(TPS, catalytic)
features2 <- GRangesList(features, features)

library(grid)

pdf("TPS.pdf", width = 14, height = 5)
lolliplot(full, features2, ranges = protein)

dev.off()