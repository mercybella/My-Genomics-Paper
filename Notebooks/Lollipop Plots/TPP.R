library(trackViewer)
protein_length <- 295
protein <- GRanges("tpp",IRanges(1, protein_length))
SNP <- c(103, 131, 243)
TPP <- GRanges("tpp", IRanges(SNP, width=1, names=c("V103G", "T131I", "D243A")))
features <- GRanges("tpp", IRanges(55, 283, names = "HAD"))
features$fill <- c("#51C6E6")
features$height <- 0.05
TPP$color <- "red"

cat_pos <- c(59, 61, 66, 68, 99, 100, 101, 105, 
             164, 166, 173, 175, 204, 205, 206, 208, 216, 243, 244, 247)

catalytic <- GRanges("tpp",
  ranges = IRanges(cat_pos, width = 1, names = c("D59", "D61", "E66", "T68", "S99", 
                                                 "G100", "R101", "G105", "E164", "K166", 
                                                 "H173", "R175", "H204", "A205", "S206", 
                                                 "E208", "N216", "D243", "D244", "D247")))

library(grid)

pdf("TPS.pdf", width = 14, height = 5)
lolliplot(full, features2, ranges = protein)

dev.off()