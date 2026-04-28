This project demonstrates a complete CI/CD lifecycle for a Node.js application, including automated infrastructure provisioning with Terraform and full-stack observability using the New Relic APM agent.

This is the updated README.md guide. It’s structured to walk a new user through the "why" and "how" of your solution, using your screenshots as the verification standard for each phase.

Node.js Observability: Docker, Terraform, and New Relic CI/CD Guide
This repository provides a complete blueprint for deploying a Node.js application with Infrastructure as Code (IaC) and full-stack observability. Whether you are a DevOps enthusiast or a Senior Engineer, this guide will help you replicate the setup.

Prerequisites & Forking Instructions
To run this code in your own environment, you must first fork the repository and configure your credentials.
1.	Fork the Repo: Click the Fork button at the top right of this page.
2.	Set Up GitHub Secrets: Navigate to Settings > Secrets and variables > Actions in your forked repo and add:
o	DOCKER_USERNAME: Your Docker Hub username.
o	DOCKER_PASSWORD: Your Docker Hub Personal Access Token (PAT).
o	NEW_RELIC_LICENSE_KEY: Your 40-character Ingest - License key.
3.	Update Configs: 
o	If your New Relic account is in the Europe (EU) region, ensure NEW_RELIC_HOST is set to collector.eu01.nr-data.net in your environment variables.

Step-by-Step Implementation & Validation
Step 1: Local Application Baseline
What we did: We verified that the core Node.js application functions correctly on port 3000 before adding any complexity.
•	Validation: Run node index.js and visit http://localhost:3000. You should see "Hello Node!".
<img width="1638" height="252" alt="Screenshot 2026-04-27 150150" src="https://github.com/user-attachments/assets/0f509ae0-19f6-4e3e-a425-35692b882f20" />


Step 2: Containerization
What we did: We created a Dockerfile to package the app and its dependencies. This ensures the app runs the same way in production as it does locally. The image is then pushed to Docker Hub.
•	Validation: Check your Docker Hub repository. You should see a new image tagged and ready for pull.
 
<img width="1881" height="835" alt="Screenshot 2026-04-27 163248" src="https://github.com/user-attachments/assets/1d1a663a-2361-4d03-81e5-9c3d5061d8c9" />

Step 3: Infrastructure as Code (Terraform)
What we did: Instead of manually creating containers, we used Terraform to define the infrastructure. This includes the Docker provider setup and container resource definitions.
•	Validation: During the terraform apply phase, you should see the "Apply complete" message indicating resources were successfully created.
 
 
 <img width="518" height="80" alt="Screenshot 2026-04-27 191419" src="https://github.com/user-attachments/assets/2c696527-0ef4-4cd6-93f4-f0ea89923277" />
<img width="606" height="78" alt="Screenshot 2026-04-27 191402" src="https://github.com/user-attachments/assets/6a60660c-65f3-4585-8c05-232457462f22" />
<img width="1869" height="873" alt="Screenshot 2026-04-28 181136" src="https://github.com/user-attachments/assets/b5c3857c-1c66-4627-92fe-a03786cd7395" />


Step 4: CI/CD Automation (GitHub Actions)
What we did: We wrote a workflow file (.github/workflows/pipeline.yml) that automatically builds the Docker image and triggers Terraform whenever code is pushed to the main branch.
•	Validation: Check the Actions tab in GitHub. A successful run will show all green checkmarks across the build and deploy stages.
 

Step 5: New Relic Instrumentation
What we did: We integrated the newrelic agent into the Node.js runtime. This requires setting the NEW_RELIC_LICENSE_KEY and the correct NEW_RELIC_HOST for regional routing.
•	Validation: Check the container logs. The agent must log a "Reporting to:" URL. This confirms the security handshake between your app and New Relic is successful.
 

<img width="1296" height="831" alt="Screenshot 2026-04-28 174543" src="https://github.com/user-attachments/assets/000b8b62-2319-4cd4-b25f-0602ddbd44ac" />

Step 6: Final Observability Check
What we did: Once the agent is reporting, we generate traffic to the app so New Relic can populate the dashboards with real-time performance data.
•	Validation: Log in to New Relic One. Your application name (e.g., Local-Test-Nawy) should appear in the APM & Services explorer with active health status.
 
<img width="1423" height="763" alt="Screenshot 2026-04-28 181124" src="https://github.com/user-attachments/assets/a4141e90-8bbf-4e42-ad9c-24a549276ce3" />



