pipeline {
    agent any
    
    stages {
        
        stage("git checkout"){
            steps{
                git 'https://github.com/bodlasai/learning'
            }
            
        }
       
        stage('Build Docker image'){
            steps {
              
                sh 'docker build -t  sai1920/test1 .'
            }
        }

        stage('Docker Login'){
            
            steps {
                
                withCredentials([string(credentialsId: 'pwddocker', variable: 'dockerpwd')]) {
                 sh "docker login -u sai1920 -p ${dockerpwd}"
             }
            }                
        }

        stage('Docker Push'){
            steps {
                sh 'docker push sai1920/test1'
            }
        }
        
        stage('Docker deploy'){
            steps {
                sshagent(['devserver']) {
                     sh 'ssh -o StrictHostKeyChecking=no ec2-user@18.223.185.6 docker run -itd -p  8081:80 sai1920/test1' 
                     
                   }
            }
        }

        
    }
}
