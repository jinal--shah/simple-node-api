// vim: et sr sw=4 ts=4 smartindent:
/*
    ... using scripted pipeline instead of declarative, due to
    limitations of the docker-workflow with swarm.
*/
node {
    stage('checkout') {
        checkout scm
    }

    stage('build docker image') {
        docker.withServer("tcp://10.95.225.29:4243") {
            docker.image('jenkins-runner:stable').inside("-m 100m --cpus 0.5") {
                sh '''
                    /bin/bash ./build.sh
                '''
            }
        }
    }

    stage('prod-ready - tag as stable') {
        docker.withServer("tcp://10.95.225.29:4243") {
            docker.image('jenkins-runner:stable').inside("-m 100m --cpus 0.5") {
                sh '''
                    /bin/bash ./tag_built_image.sh stable
                '''
            }
        }
    }
}
