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
        sh 'ls -lag'
      }
    }
    stage('build-tarball') {
      steps {
        sh '''
          whoami
          echo "Archiving git directory."
          tar cvzf $UPLOAD_FILE_NAME -C $HOME --exclude .git .
          cp $HOME/$UPLOAD_FILE_NAME $TMPDIR/$UPLOAD_FILE_NAME
          ls -lag $TMPDIR
        '''
      }
    }
    stage('Set-Variables') {
      steps {
        sh 'ls -lag $HOME'
      }
    }
    stage('Start-Run') {

      steps {
        sh ' ls -a '
      }
    }
    stage('Clean-Up') {
      steps {
        
        cleanWs()
      }
    }
  }
}
