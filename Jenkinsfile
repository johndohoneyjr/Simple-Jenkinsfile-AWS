pipeline {
    agent {
        node {
            label 'master'
        }
    }
environment {
        AWS_ACCESS_KEY_ID     = "${env.AWS_ACCESS_KEY_ID}"
        AWS_SECRET_ACCESS_KEY = "${env.AWS_SECRET_ACCESS_KEY}"
        TERRAFORM_CMDX = 'docker run --network host -w /usr/src/app -v ${HOME}/.aws:/root/.aws -v ${HOME}/.ssh:/root/.ssh -v `pwd`:/usr/src/app hashicorp/terraform:light'
        TERRAFORM_CMD = 'docker run --network host -w `pwd` -v `pwd`:`pwd` hashicorp/terraform:light'
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
                    pwd
                    ls -la
                    ${TERRAFORM_CMD} version
                    pwd
                    ls -la
                    """
            }
        }
        stage('init') {
            steps {
                sh  """
                    pwd
                    ls -la
                    ${TERRAFORM_CMD} init 
                    """
            }
        }
        stage('plan') {
            steps {
                sh  """
                    pwd
                    ls -la
                    ${TERRAFORM_CMD} plan -state=tfplan 
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
                    ${TERRAFORM_CMD} apply -state=tfplan
                    """
           }
        }

    }

}
