// vim: et sr sw=4 ts=4 smartindent:

agent {
  docker.withServer('tcp://10.95.225.29:4243', '') {
    args '-v /opt/cache/.m2:/root/.m2'
    image 'jenkins-runner:stable'
  }
}
