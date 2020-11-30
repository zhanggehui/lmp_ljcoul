a=`idle | \
awk '
BEGIN{cnnl=0;cnshort=0;cnlong=0;}
/cn_nl/{ cnnl=substr($0,33,2);cnnl=cnnl+0;} 
/cn-short/{ cnshort=substr($0,33,2);cnshort=cnshort+0;} 
/cn_long/{ cnlong=substr($0,33,2);cnlong=cnlong+0;} 
END {
      if (cnnl>=cnshort) {choosen=cnnl;}
      else {choosen=cnshort;}
      print choosen;
    }
    ' `
echo $a