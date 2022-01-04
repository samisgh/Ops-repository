terraform {
	backend "remote" {
		organization = "kensuio"
		workspaces {
			name = "samisgh-ops-repository" 
		}
	}
}
