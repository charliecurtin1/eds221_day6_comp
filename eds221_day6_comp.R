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


















