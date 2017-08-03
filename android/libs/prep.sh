#/bin/sh

for filename in *.aar; do
  base=${filename%.aar}
  unzip ${filename} classes.jar
  unzip ${filename} "res/*" -d res/${base}
  mv classes.jar ${base}.jar
done
