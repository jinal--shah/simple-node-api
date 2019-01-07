// vim: et sr sw=4 ts=4 smartindent:
/*
    ... using scripted pipeline instead of declarative, due to
    limitations of the docker-workflow with swarm.
*/
node {
    checkout scm
    docker.withServer("tcp://10.95.225.29:4243") {
        docker.image('jenkins-runner:stable').inside {
            sh '''
                pwd ; ls -l ;
                /bin/bash ./build.sh
            '''
        }
    }
}
