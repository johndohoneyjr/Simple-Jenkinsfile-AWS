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
            ARTIFACTPATH = "output"
        OUTPUT = "bundle.tar.gz"
  }
  stages {

    stage('checkout') {
      steps {
        sh 'ls -lag'
      }
    }
        stage('Bundle') {
            steps {
                // Archive everything to be sent to the server later
                sh 'rm -rf $ARTIFACTPATH'
                sh 'mkdir -p $ARTIFACTPATH'
                // Use `.bundleignore` as a file similar to .gitignore so different components can exclude pieces from being sent to prod
                sh 'tar czf $ARTIFACTPATH/$OUTPUT --exclude $ARTIFACTPATH  --exclude .git .'
            }
        }
    stage('build-tarball') {
      steps {
        sh '''
          whoami
          echo "Archiving git directory."
          mkdir /tmp/mytf
          tar cvzf myjob.tar.gz --directory=/tmp/mytf --exclude .git .
          ls -lag /tmp/mytf
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
