pipeline {
    agent {
        docker {
            image 'python:3.9-slim'
        }
    }
    stages {
        stage('Récupération du code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/alamtis/hello_world_jenkins.git'
            }
        }
        stage('Construction') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Tests') {
            steps {
                sh 'python -m unittest discover -s app'
            }
        }
        stage('Créer une image Docker') {
            steps {
                sh 'docker build -t hello-world .'
            }
        }
    }
    post {
        success {
            echo 'Construction et tests réussis !'
        }
        failure {
            echo 'Échec de la construction ou des tests.'
        }
    }
}
