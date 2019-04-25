pipeline {
    agent {
        docker { 
            image 'hashicorp/terraform:light' 
            args '-it --entrypoint=/bin/sh'
        }
    }
environment {
        AWS_ACCESS_KEY_ID     = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        TERRAFORM_CMDX = 'docker run --network host " -w /app -v ${HOME}/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/app hashicorp/terraform:light'
        TERRAFORM_CMD = 'terraform '
    }
    stages {
        stage('checkout repo') {
            steps {
              checkout scm
            }
        }
        stage('Check TF Version') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} version
                    """
            }
        }
        stage('init') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} init -input=false
                    """
            }
        }
        stage('plan') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} plan -out=tfplan -input=false 
                    """
                script {
                  timeout(time: 10, unit: 'MINUTES') {
                    input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deploy')
                  }
                }
            }
        }
        stage('apply') {
            steps {
                sh  """
                    ${TERRAFORM_CMD} apply -input=false tfplan
                    """
           }
        }

    }

}
