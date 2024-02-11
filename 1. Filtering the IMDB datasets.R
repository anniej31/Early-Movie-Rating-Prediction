# Loading the libraries
library(openxlsx)
library(tidyverse)
library(caret)

# The original datasets were split into differnt sections such as,
#  details about the movie release (location and languages), ratings and crew
#  Once movie details were filterd, the subset was further narrowed down,
#  to include only movies after 2000 with more than 100 votes


#Importing the datasets
#Dataset with the basic movie details
title.basics.tsv <- read.delim2("..path/title.basics.tsv.gz")
View(title.basics.tsv)

# Movie Ratings
title.ratings.tsv <- read.delim("..path/title.ratings.tsv.gz")
View(title.ratings.tsv)

# Details of location and region
title.akas.tsv <- read.delim("..path/title.akas.tsv.gz")
View(title.akas.tsv)

# list of cast and crew
title.crew.tsv <- read.delim("..path/title.crew.tsv.gz")
View(title.crew.tsv)

# character names and roles
title.principals.tsv <- read.delim("..path/title.principals.tsv.gz")
View(title.principals.tsv)

# list of names and codes
name.basics.tsv<- read.delim("..paths/name.basics.tsv")
View(name.basics.tsv)

#Joining both the datasets
left_merged <- left_join(title.basics.tsv, title.ratings.tsv, by = "tconst")

#Removing all other types of titles
left_merged <- filter(left_merged, left_merged$titleType == 'movie')

#Removing the movies which were released before 2000
left_merged <- filter(left_merged, left_merged$startYear > 2000)

merge1 <- left_join(left_merged, title_crew_tsv, by = "tconst") # added crew

merge3 <- title_principals_tsv %>% # added character and other roles of people
  group_by(tconst) %>%
  summarize(nconst = paste(nconst, collapse = ',')) %>%
  ungroup() %>%
  separate_rows(nconst, sep = ",") %>%
  pivot_wider(names_from = title_principals_tsv$category, values_from = nconst, values_fn = list(nconst = toString), values_fill = NA)

# Replaceing of ids of people with names
merge3 <- title_principals_tsv %>%
  filter(category %in% c("actor", "actress")) %>%
  group_by(tconst) %>%
  summarize(nconst = paste(nconst, collapse = ',')) %>%
  ungroup()

# Perform the join - change nconst to name in principal
result <- title.principals.tsv %>%
  left_join(`name.basics.(1).tsv`, by = "nconst") %>%
  select(tconst, ordering, category, primaryName)
table(title.principals.tsv$ordering)

#combining director, actor and actress details to main df
final_df <- high_rated %>%
  left_join(result2, by = "tconst") %>%
  select(tconst, titleType, primaryTitle, originalTitle, isAdult, startYear,
         endYear, runtimeMinutes, genres, averageRating, numVotes, director, actor, actress)

#Converting character variables to factor for better evaluation
left_merged <- left_merged %>%
  mutate_if(is.character, as.factor)
summary(left_merged) #checking the summary

# Removing the records which does not have any ratings
left_merged <- left_merged[!is.na(left_merged$averageRating), ]

# removing records with less than 100 votes
high_votes_movies <- left_merged %>%
  filter(numVotes > 100)

#Converting startYear to integer
left_merged <- left_merged %>% mutate(startYear = as.integer(startYear))

#Converting startYear to integer
left_merged <- left_merged %>%
  mutate(runtimeMinutes = as.integer(runtimeMinutes))

#removing any other na records
left_merged <- na.omit(left_merged)

#combining director, actor and actress details to main df
final_df <- high_rated %>%
  left_join(result2, by = "tconst") %>%
  select(tconst, titleType, primaryTitle, originalTitle, isAdult, startYear,
         endYear, runtimeMinutes, genres, averageRating, numVotes, director, actor, actress)

#Saving the dataset
write.xlsx(high_votes_movies, "..path/high_rated.xlsx", rowNames = FALSE)

#Saving the filtered dataset
write.xlsx(left_merged, "..path/merged.xlsx", rowNames = FALS