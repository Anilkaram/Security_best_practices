@Library('jenkins_library') _

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
        stage ('quality gate'){
            steps {
                echo 'Waiting for SonarQube quality gate...'
                script {
                    def qg = waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to SonarQube quality gate failure: ${qg.status}"
                    }
                }
                echo 'SonarQube quality gate passed!'
            }
        }
    }
}
        
