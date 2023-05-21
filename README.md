# jenkins-on-docker

This is repo is about how to quickly set up Jenkins on a local system using the Configuration as Code plugin. jcasc plugin allows you to define the Jenkins configuration as a human-readable YAML file, instead of using the web UI. You can also use the Job DSL plugin to run pipeline as code.

The benefits of using this approach are:

- version control your Jenkins configuration and track changes over time.
- easily reproduce and restore your Jenkins environment in case of failure or migration.
- automate the installation and configuration of Jenkins and its plugins.

To run this setup, you will need:

- Docker and docker-compose installed on your local system.
- `.env` file with the necessary values for your Jenkins instance, such as JENKINS_URL, JENKINS_ADMIN_ID, JENKINS_ADMIN_PASSWORD, etc.
- `keys.sh` script that creates SSH keys for Jenkins with agent with ssh-agent.
- `docker-compose.yml` file that defines the Jenkins service and its dependencies, such as a network and a volume.
- `casc_configs` directory that contains the YAML files for the Configuration as Code plugin, such as jenkins.yaml, credentials.yaml, plugins.yaml, etc.

The steps to run this setup are:

1. Run the keys.sh script to create SSH keys for Jenkins. This will generate a private key and a public key in the `keys` directory.
   
   ```shell
   bash keys.sh
   ```
2. Add the necessary values in the .env file, such as JENKINS_ADMIN_ID, JENKINS_ADMIN_PASSWORD, and `id_rsa.pub` key etc.

3. Run docker-compose with --env-file up --build -d to start the Jenkins service and its dependencies. This will pull the latest Jenkins image, build the Dockerfile, and run the container in detached mode.
 
   ```shell
   cp .env.example .env
   docker compose --env-file ./.env up --build -d
   ```

4. Wait for Jenkins to be fully initialized. You can check the logs with docker-compose logs -f jenkins or visit http://localhost:8080/  in your browser.
   
   ```shell
   docker-compose logs -f
   ```

5. Log in to Jenkins with your JENKINS_ADMIN_ID and JENKINS_ADMIN_PASSWORD.
   
6. Explore your Jenkins instance and verify that everything is configured as expected. You should see that your plugins are installed, your credentials are set up, your security realm is configured, etc.
   
7. To stop and clean up your Jenkins setup, run docker-compose down. Use -v to remove values if you want to delete the volume and network as well.

    ```shell
    docker compose down
    # or if you want delete volumes created by compose 
    docker compose down -v
    ```

Congratulations! You have successfully set up Jenkins on your local system using the Configuration as Code plugin. You can now use this setup to run your pipelines as code and enjoy a fully automated and reproducible Jenkins environment.
