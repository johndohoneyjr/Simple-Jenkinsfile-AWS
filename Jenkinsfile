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

    sh 'touch test.txt'
    sh 'ls ../../../../../'
    sh 'ls /'
    sh 'ls $HOME'
    sh 'ls $JENKINS_HOME'
    sh 'ls $TMPDIR'
    sh '''
        echo $(pwd)
        ls .
        ls $(pwd)
        '''
    def out='$(pwd)/download/maven.tgz'
    sh 'mkdir -p ./download'
    sh 'curl -L http://ftp.cixug.es/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -o ' + out
    def newName = 'mvn.tgz'
    sh 'mkdir -p $(pwd)/other'
    sh 'mv ' + out + ' ' + newName
    sh 'cp ' + newName + ' ' + out

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
