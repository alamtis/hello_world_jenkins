pipeline {
    agent any
    stages {
        stage('Récupération du code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/alamtis/hello_world_jenkins.git'
            }
        }
        stage('Tests') {
            steps {
                sh 'python -m unittest discover -s app'
            }
        }
//          stage('Initialize'){
//             steps {
//                 script {
//                     def dockerHome = tool 'myDocker'
//                     env.PATH = "${dockerHome}/bin:${env.PATH}"
//                 }
//             }
//         }
        stage('Créer une image Docker') {
            steps {
                sh 'docker build -t hello-world .'
            }
        }
    }
    post {
        success {
            echo 'Tests réussis !'
        }
        failure {
            echo 'Échec des tests.'
        }
    }
}
