pipeline{
    agent any
    environment{
    PATH="/c/'Program Files (x86)'/apache-maven-3.8.2/bin:$PATH" 
   }
    stages{
        stage("welcome"){
            steps{
                echo "hello declerative pipeline"
            }
        }
        Stage("maven build"){
            steps{
                sh "mvn clean package"
            }
        }
        
    }
}
