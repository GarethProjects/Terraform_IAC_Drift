pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="us-east-2"
        THE_BUTLER_SAYS_SO=credentials('aws-creds')
    }
    stages {
        stage ("Creds") {
            steps {
                sh '''
          aws --version
          aws ec2 describe-instances
        '''
            }
        }
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }
        stage ("Terraform Format") {
            steps {
                sh ('terraform fmt')
            }
        }
       stage ("terraform validate script") {
            steps {
                sh ('terraform validate') 
            }
        }
        
        stage ("state list") {
            steps {
                sh ('terraform state list')
            }
        }
        
        stage ("plan") {
            steps {
                sh ('terraform plan -out tfplan')
                sh ('terraform show -no-color tfplan >tfplan.txt')
            }
        }
      
    post {
        always {
            archiveArtifacts artifacts: 'tfplan.txt'
            }
        }   
    }
}
