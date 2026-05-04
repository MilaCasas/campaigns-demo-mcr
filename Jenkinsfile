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
                // Cambiamos .war por .jar
                sh 'mv target/*.jar .'
            }
        }
            }
        }
        stage('cleanup') {
            steps {
                echo 'Cleaning up old campaigns containers...'
                sh 'docker stop campaigns-demo-server || true'
                sh 'docker rm campaigns-demo-server || true'
                sh 'docker system prune -f --filter "label=campaigns-demo"'
            }
        }
        stage('build image') {
            steps {
                echo 'Building Campaigns Docker image...'
                // Mantengo tu usuario milacasas en minúsculas
                sh 'docker build -t milacasas/campaigns-demo:v1 --label campaigns-demo .'
            }
        }
        stage('run container') {
            steps {
                echo 'Starting Campaigns container on port 8081...'
                // Mapeamos de nuevo al 8081 para que no choque con Jenkins
                sh 'docker run -d --name campaigns-demo-server --label campaigns-demo -p 8081:8080 milacasas/campaigns-demo:v1'
            }
        }
    }
}
