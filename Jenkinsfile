pipeline {
    agent any 
    environment {
        scannerHome = tool 'sonar-install'
    }
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage ('clean workspace') {
            steps {
                cleanWs()
            }
        }
        
        stage ('code checkout') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'feature-v2', url: 'https://github.com/Anilkaram/travel_ease.git'
                echo 'Repository cloned successfully!'
            }
        } 
        stage ('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-install') {
                    echo 'Running SonarQube analysis...'
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=security_project"
                    echo 'SonarQube analysis completed!'
                }
            }
        }
    }
}
        
