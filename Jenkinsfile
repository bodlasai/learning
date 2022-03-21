pipeline{
    agent any
    environment{
    PATH="/c/'Program Files (x86)'/apache-maven-3.8.2/bin:$PATH" 
   }
    stages{
        stage("welcome"){
            steps{
                echo "hello multipranch pipeline dev file"
            }
        }
        stage("maven build"){
            steps{
                sh "perform maven options"
            }
        }
        
    }
}
