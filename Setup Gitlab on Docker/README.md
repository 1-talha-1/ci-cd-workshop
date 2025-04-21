# GitLab & GitLab Runner Setup Guide

This guide provides instructions for setting up GitLab and GitLab Runner in a Docker environment.

## Getting Started with GitLab

### Retrieve GitLab Root Password
After installing GitLab, retrieve the initial root password:
```bash
docker exec -it gitlab cat /etc/gitlab/initial_root_password
```

### Configure Local DNS
Add the following entry to your `/etc/hosts` file:
```
127.0.0.1 gitlab.example.com
```

## Setting Up GitLab Runner

### Export GitLab Certificate
Export the GitLab SSL certificate to the runner configuration directory:
```bash
docker exec -it gitlab cat /etc/gitlab/ssl/gitlab.example.com.crt > /mnt/media/gitlab-runner/config/gitlab.crt
```

### Register GitLab Runner
Start the GitLab Runner registration process:
```bash
docker run --rm -it \
  --network "host" \
  -v /mnt/media/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner register \
  --url "https://gitlab.example.com" \
  --token "glrt-dDoxCnU6MQbv-E-2LTEwxCpZpzSms-YQ.0w1q2wglv" \
  --tls-ca-file=/etc/gitlab-runner/gitlab.crt
```

### Start GitLab Runner Container
After configuration is complete, start the GitLab Runner as a persistent container:
```bash
docker run -d \
  --name gitlab-runner \
  --restart always \
  --network "host" \
  -v /mnt/media/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner
```

## Next Steps

- Log in to your GitLab instance at `https://gitlab.example.com`
- Create projects and configure CI/CD pipelines
- Verify runner connectivity in Admin Area > CI/CD > Runners

## Troubleshooting

If you encounter issues:
- Check that the Docker containers are running properly
- Verify network connectivity between GitLab and the runner
- Ensure the SSL certificate is correctly exported and configured
