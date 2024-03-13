//Jenkinsfile (선언적 파이프라인)

pipeline {
    agent any
    stages {
        // git 에서 소스 다운로드
        stage('Git Checkout') {
            steps {
                sh 'echo "=== Git Clone ==="'
                git credentialsId: 'Github',
                    branch: 'master',
                    url: 'https://github.com/dlfghk1996/server.docker.git'
            }

            // 스테이지가 끝난 이후의 결과에 따른 후속 조치
            post {
                failure {
                    sh 'echo "Fail Cloned Repository"'
                }
            }
        }
    }

    // gradle build&Test
    stage('Build Gradle') {
        steps {
            sh 'echo "=== Build Gradle Start ==="'
            sh './gradlew clean build -x test'
        }
        post {
            failure {
                sh 'echo "Build Gradle Fail"'
            }
        }
    }

    // Docker Hub 에 이미지 푸시
    stage('Docker Hub Image build & Push') {
        steps {
          sh 'echo "Docker Hub Image Push Start"'
          docker.withRegistry('', 'docker') {
              def customImage = docker.build("1hwazz/springboot:${env.BUILD_ID}")
              customImage.push()
           }
        }
    }
}

