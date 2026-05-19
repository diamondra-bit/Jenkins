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

        stage('Build and Push to DockerHub') {
            steps {
                bat 'docker build --tag parkmirella/demoic:1.0.0 .'
                
                // 2. Récupère le mot de passe secret dans Jenkins
                withCredentials([string(credentialsId: 'dockerhubpass', variable: 'dockerHubPass')]) {
                    
                    // 3. Se connecte à Docker Hub (Attention aux doubles guillemets ici, c'est obligatoire !)
                    bat "docker login -u parkmirella -p $dockerHubPass"
                }
                
                // 4. Envoie l'image sur Internet
                bat 'docker push parkmirella/demoic:1.0.0'
            }
        }
    }
}