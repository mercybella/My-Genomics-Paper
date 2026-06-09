library(trackViewer)
protein_length <- 568
protein <- GRanges("treh",IRanges(1, protein_length))
SNP <- c(31, 84, 87, 137, 284, 349, 374)
TREH_RB <- GRanges("treh", IRanges(SNP, width=1, names=c("M31R", "S84I", "F87V", "P137A", "A284V", "Y349D", "D374E")))
features <- GRanges("treh", IRanges(1, 532, names = "Six-hairpin Glycosidase"))
features$fill <- c("#8C00BF")
features$height <- 0.05
TREH_RB$color <- "red"

cat_pos <- c(64, 65, 66, 67, 68, 69, 104, 105, 137, 140, 141, 145, 147, 148, 184, 
             190, 193, 195, 253, 254, 255, 256, 257, 258, 259, 261, 263, 264, 267, 
             276, 279, 280, 283, 284, 436, 437, 443, 489, 511, 513)

catalytic <- GRanges("treh", ranges = IRanges(cat_pos, width = 1, names = c("L64", "N65", "F66", "E67", "K68", 
                                                 "P69", "N104", "K105", "P137", "R140",
                                                 "F141", "Y145", "W147", "D148", "N184", 
                                                 "Y190", "R193", "Q195", "P253", "R254", 
                                                 "P255", "E256", "S257", "E258", "R259", 
                                                 "D261", "L263", "S264", "I267", "D276", 
                                                 "C279", "E280", "A283", "A284", "Q436", 
                                                 "W437", "W443", "E489", "F511", "W513")))
catalytic$color <- "blue"

full <- GRangesList(TREH_RB, catalytic)
features2 <- GRangesList(features, features)

library(grid)

pdf("TREH_RB.pdf", width = 14, height = 5)
lolliplot(full, features2, ranges = protein)

dev.off()