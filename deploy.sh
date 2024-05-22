pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }

  tools {
    terraform 'terraform'
  }

  stages {
    stage('Checkout from Git') {
      steps {
        git branch: 'main', url: 'https://github.com/Anmoltrainer/terraform-demo.git'
      }
    }

    stage('Initialization') {
      steps {
        script {
          sh 'terraform init'
        }
      }
    }

    stage('Deploy to Environments') {
      steps {
        script {
          sh './deploy.sh'  
        }
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
