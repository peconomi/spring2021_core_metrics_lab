
# Load Packages
library(pacman)
p_load(tidyverse, gapminder)

# Check out the dataframe that gapminder provides
head(gapminder)

# I'll list the dplyr functions used in class

# mutate adds new variables to our saved object
data_new <- gapminder %>% mutate( GDP = pop*gdpPercap,
                                  lnGDP = log(GDP))

# filter.. filters! think of it as row-wise selection
data_new <- data_new %>% filter(continent %in% c("Asia", "Europe"))

# for column-wise selection, use select
data_select <- data_new %>% select(- lifeExp)

# We can also group and summarise our data, similar to summary stats in papers
data_sum <- data_new %>% group_by(year) %>% summarise(m_Life =  mean(lifeExp),
                                                      m_pop  =  mean(pop),
                                                      m_gdp  =  mean(GDP))

data_sum

# if you want to arrange rows by a specific column, use arrange. Add in the desc() wrap for descending
data_sum <- data_sum %>% arrange(m_Life)
data_sum <- data_sum %>% arrange(desc(m_Life))

# See https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf for more

