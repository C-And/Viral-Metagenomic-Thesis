in_meta <- read.table(file.choose(new = FALSE)) #choose the metadata file.
in_meta
rownames(in_meta) <- in_meta$V1 #change the row names to that of the first row.
in_meta_t <- data.frame(t(in_meta), stringsAsFactors = FALSE) #transpose data.
View(in_meta_t)
colnames(in_meta_t) <- gsub("X", "", colnames(in_meta_t)) #remove the x in col names.

in_path <- read.delim(file.choose(new = FALSE)) #choose renomralised data. 
View(in_path)
colnames(in_path) <- colnames(in_meta_t) #make the col names the same as metadata table. 

out_plc <- rbind(in_meta_t, in_path) #bind the tables. 
View(out_plc)

write.table(out_plc, file = "~/Desktop/Project/scripts/pathabundance.cpm.anno.plc", col.names = FALSE, row.names = FALSE, sep = "\t", quote = FALSE)
#used to create a file of this joined table

trial <- out_plc #create a new data frame. 
row.names(trial) <- trial$sample_id
trial <- trial[,-1] #remove the first row that is names. 
trial <- trial[-c(1, 2, 3, 4, 5, 6),] #remove the metadata columns. 

library("RColorBrewer") 
library("pheatmap")
#setwd("~/Desktop/Project/Diss Writing/")

t <- data.matrix(trial) #turn the data frame to a data matrix. 
colnames(t) <- c('CoDL_16_R1', 'CoDL_16_R2', 'CoDL_17_R1', 'CoDL_17_R2', 'CoDL_19_R1', 'CoDL_19_R2') #change to shorter column names.
View(t)
col <- colorRampPalette(brewer.pal(10, "RdYlBu"))(256) #create a colour pallet. 
heatmap(t, col = col, labRow = NA, cexCol = 0.8, Rowv = NA) #draw a heatmap. 
#heatmap(t[1:30,], col = col, scale = 'column',
#        RowSideColors = rep(c("blue", "pink"), each = 15))

#heatmap.2(t, col = col, scale = 'row', trace = 'none', Rowv = NA, key.title = "Key", labRow = NA)

t2 <- t
rownames(t2) <- gsub(":.*", "", rownames(t2)) #remove excess from row names. 

#draw heat maps for all the pathways, 50 at a time. 
pheatmap(t2[1:50,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[51:100,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[101:150,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[151:200,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[201:250,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[251:300,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[301:350,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[351:400,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[401:450,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[451:500,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[501:550,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[551:600,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[601:650,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[651:700,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[701:750,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[751:800,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[801:850,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[851:900,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[901:950,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[951:1000,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1001:1050,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1051:1100,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1101:1150,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1151:1200,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1201:1250,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1251:1300,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
#pheatmap(t2[1301:1350,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
#         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
pheatmap(t2[1351:1359,], cutree_rows = 5, show_rownames = TRUE, fontsize = 5, display_numbers = TRUE, 
         color = colorRampPalette(rev(brewer.pal(n = 12, name = "Set3")))(200))
