// vim: et sr sw=4 ts=4 smartindent:

pipeline {
    agent {
        docker {
            args '-v /opt/cache/.m2:/root/.m2'
            image 'jenkins-runner:stable'
        }
    }
}
