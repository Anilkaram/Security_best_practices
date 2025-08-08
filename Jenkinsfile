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
        stage ('npm install client') {
            steps {
                dir('client') {
                    sh 'npm install'
                }
            }
        }
        stage ('npm install server') {
            steps {
                dir('server') {
                    sh 'npm install'
                }
            }
        }
        stage ('trivy') {
            steps {
                sh 'trivy fs --exit-code 1 --severity CRITICAL .'
            }
        }
        stage ('owasp') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'owasp-install'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage ('docker image') {
            steps {
                sh 'docker build -t anildoc143/travel_ease_website_v6:client'
                sh 'docker build -t anildoc143/travel_ease_website_v6:server'
            }
        }
        stage ('scan image') {
            steps {
                sh 'trivy scan  --exit-code 1 --severity CRITICAL anildoc143/travel_ease_website_v6:client || exit 1'
                sh 'trivy scan  --exit-code 1 --severity CRITICAL anildoc143/travel_ease_website_v6:server || exit 1'
            }
        }
        stage ('docker push') {
            steps {
                 script  {
                     withDockerRegistry(credentialsId: 'dockerhub_credentails') {
                        sh 'docker push anildoc143/travel_ease_website_v6:client'
                        sh 'docker push anildoc143/travel_ease_website_v6:server'
                    }
                }
            }
        }
    }
}
   
