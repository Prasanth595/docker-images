export REPO_URL=prasanth595

for dir in ./*/*
do
    pushd $dir &> /dev/null
        # tmp var for short dirname
        tmp=$(dirname $dir)

        # strip all characters leading up to and including '/'
        appname=${tmp##*/}
        disttag=${dir##*/}

        docker build -t $REPO_URL/${appname}:${disttag} .
        docker push $REPO_URL/${appname}:${disttag}
        docker rmi $REPO_URL/${appname}:${disttag}
    popd &> /dev/null;
done