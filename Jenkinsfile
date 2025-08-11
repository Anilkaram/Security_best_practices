@Library('jenkins_library') _

def dirs = ['client', 'server']

pipeline {
    agent any 
    environment {
        scannerHome = tool 'sonar-install'
        DOCKER_CLIENT = 'anildoc143/travel_ease_website_v6:client'
        DOCKER_SERVER = 'anildoc143/travel_ease_website_v6:server'
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
        
        stage ('npm install ${d}') {
            steps {
                script {
                    dirs.each { d -> 
                        dir(d) {
                            sh 'npm install'
                        }
                    }
                }
            }
        }
        
        stage ('npm test ${d}') {
            steps {
                script {
                    dirs.each { d -> 
                        dir(d) {
                            sh 'npm test'
                        }
                    }
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
                sh 'docker build -t $DOCKER_CLIENT client'
                sh 'docker build -t $DOCKER_SERVER server'
            }
        }
        stage ('scan image') {
            steps {
                sh 'trivy image  --exit-code 1 --severity CRITICAL $DOCKER_CLIENT || exit 1'
                sh 'trivy image  --exit-code 1 --severity CRITICAL $DOCKER_SERVER || exit 1'
            }
        }
        stage ('docker login') {
            steps {
                vaultSecrets(
                    'github', [
                    [envVar: 'DOCKERHUB_USER', vaultKey: 'username'],
                    [envVar: 'DOCKERHUB_PASS', vaultKey: 'password']]
                ) {
                    script {
                        sh 'docker login -u DOCKERHUB_USER -p DOCKERHUB_PASS' 
                    }
                }
            }
        }
        stage ('docker push') {
            steps {
                sh 'docker push $DOCKER_CLIENT'
                sh 'docker push $DOCKER_SERVER'
                }
            }
        }
    }
    post {
        always {
           mail to: 'anilkumarkarampuri3@gmail.com',
           subject: "Jenkins Build Notification: ${currentBuild.fullDisplayName}",
                 	body: """\
                 		Build Status: ${currentBuild.currentResult}
                 		Project: ${env.JOB_NAME}
                 		Build Number: ${env.BUILD_NUMBER}
                 		Build URL: ${env.BUILD_URL}
                 	"""
        }
    }
}
   
