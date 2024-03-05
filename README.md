This package contains a dataset of the Swedish National Monitoring Programme for Contaminants in Marine Biota (MCoM) funded by the Swedish Environmental Protection Agency and run by the Swedish Museum of Natural History. 
Intercalibration files are found for metals (intercalibration_metals), Per- and Polyfluoroalkyl Substances (intercalibration_PFAS.csv), Brominated Flame Retardants (intercalibration_BFR) and non-dioxin-like polychlorinated biphenyls (ndl-PCBs), hexachlorocyclohexanes (HCHs), hexachlorobenzene (HCB), and dichlorodiphenyltrichloroethane (DDT) (intercalibration_CLC.csv). These intercalibrations were made during laboratory changes for contaminants analyses. 

The package includes a function for shifting the MCoM dataset from a long to a wide format. 

To install the package: devtools::install_github("https://github.com/NRM-MOC/mcomDb", force = TRUE)
