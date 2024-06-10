#/bin/sh

eval "$(conda shell.bash hook)"

conda activate ipcc_ch6f19

DIR=Chapter-6_Fig19

# download the source PNG from IPCC
# wget https://www.ipcc.ch/report/ar6/wg1/downloads/figures/IPCC_AR6_WGI_Figure_6_19.png
# wget https://www.ipcc.ch/report/ar6/wg1/downloads/figures/IPCC_AR6_WGI_Figure_6_18.png

# Apply changes to produce figure of $DIR
echo Patching $DIR
cd $DIR
patch < ../${DIR}.patch

# python plots.py

mv global_legend_CH4.png ../IPCC_AR6_WGI_Figure_6_18_legend.png

mv global_legend_HFC.png ../IPCC_AR6_WGI_Figure_6_19_legend.png

mv global_only.png ../IPCC_AR6_WGI_Figure_6_18_plots.png
mv region_only.png ../IPCC_AR6_WGI_Figure_6_19_plots.png

# Remove the changes
git checkout plots.py
