pipeline{
	agent any
	stages{
		stage("Git Checkout"){
			steps{
				git credentialsId: 'gituser', url: 'https://github.com/Hemantakumarpati/LoginWebApp.git'
				}
			}
		}
	}
