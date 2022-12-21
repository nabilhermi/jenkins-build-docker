node{

    stage('Clone') {
        checkout scm
    }
    stage('Ansible') {
   
    sh 'ansible-playbook -i hosts.yml playbook.yml'
    }

}
   

