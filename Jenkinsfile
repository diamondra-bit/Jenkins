pipeline {
    agent any
    
    tools {
        maven 'Maven 3'
    }
    
    stages {
        stage('git checkout') {
            steps {
                git credentialsId: 'git_credentials', 
                    url: 'https://github.com/diamondra-bit/Jenkins.git', 
                    branch: 'main'
            }
        }
        
        stage('Build the application') {
            steps {
                bat 'mvn clean install'
            }
        }

        stage('Unit Test Execution') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Build the docker image') {
            steps {
                bat 'docker build --tag diamondra/demoic:1.0.0 .'
            }
        }
    }
}