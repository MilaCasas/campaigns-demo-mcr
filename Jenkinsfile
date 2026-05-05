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
                sh 'mv target/*.jar .'
            }
        }
        stage('cleanup') {
            steps {
                echo 'Cleaning up old containers...'
                // Cambiamos "label=campaigns-demo" por "label=campaign-demo-server" para cumplir con la guía
                sh 'docker system prune -a --volumes --force --filter "label=campaign-demo-server"'[cite: 1, 2]
            }
        }
        stage('build image') {
            steps {
                echo 'Building Docker image...'
                // Usamos la etiqueta exacta: campaign-demo-server
                sh 'docker build -t milacasas/campaign-demo:v1 --label campaign-demo-server .'[cite: 1, 2]
            }
        }
        stage('run container') {
            steps {
                echo 'Starting Campaigns container on port 5000...'
                // Importante: El puerto 5000:5000 y el nombre del contenedor corregido
                sh 'docker run -d --name campaign-demo-server --label campaign-demo-server -p 5000:5000 milacasas/campaign-demo:v1'[cite: 1, 2]
            }
        }
    }
}
