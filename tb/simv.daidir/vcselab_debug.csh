#!/bin/csh -f

cd /home/yang/Project/paillier/tb

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/opt/synopsys/vcs/T-2022.06/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

