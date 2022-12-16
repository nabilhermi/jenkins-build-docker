def pipelineContext = [:]
node {

   def registryProjet='registry.gitlab.com/nabil37/formation'
   def IMAGE="${registryProjet}:version-${env.BUILD_ID}"

    stage('Clone') {
          checkout scm
    }

    def img = stage('Build') {
          docker.build("$IMAGE",  '.')
    }

    stage('Run') {
          img.withRun("--name run-$BUILD_ID -p 80:80") { c ->
            sh 'curl localhost'
          }
    }

    stage('Push') {
          docker.withRegistry('https://registry.gitlab.com', 'ed89b8b8-1790-4c37-a59b-a5653128940c') {
              img.push 'latest'
              img.push()
          }
    }

}

