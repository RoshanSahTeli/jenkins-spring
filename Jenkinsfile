pipeline {
    agent any
    tools {
        maven 'maven_3.9.9'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RoshanSahTeli/jenkins-spring']])
                bat 'mvn clean install'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t roshanteli/spring-jenkins .'
                }
            }
        }
        stage('Push Image to Hub') {
            steps {
                script {
                    bat 'docker login -u roshanteli -p Pramilaprem12'
                    bat 'docker push roshanteli/spring-jenkins:latest'
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
          			def containerExists = bat(script: 'docker ps -a --filter "name=spring-jenkins" --format "{{.Names}}"', returnStdout: true).trim()

                    if (containerExists) {
                        bat 'docker stop spring-jenkins || true'
                        bat 'docker rm spring-jenkins || true'
                    }
                    bat 'docker run -d --name spring-jenkins -p 8082:8080 roshanteli/spring-jenkins:latest'
                }
            }
        }
    }
}
