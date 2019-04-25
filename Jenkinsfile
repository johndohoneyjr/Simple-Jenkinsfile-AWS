pipeline {   
  agent {
    node {
      label 'master'
    }  
  }
  environment {
       ATLAS_TOKEN      = "${env.ATLAS_TOKEN}"
       address          = "app.terraform.io"
       organization     = "<your_organization>"
       workspace        = "workspace-from-api"
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
        sh 'printenv | sort'
        echo "Archiving git directory."
        tar -czf dohoney.tar.gz -C $JENKINS_HOME --exclude .git .
        ls $JENKINS_HOME
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
