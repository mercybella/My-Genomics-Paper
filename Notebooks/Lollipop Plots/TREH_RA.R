library(trackViewer)
protein_length <- 628
protein <- GRanges("treh",IRanges(1, protein_length))
SNP <- c(91, 144, 147, 344, 409, 434)
TREH_RA <- GRanges("treh", IRanges(SNP, width=1, names=c("M91R", "S144I", "F147V", "A344V", "Y409D", "D434E")))
features <- GRanges("treh", IRanges(50, 592, names = "Six-hairpin Glycosidase"))
features$fill <- c("#8C00BF")
features$height <- 0.05
TREH_RA$color <- "red"

cat_pos <- c(124, 125, 126, 127, 128, 129, 164, 165, 197, 200, 201, 205, 207, 208
             , 244, 250, 253, 255, 313, 314, 315, 316, 317, 318, 319, 321, 323, 
             324, 327, 336, 339, 340, 343, 344, 496, 497, 503, 549, 571, 573)

catalytic <- GRanges("treh",
  ranges = IRanges(cat_pos, width = 1, names = c("L124", "N125", "F126", "E127", "K128", 
                                                 "P129", "N164", "K165", "P197", "R200", 
                                                 "F201", "Y205", "W207", "D208", "N244", 
                                                 "Y250", "R253", "Q255", "P313", "R314", 
                                                 "P315", "E316", "S317", "E318", "R319", 
                                                 "D321", "L323", "S324", "I327", "D336", 
                                                 "C339", "E340", "A343", "A344", "Q496", 
                                                 "W497", "W503", "E549", "F571", "W573")))
catalytic$color <- "blue"

full <- GRangesList(TREH_RA, catalytic)
features2 <- GRangesList(features, features)

library(grid)

pdf("TREH_RA.pdf", width = 14, height = 5)
lolliplot(full, features2, ranges = protein)

dev.off()