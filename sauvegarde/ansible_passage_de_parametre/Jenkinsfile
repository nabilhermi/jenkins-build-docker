node{
    stage('Clone') {
        checkout scm
    }
    stage('Ansible') {
      ansiblePlaybook (
          colorized: true, 
          become: true,             
          playbook: 'playbook.yml',
          inventory: 'hosts.yml',
          extras: '--extra-vars "mavariable=${MAVARIABLE}"'

      )
    }
}
