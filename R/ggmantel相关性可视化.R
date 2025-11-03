


install.packages("usethis") 
install.packages("devtools") 
if(!require(ggcorrr))
devtools::install_github("songyang1992/ggcorrr",force = TRUE)
devtools::install_github("liangdp1984/ggmantel",force = TRUE)


library(ggcorrr)
library(ggmantel)
library(vegan)

samp.dist=read.table('bray_curtis_otu_table_subsampled-9samples.txt',header=T,row.names=1)

samp.info=read.csv('samp.info.csv',header=T,row.names=1,na.strings='NA')
D=list(samp.dist)
df =fortify_mantel(D,samp.info)

corr_df = fortify_corr(samp.info, type = "upper", show_diag = FALSE,
                        corr_test = TRUE, 
						corr_method = "spearman",
						corr_test_method = "spearman",
						cluster = F)

mdf =get_link_data(df, corr_df, type = "upper", grp_hjust = c(0, -1.5, -1, 0))

ggmantel(mdf, corr_df, type = "upper", corr_type = "square+mark", 
curvature = 0.05,
scale_fill_col = c("black","#2080ff","white","#c02000"), ###数字黑色
scale_colour_col = c("purple","orange","green","white"),  ###
corr_extra_params = corr_params(list(colour = "red"), 
list(size = 2.5, 
sig_thres = 0.05)))


###fortify_corr函数
#Usage
