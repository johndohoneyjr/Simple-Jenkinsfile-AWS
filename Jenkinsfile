pipeline {   
  agent {
    node {
      label 'master'
    }  
  }
  environment {
       ATLAS_TOKEN      = "${env.ATLAS_TOKEN}"
       address          = "app.terraform.io"
       organization     = "johndohoneyjr"
       workspace        = "workspace-from-api"
       UPLOAD_FILE_NAME = "myjob.tar.gz"
  }
  stages {

    stage('checkout') {
      steps {
        sh 'ls'
      }
    }
    stage('build-tarball') {
      steps {
        sh '''
          echo "Archiving git directory."
          tar cvzf $UPLOAD_FILE_NAME -C $HOME --exclude .git .
        '''
      }
    }
    stage('plan') {
      steps {
        cd ~
        pwd
        echo "${HOME}"
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
