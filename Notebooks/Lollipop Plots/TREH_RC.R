library(trackViewer)
protein_length <- 582
protein <- GRanges("treh",IRanges(1, protein_length))
SNP <- c(45, 98, 101, 298, 363, 388)
TREH_RC <- GRanges("treh", IRanges(SNP, width=1, names=c("M45R", "S98I", "F101V", "A298V", "Y363D", "D388E")))
features <- GRanges("treh", IRanges(16, 546, names = "Six-hairpin Glycosidase"))
features$fill <- c("#8C00BF")
features$height <- 0.05
TREH_RC$color <- "red"

cat_pos <- c(78, 79, 80, 81, 82, 83, 118, 119, 151, 154, 155, 159, 161, 162, 198, 
             204, 207, 209, 267, 268, 269, 270, 271, 272, 273, 275, 277, 278, 281, 
             290, 293, 294, 297, 298, 450, 451, 457, 503, 525, 527)

catalytic <- GRanges("treh", ranges = IRanges(cat_pos, width = 1, 
                                              names = c("L78", "N79", "F80", "E81", 
                                                        "K82", "P83", "N118", "K119", 
                                                        "P151", "R154", "F155", "Y159", 
                                                        "W161", "D162", "N198", "Y204", 
                                                        "R207", "Q209", "P267", "R268", 
                                                        "P269", "E270", "S271", "E272", 
                                                        "R273", "D275", "L277", "S278", 
                                                        "I281", "D290", "C293", "E294", 
                                                        "A297", "A298", "Q450", "W451", 
                                                        "W457", "E503", "F525", "W527")))
catalytic$color <- "blue"

full <- GRangesList(TREH_RC, catalytic)
features2 <- GRangesList(features, features)

library(grid)

pdf("TREH_RC.pdf", width = 14, height = 5)
lolliplot(full, features2, ranges = protein)

dev.off()