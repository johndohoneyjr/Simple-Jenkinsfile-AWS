pipeline {   
  agent {
    node {
      label 'master'
    }  
  }
  environment {
        ATLAS_TOKEN     = "${env.ATLAS_TOKEN}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
  }
  stages {
    stage('checkout') {
      steps {
        checkout scm
        echo "${ATLAS_TOKEN}"
        echo "Tarring configuration directory."
        
        sh 'curl -X GET https://app.terraform.io/api/v2/organizations/johndohoneyjr \
         -H "Authorization: Bearer ${ATLAS_TOKEN}" \
         -H "Content-Type: application/vnd.api+json"'
      }
    }
    stage('init') {
      steps {
        sh 'curl -X GET https://app.terraform.io/api/v2/organizations \
         -H "Authorization: Bearer 0rP1AGPSCxm5sg.atlasv1.V2NqUbFryMnCsopae1vW8BnzKiMYQFRywE4xmswXplQKoAzzQMozHcgoKr5CitDyMVs" \
         -H "Content-Type: application/vnd.api+json"' 
      }
    }
    stage('plan') {
      steps {
      }
    }
    stage('approval') {

      steps {
        
      }
    }
    stage('apply') {
      steps {
        
        cleanWs()
      }
    }
  }
}
