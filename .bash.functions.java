#-*-sh-*-

# mvn-create $groupId $artifactId $version
# mvn-create $groupId $artifactId (version defaults to 0.01)
# mvn-create $artifactId (like above, and groupId defaults to org.sysbiology)
# EG mvn-create <some_project>
function mvn-create() {
    if [ $# -eq 1 ]; then
	groupId='com.phonybone'
        artifactId=$1
        version=0.01
    elif [ $# -eq 2 ]; then
        groupId=$1
	artifactId=$2
        version=0.01
    elif [ $# -eq 3 ]; then
	groupId=$1
	artifactId=$2
	version=$3
    else
        echo usage $0 '[groupId]' '<artifactId>' '[version]'
        return
    fi

    if [ -z $artifactId ]; then
        echo artifactId not set
	return 
    fi

    mvn archetype:generate \
	-DarchetypeGroupId=com.victorcassen \
	-DarchetypeArtifactId=quick-start \
	-DarchetypeVersion=1.0 \
	-DgroupId=${groupId} \
	-DartifactId=${artifactId} \
	-Dversion=${version} \
	-B
    
    # old version using quickstart; now we use our own archetype (above)
    # mvn archetype:generate \
    # 	-DarchetypeArtifactId=maven-archetype-quickstart \
    # 	-DinteractiveMode=false \
    # 	-DgroupId=$groupId \
    # 	-DartifactId=$artifactId \
    #     -Dversion=$version
}

# maven shortcuts:
# run one test class; recompile everything first
function mtest() {
    mvn compile compiler:testCompile surefire:test -Dtest=${1}
}

# run a jar:
# mvn-run $main_class [$arg1 $arg2 ...]
function mvn-run() {
    mvn exec:java -Dexec.mainClass="$1" -Dexec.args="${@:2}"
}

# Call mvn install:install-file to the local .m2 repo:
function mvn-install() {
    file=$1
    group_id=$2
    artifact_id=$3
    version=$4
    packaging=jar
    mvn install:install-file \
	-Dfile=$file \
	-DgroupId=$group_id \
	-DartifactId=$artifact_id \
	-Dversion=$version \
	-Dpackaging=$packaging \
	-DgeneratePom=true
}

function here() {
    cd `/bin/pwd`
}

