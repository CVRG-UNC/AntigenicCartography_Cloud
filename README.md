# N204 Data Availability Repo

See `Code_Availability` for the source R file and Dockerfile for building a container to run the R file.

Alternatively, follow the instructions below to pull a Docker image that has already been built for this purpose.

```bash
docker pull cameronnguyen/cvrg-antigenic-cartography:version1
```

You may now run the analysis by mounting your titer table directory to a container based on the image above like so:

```bash
for titer_table in 204*.csv
do
    var=$(echo $titer_table | sed -e 's/.csv//g')
    docker run -v $(pwd):/usr/local/work cameronnguyen/cvrg-antigenic-cartography:version1 \
        --input $titer_table \
        --xy_lim="-5,5,-5,5" \
        --prefix $var \
        --out $var'_dir' \
        --psizes 5,2 \
        --opacity .8,1 \
        --agoverprint FALSE \
        --agsort FALSE 
done
```
