###############################################################
# Species Accumulation Curve (Rarefaction Analysis)
#
# Description: Script to generate species accumulation curves
#              using the vegan package in R, with randomization
#              and standard error visualization.
# Created by Thales Querino
# thaleesq@gmail.com
#
###############################################################

# Load required package
library(vegan)

# Import data (samples as rows, species as columns)
dados <- read.csv("seuarquivo.csv", row.names = 1)

# Remove empty samples
dados <- dados[rowSums(dados) > 0, ]

# Generate species accumulation curve
curva <- specaccum(dados, method = "random")

# Plot curve with standard error
plot(curva, ci.type = "poly", col = "black", lwd = 2, ci.lty = 0,
     ci.col = adjustcolor("black", alpha.f = 0.2),
     xlab = "Number of Samples", ylab = "Species Richness")

# Add trend line
lines(curva$sites, curva$richness, lwd = 2, col = "darkgreen")