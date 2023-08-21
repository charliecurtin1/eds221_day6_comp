##------ dplyr wrangling ------##

library(tidyverse)
library(palmerpenguins)
library(lterdatasampler)

##--- selecting rows ---##

## to look for an exact match: ==
penguins_Biscoe <- penguins %>%
  filter(island == "Biscoe")

penguins_2007 <- penguins %>%
  filter(year == 2007)

adelie_torgersen <- penguins %>%
  filter(species == "Adelie", island == "Torgersen")
# or you can use "&"
adelie_torgersen2 <- penguins %>%
  filter(species == "Adelie" & island == "Torgersen")
# create a subset that only contains Gentoo penguins observed in 2008
gentoo_2008 <- penguins %>%
  filter(species == "Gentoo", year == 2008)

# create subset that contains Gentoos and Adelies. "OR" statement: |
gentoo_adelie <- penguins %>%
  filter(species == "Gentoo" | species == "Adelie")

# create subset that contains observations where island = dream or the year = 2009
dream_or_2009 <- penguins %>%
  filter(island == "Dream" | year == "2009")

ggplot(data = pie_crab, aes(x = water_temp,y = size)) +
  geom_point()

# keep observations in pie_crab for sites NIB, ZI, DB, JC
# we can use the %in% operator to ask: does the value in our column match ANY of the values IN this vector
pie_sites <- pie_crab %>%
  filter(site %in% c("NIB", "ZI", "DB", "JC"))

# run a line of code in the console to confirm that only the sites above remain in the new subset you created

# create a subset using the %in% operator that includes sites PIE, ZI, NIB, BB, and CC
pie_sites2 <- pie_crab %>%
  filter(site %in% c("PIE", "ZI", "NIB", "BB", "CC"))

# excluding filter statements: !=, asks "is this not equal to that value"
exclude_ZI <- pie_crab %>%
  filter(site != "ZI")

# what if I want to exclude BB, CC, and PIE

exclude_BB_CC_PIE <- pie_crab %>%
  filter(!site %in% c("BB", "CC", "PIE"))

# create a subset from pie_crab that only contains observations from NIB, CC, and ZI, for crabs with carapice size exceeding 13

crab_sites_size <- pie_crab %>%
  filter(site %in% c("NIB", "CC", "ZI"), size > 13)

##----- selecting columns -----##

# unique() tells you the different values in a column, names(dataset) tells you the name of the columns
# select individual columns by name, separate them by a comma
crabs_subset <- pie_crab %>%
  select(latitude, size, water_temp)

# select a range of columns
crabs_subset2 <- pie_crab %>%
  select(site:air_temp)

# select a range and an individual column
crabs_subset3 <- pie_crab %>%
  select(date:water_temp,
         name)

# reorder things using select by listing the columns in the order you want
pie_crab %>% select(name, water_temp, size)

##-----Mutate!!-----#

# use dplyr::mutate() to add or update a column, while keeping all existing columns
# mutate(new column name)
# add new column of size in cm
crabs_cm <- pie_crab %>%
  mutate(size_cm = size / 10)

# what happens if I use mutate containing the mean of the size column
crabs_mean <- pie_crab %>%
  mutate(size_mn = mean(size, na.rm = TRUE))

# if you use an existing column name, it will completely overwrite that column
crabs_awesome <- pie_crab %>%
  mutate(name = "Teddy is awesome")

# reminder: use group_by and summarize() in combination
# group by site and find the mean of the crab size
# summarize() - first element is the name of the new column created
mean_size_by_site <- pie_crab %>%
  group_by(site) %>%
  summarize(mean_size = mean(size, na.rm = TRUE))

# group_by then mutate
group_mutate <- pie_crab %>%
  group_by(site) %>%
  mutate(mean_size_site = mean(size, na.rm = TRUE))

# what if i want to create a new column that contains "giant" is size > 35 or "not giant" if the size <= 35
# use dplyr::case_when() to write if-else statements more easily
crabs_bin <- pie_crab %>%
  mutate(size_bin = case_when(
    size > 20 ~ "giant",
    size <= 20 ~ "not giant"
  ))

sites_bin <- pie_crab %>%
  mutate(region = case_when(
    site %in% c("ZI", "CC", "PIE") ~ "Low",
    site %in% c("BB", "NIB") ~ "Middle",
    TRUE ~ "High"
  ))








