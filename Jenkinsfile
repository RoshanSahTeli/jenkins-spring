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
          		
                    bat 'docker run -d --name spring-jenkins -p 8082:8080 roshanteli/spring-jenkins:latest'
                }
            }	
        }
    }
}
