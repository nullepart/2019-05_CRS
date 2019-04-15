# Préparation du fichier
# ========================
  
# Les données de base proviennent d'OECD Stats, https://stats.oecd.org/DownloadFiles.aspx?DatasetCode=CRS1
# Pour le moment, seules les données de 2017 (téléversées le 18 jan 2019) sont utilisées.

# Le (ou les) fichier(s) de base se trouve...nt dans le répertoire ./data/archives
# Il n'est pas lu automatiquement par la routine de ProjectTemplate. C'est le comportement qu'on veut.

# Le fichier de 2017 fait environ 250 000 lignes par 86 colonnes. Trop lourd à manipuler.
# Il s'agit de l'importer en un fichier plus léger ne comportant que les variables d'intérêt.
# Celui-ci sera placé dans ./data et lu à l'ouverture du programme.

# À FAIRE: Importer d'autres fichiers d'années et les intégrer au tableau de données.

# Importation
# -----------

tout <- read_delim("./data/archives/CRS 2017 data.txt", delim = "|", locale = locale(encoding = "latin1"))

var_excl <- c(
  "InitialReport",
  "FlowCode",
  "FlowName",
  "bi_multi",
  "Category",
  "Finance_t",
  "Aid_t",
  "usd_commitment",
  "usd_received",
  "usd_commitment_defl",
  "usd_received_defl",
  "usd_disbursement_defl",
  "usd_received_defl",
  "usd_adjustment_defl",
  "usd_amountuntied",
  "usd_amounttied",
  "usd_amountuntied_defl",
  "usd_amountpartialtied_defl",
  "usd_amounttied_defl",
  "usd_IRTC",
  "usd_expert_commitment",
  "usd_expert_extended",
  "usd_export_credit",
  "commitment_national",
  "ParentChannelCode",
  "Geography",
  "typerepayment",
  "numberrepayment",
  "interest1",
  "interest2",
  "repaydate1",
  "repaydate2",
  "grantelement",
  "usd_interest",
  "usd_outstanding",
  "usd_arrears_principal",
  "usd_arrears_interest",
  "usd_future_DS_principal",
  "usd_future_DS_interest",
  "BudgetIdent",
  "CapitalExpend")

tout <- select(tout, -var_excl) # On exclut toutes les variables moins intéressantes.

can <- filter(tout, DonorName == "Canada" & AgencyCode == 3) # ... et on ne garde qu'Affaires mondiales Canada

# Nettoyage
# ---------

save(can, file = "./data/can.RData")
rm(tout)
rm(var_excl)


