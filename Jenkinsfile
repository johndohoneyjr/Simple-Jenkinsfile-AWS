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
        checkout scm

    sh 'touch test.txt'
    sh 'ls ../../../../../'
    sh 'ls /'
    sh 'ls $HOME'
    sh 'ls $JENKINS_HOME'
    sh 'ls $TMPDIR'
    sh '''
        echo $ATLAS_TOKEN
        echo $(pwd)
        ls .
        ls $(pwd)
        rm test.txt
     '''
      }
    }
    stage('init') {
      steps {
        sh '''
          echo "Archiving git directory."
          tar cvzf $UPLOAD_FILE_NAME -C $JENKINS_HOME --exclude .git .
          stat  $JENKINS_HOME/$UPLOAD_FILE_NAME
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
