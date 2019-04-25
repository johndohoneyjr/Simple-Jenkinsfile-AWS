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
       ARTIFACTPATH     = "output"
       OUTPUT           = "bundle.tar.gz"
  }
  stages {

    stage('checkout') {
      steps {
        sh 'ls -lag'
      }
    }
    stage('Bundle') {
        steps {
            sh 'rm -rf $ARTIFACTPATH'
            sh 'mkdir -p $ARTIFACTPATH'
            sh 'tar czf $ARTIFACTPATH/$OUTPUT --exclude $ARTIFACTPATH --exclude .git .'
            }
        }
    stage('build-tarball') {
      steps {
        sh '''
          whoami
          ls -lag $ARTIFACTPATH
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
