pipeline {
    agent {
        node {
            label 'master'
        }
    }
environment {
        AWS_ACCESS_KEY_ID     = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        TERRAFORM_CMD = 'docker run --network host -w /app -v ${HOME}/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/app hashicorp/terraform:light'
    }
    stages {
        stage('checkout repo') {
            steps {
              checkout scm
            }
        }
        stage('pull latest light terraform image') {
            steps {
                sh  """
                    docker pull hashicorp/terraform:light
                    """
            }
        }
        stage('init') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} init -backend=true -input=false
                    """
            }
        }

    }

}
