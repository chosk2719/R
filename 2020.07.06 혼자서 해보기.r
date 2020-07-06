mpg = as.data.frame(ggplot2::mpg)

mpg[c(10, 14, 58, 93), "drv"] = 'k'
mpg [c(29, 43, 129, 203), "cty"] = c(3, 4, 39, 42)

mpg

table(mpg$drv)

mpg$drv = ifelse(mpg$drv %in% c('4', 'f', 'r'), mpg$drv, NA)

table(mpg$drv)

table(mpg$cty)

boxplot(mpg$cty)$stats

mpg$cty = ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)

boxplot(mpg$cty)

install.packages('plotly')

library('plotly')

library(dplyr)

df_mpg = mpg %>% 
filter(!is.na(drv) & !is.na(cty)) %>% 
group_by(drv) %>% 
summarise(mean_hwy = mean(cty))


df_mpg

tt = ggplot(data=df_mpg, aes(x=reorder(drv, mean_cty), y=mean_cty)) +
geom_col(fill=rainbow(3))+coord_flip()

ggplotly(tt)


































