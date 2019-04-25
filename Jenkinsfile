pipeline {   
  agent {
    node {
      label 'master'
    }  
  }
  environment {
        ATLAS_TOKEN     = "${env.ATLAS_TOKEN}"
  }
  stages {

    stage('checkout') {
      steps {
        checkout scm
        sh  """
         pwd
         ls -la

         echo "Tarring configuration directory."
         ls -l /root
        """
      }
    }
    stage('init') {
      steps {
        sh 'curl --silent -X GET https://app.terraform.io/api/v2/organizations \
         -H "Authorization: Bearer 0rP1AGPSCxm5sg.atlasv1.V2NqUbFryMnCsopae1vW8BnzKiMYQFRywE4xmswXplQKoAzzQMozHcgoKr5CitDyMVs" \
         -H "Content-Type: application/vnd.api+json"' 
            tempDir('/tmp/jobDir') {
               // your steps here
             } 
      }
    }
    stage('plan') {
      steps {
        cd ~
        pwd
        echo "${HOME}"
        sh 'tar -h '
      }
    }
    stage('approval') {

      steps {
        sh ' ls -a '
      }
    }
    stage('apply') {
      steps {
        
        cleanWs()
      }
    }
  }
}
