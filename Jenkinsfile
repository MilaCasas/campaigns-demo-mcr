pipeline {
    agent any
    tools {
        maven 'maven-3.9.6'
        dockerTool 'docker'
    }
    stages {
        stage('Packaging') {
            steps {
                echo 'Packaging Campaigns Demo..'
                sh 'mvn clean package'
            }
        }
        stage('Copying jar file') {
            steps {
                echo 'Copying campaigns jar file..'
                // Cambiado a .jar porque tu proyecto genera un JAR
                sh 'mv target/*.jar .'
            }
        }
        stage('cleanup') {
            steps {
                echo 'Cleaning up old containers...'
                sh 'docker stop campaigns-demo-server || true'
                sh 'docker rm campaigns-demo-server || true'
                sh 'docker system prune -f --filter "label=campaigns-demo" || true'
            }
        }
        stage('build image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t milacasas/campaigns-demo:v1 --label campaigns-demo .'
            }
        }
        stage('run container') {
            steps {
                echo 'Starting Campaigns container on port 8081...'
                sh 'docker run -d --name campaigns-demo-server --label campaigns-demo -p 8081:5000 milacasas/campaigns-demo:v1'
            }
        }
    }
}
