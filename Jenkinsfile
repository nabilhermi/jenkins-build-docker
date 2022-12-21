node {
   def registryProjet='registry.gitlab.com/nabil37/formation'
   def IMAGE="${registryProjet}:version-${env.BUILD_ID}"
   
    stage('Build - Clone') {
         checkout scm
    }
    stage('Build - Maven package'){
            sh 'mvn package'
    }
    def img = stage('Build') {
          docker.build("$IMAGE",  '.')
    }
    stage('Build - Test') {
            img.withRun("--name run-$BUILD_ID -p 8081:8080") { c ->
            sh 'docker ps'
            sh 'netstat -ntaup'
            sh 'sleep 30s'
            sh 'curl 127.0.0.1:8081'
            sh 'docker ps'
          }
    }
    stage('Build - Push') {
          docker.withRegistry('https://registry.gitlab.com', 'ed89b8b8-1790-4c37-a59b-a5653128940c') {
              img.push 'latest'
              img.push()
          }
    }
    stage('Deploy - Clone') {
           checkout scm
    }
    stage('Deploy - End') {
      ansiblePlaybook (
          colorized: true,
          become: true,
          playbook: 'playbook.yml',
          inventory: 'hosts.yml',
          extras: "--extra-vars 'image=$IMAGE'"
      )
    }

}

