#HGI round 4
wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/COVID19_HGI_A1_ALL_20201020.b37.txt.gz
mv COVID19_HGI_A1_ALL_20201020.b37.txt.gz HGI_round_4_A1.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/COVID19_HGI_A2_ALL_leave_23andme_20201020.b37.txt.gz
mv COVID19_HGI_A2_ALL_leave_23andme_20201020.b37.txt.gz HGI_round_4_A2.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/COVID19_HGI_B1_ALL_20201020.b37.txt.gz
mv COVID19_HGI_B1_ALL_20201020.b37.txt.gz HGI_round_4_B1.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/eur/COVID19_HGI_B2_ALL_eur_leave_23andme_20201020.b37.txt.gz
mv COVID19_HGI_B2_ALL_eur_leave_23andme_20201020.b37.txt.gz HGI_round_4_B2.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/COVID19_HGI_C1_ALL_leave_23andme_20201020.b37.txt.gz
mv COVID19_HGI_C1_ALL_leave_23andme_20201020.b37.txt.gz HGI_round_4_C1.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20200915/results/20201020/eur/COVID19_HGI_C2_ALL_eur_leave_23andme_20201020.b37.txt.gz
mv COVID19_HGI_C2_ALL_eur_leave_23andme_20201020.b37.txt.gz HGI_round_4_C2.txt.gz

##HGI round 5 
wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_A2_ALL_eur_leave_23andme_20210107.b37.txt.gz
mv COVID19_HGI_A2_ALL_eur_leave_23andme_20210107.b37.txt.gz HGI_round_5_A2_eur.txt.gz
wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_A2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz
mv COVID19_HGI_A2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz HGI_round_5_A2_eur_leave_ukbb.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_B1_ALL_eur_leave_23andme_20210107.b37.txt.gz
mv COVID19_HGI_B1_ALL_eur_leave_23andme_20210107.b37.txt.gz HGI_round_5_B1_eur.txt.gz
wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_B1_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz
mv COVID19_HGI_B1_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz HGI_round_5_B1_eur_leave_ukbb.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_B2_ALL_eur_leave_23andme_20210107.b37.txt.gz
mv COVID19_HGI_B2_ALL_eur_leave_23andme_20210107.b37.txt.gz HGI_round_5_B2_eur.txt.gz
wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_B2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz
mv COVID19_HGI_B2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz HGI_round_5_B2_eur_leave_ukbb.txt.gz

wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_C2_ALL_eur_leave_23andme_20210107.b37.txt.gz
mv COVID19_HGI_C2_ALL_eur_leave_23andme_20210107.b37.txt.gz HGI_round_5_C2_eur.txt.gz
wget https://storage.googleapis.com/covid19-hg-public/20201215/results/20210107/COVID19_HGI_C2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz
mv COVID19_HGI_C2_ALL_eur_leave_ukbb_23andme_20210107.b37.txt.gz HGI_round_5_C2_eur_leave_ukbb.txt.gz

gunzip *
