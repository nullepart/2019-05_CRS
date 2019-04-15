
# On ne garde que les projets dans les secteurs 300 et 400 du DAC (croissance économique)
cst <- filter(can, SectorCode >299 & SectorCode < 500)

# WEE1: On cherche lesquels, parmi ces projets, cherchent explicitement à 
# réaliser l'autonomisation économique des femmes

vec <- str_detect(cst$LongDescription, "mpower") # Recherche de "empower" dans la description

# Problème: str_detect a introduit des NA dans le vecteur là où la description longue était vide
# Il faut corriger le vecteur logique.

zz <- which(is.na(vec))
vec[zz] <- FALSE # Vecteur logique corrigé.

wee1 <- cst[vec,] # WEE1 sont les projets mentionnant directement "empowerment"
rm(zz)
no_proj <- unique(wee1$ProjectNumber); no_proj


td <- wee1 %>%
  select(ProjectNumber, ProjectTitle, LongDescription)

  
