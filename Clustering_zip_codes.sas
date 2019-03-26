libname clust_01 "E:\SASHome\BIA 672\SAS_data";
run; 
* Copy the sas data ;
proc copy in = clust_01 out=work;
select income_byzip_pct;
run;
ods graphics on;
ods rtf file = 'E:\SASHome\BIA 672\SAS_output\HW01_hierarical_clustering_kumar_kovid.rtf';

proc cluster data = income_byzip_pct outtree=Hcluster method=SINGLE;
var Returns_pct1 Returns_pct2 Returns_pct3 Returns_pct4 Returns_pct5 Returns_pct6;
id zipcode;
where STATEFIPS = 51 ;
run;
proc tree data = Hcluster ;
run;

proc tree noprint ncl=10 out=out_hcluster;
	copy zipcode;
run;

ods graphic close;
ods rtf close;

* =========================================k-Mean clustering==========================================;

ods graphics on;
ods rtf file = 'E:\SASHome\BIA 672\SAS_output\HW01_kmeans_clustering_kumar_kovid.rtf';
proc fastclus data =income_byzip_pct 
maxclusters =10 out=K_mean; 
var Returns_pct1 Returns_pct2 Returns_pct3 Returns_pct4 Returns_pct5 Returns_pct6;
id zipcode  ;
where STATEFIPS = 51;
run;
proc print data = K_mean;
var zipcode cluster ;
run;

ods graphic close;
ods rtf close;

