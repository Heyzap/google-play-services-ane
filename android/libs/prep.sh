#/bin/sh
mvn package
for filename in *.aar; do
  base=${filename%.aar}
  unzip ${filename} classes.jar
  unzip ${filename} "res/*" -d res/${base}
  mv res/${base}/res/** res/${base}/
  rm -r res/${base}/res
  mv classes.jar ${base}.jar
done
