# 

<div style="text-align: center; margin-top: 25%;">

# CI/CD Implementation with GitLab

## Comprehensive Workshop Manual

<br>

![Workshop Logo](/home/magician/Downloads/git.webp)

<br>
<br>
<br>

*Prepared by:*

**Dr Maqbool Khan**

**Talha**

**Choudhry Shahriyar**

</div>

<div style="page-break-after: always;"></div>

<div style="padding: 20px;">

# Table of Contents

<div style="border-left: 4px solid #0078D7; padding-left: 15px;">

#### 1. [Workshop Overview](#workshop-overview)

#### 2. [Day 1: DevSecOps Foundation & GitLab Architecture](#day-1-devsecops-foundation--gitlab-architecture)

#### 3. [Day 2: Pipeline Engineering & Container Security](#day-2-pipeline-engineering--container-security)

#### 4. [Day 3: Advanced Deployment Strategies & Production Readiness](#day-3-advanced-deployment-strategies--production-readiness)

#### 5. [Appendices](#appendices)

</div>

</div>
<div style="page-break-after: always;"></div>

## Workshop Overview

This  workshop is designed to equip technical teams with advanced knowledge and practical skills in implementing enterprise-grade CI/CD pipelines using GitLab's DevOps platform. The focus is on security-conscious environments where data protection and compliance are paramount concerns.

### Learning Objectives

By the end of this workshop, you will be able to:

1. Configure and manage GitLab CI/CD pipelines
2. Implement secure container-based deployments to Kubernetes clusters
3. Integrate automated security scanning throughout the development lifecycle
4. Design and implement advanced deployment strategies
5. Apply Infrastructure-as-Code principles to your development workflow
6. Create audit-ready documentation for compliance purposes

### Workshop Structure

This manual follows the workshop's six sessions across three days. Each topic includes:

- Conceptual overview
- Practical examples
- Hands-on exercises
- Best practices
- Security considerations

<div style="page-break-after: always;"></div>

## Day 1: DevSecOps Foundation & GitLab Architecture

### Session 1: Morning (9:00 AM - 12:30 PM)

#### 1.1 CI/CD Principles in IT Ecosystems

**Continuous Integration Fundamentals**

Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository frequently. Each integration is verified by an automated build and automated tests.

**Key Benefits:**

- Early detection of integration issues
- Reduced debugging time
- Improved code quality
- Faster release cycles

**Example CI Workflow:**

![Continuous Integration and Deployment using GitLab | by Muhammad Zuhdi |  Medium](https://miro.medium.com/v2/resize:fit:1200/0*dm8eB5A5Ho70BJFe.png)

**Continuous Delivery vs. Continuous Deployment**

| Continuous Delivery                      | Continuous Deployment                           |
| ---------------------------------------- | ----------------------------------------------- |
| Ensures code can be deployed at any time | Automatically deploys all changes to production |
| Release decision remains manual          | No human intervention required                  |
| Lower risk                               | Faster releases                                 |
| Ideal for regulated environments         | Ideal for product-driven environments           |

**DevSecOps Methodology**

DevSecOps integrates security practices within the DevOps process, ensuring security is built into the application rather than applied as an afterthought.

**Core Principles:**

- Shift-left security approach
- Automated security testing
- Continuous security monitoring
- Security as code
- Collaboration between development, operations, and security teams

**Value Stream Mapping for Pipeline Optimization**

Value Stream Mapping (VSM) identifies waste and bottlenecks in the software delivery process.

**Exercise 1.1:** Map your current deployment process, identifying:

- Wait times between stages
- Manual interventions
- Quality control points
- Approval gates

**Case Study: Financial Institution CI/CD Implementation**

A major financial institution implemented CI/CD while maintaining strict security and compliance requirements. They achieved:

- 85% reduction in deployment time
- 94% decrease in deployment failures
- 100% compliance with regulatory requirements

**Key Implementation Strategies:**

- Gradual introduction of automation
- Comprehensive audit logging
- Segregation of duties in the pipeline
- Automated security scanning

<div style="page-break-after: always;"></div>

#### 1.2 GitLab Enterprise Architecture and Security Features

**GitLab Architecture Components**

GitLab is a complete DevOps platform delivered as a single application with the following key components:

**Core Components:**

- GitLab Rails Application
- GitLab Shell
- GitLab Workhorse
- GitLab Pages
- Gitaly
- Sidekiq
- PostgreSQL
- Redis
- Nginx

**Deployment Models:**

GitLab offers multiple deployment options to suit different organizational needs:

1. **Single-node Installation**
   
   - All components on one server
   - Suitable for small teams (up to 500 users)

2. **Scaled Architecture**
   
   - Components distributed across multiple servers
   - Suitable for large enterprises

3. **GitLab Managed Service**
   
   - SaaS offering with managed infrastructure
   - Reduces operational overhead

**Enterprise Security Features**

GitLab provides robust security features designed for enterprise environments:

1. **Authentication Methods**
   
   - LDAP/Active Directory integration
   - SAML SSO
   - OpenID Connect
   - Kerberos
   - Smart card authentication

2. **Role-based Access Control (RBAC)**

GitLab's permission model allows fine-grained access control:

| Role       | Description                          | Typical Use            |
| ---------- | ------------------------------------ | ---------------------- |
| Guest      | Read-only access to repositories     | External auditors      |
| Reporter   | Can create issues and merge requests | Quality assurance team |
| Developer  | Can push to non-protected branches   | Development team       |
| Maintainer | Can push to protected branches       | Team leads             |
| Owner      | Full administrative access           | System administrators  |

**Exercise 1.2:** Configure RBAC for a hypothetical development team with the following roles:

- Senior Developer (needs to approve merge requests)
- Junior Developers (can submit code but not approve)
- Security Analyst (needs to review but not modify code)
- Operations Engineer (needs deployment access)

**Secrets Management**

GitLab provides several methods for secure secrets management:

1. **CI/CD Variables**
   
   - Project-level variables
   - Group-level variables
   - Instance-level variables
   - Protected variables (masked in logs)

2. **Integration with External Secret Managers**
   
   - HashiCorp Vault
   - AWS Secrets Manager
   - Azure Key Vault

**Example: Configuring Protected Variables**

```yaml
# In .gitlab-ci.yml
variables:
  # Regular variable
  API_URL: "https://api.example.com"

  # Protected and masked variable (defined in GitLab UI)
  # API_TOKEN: "secret-token"

job:
  script:
    - curl -H "Authorization: Bearer $API_TOKEN" $API_URL
```

**Audit Logging and Compliance Reporting**

GitLab Enterprise Edition provides comprehensive audit logs:

- User authentication events
- Project creation/deletion
- Permission changes
- Push events
- Merge request approvals

**Example Audit Log Entry:**

```json
{
  "author_id": 42,
  "author_name": "Jane Smith",
  "entity_id": 123,
  "entity_type": "Project",
  "action": "create",
  "target_id": 456,
  "target_type": "MergeRequest",
  "created_at": "2023-06-15T14:32:10Z"
}
```

<div style="page-break-after: always;"></div>

#### 1.3 Pipeline Components and Infrastructure-as-Code (IaC) Methodologies

**GitLab CI/CD Pipeline Architecture**

A GitLab CI/CD pipeline consists of:

1. **Stages**: Sequential groups of jobs
2. **Jobs**: Individual units of work
3. **Runners**: Agents that execute jobs
4. **Artifacts**: Files produced by jobs
5. **Cache**: Temporary storage between jobs

**Basic Pipeline Structure:**

```yaml
stages:
  - build
  - test
  - deploy

build_job:
  stage: build
  script:
    - echo "Building the application..."
    - make build

test_job:
  stage: test
  script:
    - echo "Running tests..."
    - make test

deploy_job:
  stage: deploy
  script:
    - echo "Deploying application..."
    - make deploy
```

**YAML Configuration Syntax Fundamentals**

GitLab CI/CD uses YAML for pipeline configuration:

```yaml
# Basic job structure
job_name:
  stage: stage_name
  script:
    - command1
    - command2

  # Job control
  only:
    - main
  except:
    - tags

  # Dependencies
  dependencies:
    - another_job

  # Artifacts
  artifacts:
    paths:
      - path/to/artifact
    expire_in: 1 week
```

**Infrastructure-as-Code Principles**

Infrastructure-as-Code (IaC) treats infrastructure configuration as software:

**Key Benefits:**

- Version-controlled infrastructure
- Repeatable deployments
- Self-documenting configurations
- Consistent environments

**Popular IaC Tools:**

- Terraform
- Ansible
- Kubernetes Manifests
- CloudFormation
- Pulumi

**Exercise 1.3:** Create a basic GitLab CI pipeline for a sample application that includes:

- Building a Docker image
- Running unit tests
- Deploying to a staging environment

<div style="page-break-after: always;"></div>

### Session 2: Afternoon (1:30 PM - 5:00 PM)

#### 2.1 Hands-on: GitLab Instance Configuration

**Setting up GitLab with Security Hardening**

**Initial Setup Considerations:**

- Hardware requirements
- Network configuration
- TLS certificate implementation
- Backup strategy

**Security Hardening Checklist:**

1. **Network Security**
   
   - Configure HTTPS with strong cipher suites
   - Implement IP restrictions where appropriate
   - Use a Web Application Firewall (WAF)

2. **Authentication Security**
   
   - Enable 2FA enforcement
   - Implement strong password policies
   - Configure session timeout values

3. **Application Security**
   
   - Disable features not in use
   - Update to latest version
   - Configure rate limiting

**User Management and Organization Structure**

GitLab organization structure follows this hierarchy:

1. **Instance**
   
   - Contains all users and groups
   - Managed by instance administrators

2. **Groups**
   
   - Contains projects and subgroups
   - Allows sharing resources across projects

3. **Projects**
   
   - Contains code repositories
   - Has its own CI/CD configuration

**Best Practices for Organization Structure:**

- Create groups based on business units
- Use subgroups for teams within business units
- Create projects for individual applications
- Use consistent naming conventions

**Example: Organization Structure for Enterprise**

```
Instance
├── Security (Group)
│   ├── Vulnerability Management (Subgroup)
│   │   ├── Scanner (Project)
│   │   └── Dashboard (Project)
│   └── Compliance (Subgroup)
│       ├── Reports (Project)
│       └── Auditing (Project)
├── Development (Group)
│   ├── Frontend (Subgroup)
│   │   ├── Web Application (Project)
│   │   └── Mobile Application (Project)
│   └── Backend (Subgroup)
│       ├── API (Project)
│       └── Database (Project)
└── Operations (Group)
    ├── Infrastructure (Subgroup)
    │   ├── Terraform Modules (Project)
    │   └── Ansible Playbooks (Project)
    └── Monitoring (Subgroup)
        ├── Prometheus Configuration (Project)
        └── Grafana Dashboards (Project)
```

**Exercise 2.1:** Design an organizational structure for your projects, considering:

- Current team structure
- Project dependencies
- Access control requirements
- Resource sharing needs

**Project Configuration and Visibility Settings**

GitLab projects have different visibility levels:

1. **Private**
   
   - Only project members can access
   - Most secure option
   - Default for sensitive projects

2. **Internal**
   
   - All authenticated users can access
   - Good for internal libraries
   - Not for sensitive information

3. **Public**
   
   - Anyone can access
   - Suitable for open-source projects
   - Highest visibility risk

**Project Settings Checklist:**

- Set appropriate visibility level
- Configure merge request settings
- Set up protected branches
- Configure issue management
- Set up CI/CD variables

**Backup and Disaster Recovery Configuration**

GitLab backup strategies:

1. **Built-in Backup Tool**
   
   ```bash
   # Create a backup
   sudo gitlab-backup create
   
   # Restore from backup
   sudo gitlab-backup restore BACKUP=timestamp_of_backup
   ```

2. **Storage-level Backups**
   
   - Volume snapshots
   - Replication to secondary storage
   - Offsite backup copies

**Disaster Recovery Plan Components:**

- Regular testing of backups
- Documented recovery procedures
- Recovery time objectives (RTO)
- Recovery point objectives (RPO)
- Geo-replication for high availability

<div style="page-break-after: always;"></div>

#### 2.2 Runner Deployment with Hardened Security Profiles

**GitLab Runner Architecture**

GitLab Runners are the agents that execute CI/CD jobs:

![Using SSH Private Keys with GitLab Runner | Parvaiz Ahmad](https://ik.imagekit.io/yhmzg9hf6/gitlab-runner.png?updatedAt=1724906195090)

**Runner Types:**

1. **Shared Runners**
   
   - Available to all projects
   - Managed by instance administrators
   - Suitable for general-purpose jobs

2. **Group Runners**
   
   - Available to all projects in a group
   - Managed by group administrators
   - Good for team-specific resources

3. **Project Runners**
   
   - Available only to specific projects
   - Managed by project maintainers
   - Ideal for project-specific requirements

**Execution Environments:**

1. **Shell Executor**
   
   - Runs directly on the runner machine
   - Simple but less isolated
   - Limited security features

2. **Docker Executor**
   
   - Runs each job in a container
   - Better isolation
   - More consistent environment

3. **Kubernetes Executor**
   
   - Runs each job in a Kubernetes pod
   - Excellent scalability
   - Strong isolation

**Example: Runner Registration**

```bash
# Register a new runner
gitlab-runner register \
  --url "https://gitlab.example.com/" \
  --registration-token "PROJECT_REGISTRATION_TOKEN" \
  --description "Secured Docker Runner" \
  --executor "docker" \
  --docker-image "alpine:latest" \
  --tag-list "docker,secure" \
  --run-untagged="false" \
  --locked="true"
```

**Runner Security Hardening Techniques**

1. **Isolation Strategies**
   
   - Use containers or VMs for job execution
   - Implement network isolation
   - Use ephemeral runners when possible

2. **Access Control**
   
   - Run with minimal permissions
   - Use dedicated service accounts
   - Implement strict firewall rules

3. **Secrets Management**
   
   - Use GitLab's protected variables
   - Implement secrets rotation
   - Consider using external secret managers

**Exercise 2.2:** Configure a secure GitLab runner with:

- Docker executor
- Resource constraints
- Security hardening
- Appropriate network isolation

<div style="page-break-after: always;"></div>

#### 2.3 Repository Structure and Branch Protection Policies

**Repository Organization Best Practices**

1. **Repository Structure**
   
   - Keep repositories focused on a single component
   - Document structure in README.md
   - Use consistent patterns across projects

2. **File Organization**
   
   - Organize by feature or module
   - Keep configuration separate from code
   - Use consistent naming conventions

3. **Documentation**
   
   - Maintain up-to-date README files
   - Document architecture decisions
   - Include setup and contribution guidelines

**Example: Standard Repository Structure**

```
project/
├── .gitlab/
│   └── issue_templates/
│       ├── bug.md
│       └── feature.md
├── .gitlab-ci.yml
├── src/
│   ├── main/
│   │   └── ...
│   └── test/
│       └── ...
├── docs/
│   ├── architecture.md
│   └── contributing.md
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── .gitignore
├── Dockerfile
└── README.md
```

**Implementing GitFlow and Branching Strategies**

GitFlow is a branching model that defines a strict branching pattern:

![GitFlow Model](https://nvie.com/img/git-model@2x.png)

**Key Branches:**

1. **Main/Master**
   
   - Contains production code
   - Never commit directly to this branch
   - Should always be deployable

2. **Develop**
   
   - Integration branch for features
   - Contains latest delivered development changes
   - May be unstable

3. **Feature Branches**
   
   - Created from develop
   - Merged back to develop
   - Used for new features

4. **Release Branches**
   
   - Created from develop
   - Merged to main and develop
   - Used for release preparation

5. **Hotfix Branches**
   
   - Created from main
   - Merged to main and develop
   - Used for urgent fixes

**Branch Protection Rules**

Branch protection rules prevent direct modifications to important branches:

**Common Protection Rules:**

- Require merge requests
- Require approval from code owners
- Require passing CI/CD pipeline
- Require resolved discussions
- Prevent force pushes

**Example: Branch Protection Configuration**

In GitLab UI:

1. Go to Settings > Repository
2. Expand Protected Branches
3. Add protection for main branch:
   - Allowed to merge: Maintainers
   - Allowed to push: No one
   - Require code owner approval: Yes
   - Require passing CI: Yes

**Exercise 2.3:** Set up a GitFlow branching strategy with appropriate branch protection rules for a sample project.

<div style="page-break-after: always;"></div>

## Day 2: Pipeline Engineering & Container Security

### Session 3: Morning (9:00 AM - 12:30 PM)

#### 3.1 YAML Pipeline Syntax and Configuration Best Practices

**Advanced YAML Syntax for Complex Pipelines**

GitLab CI/CD uses YAML for pipeline configuration, with several advanced features:

**1. Multi-line Strings**

```yaml
job_name:
  script:
    - |
      echo "This is a multi-line script that
      will be executed as a single command
      in the shell"
    - >
      echo "This is also multi-line but
      will be executed with all newlines
      replaced by spaces"
```

**2. Job Inheritance with Extends**

```yaml
.base_job: &base_job
  image: alpine:latest
  before_script:
    - echo "Preparing environment"

test_job:
  <<: *base_job  # Anchor reference
  script:
    - echo "Running tests"
```

**3. Includes for Modular Configuration**

```yaml
include:
  - local: '/templates/build.yml'  # From same repo
  - project: 'group/templates'     # From another project
    file: '/templates/test.yml'
  - template: 'Security/SAST.gitlab-ci.yml'  # GitLab template
```

**4. Advanced Conditions**

```yaml
job:
  script: echo "Running job"
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
      when: manual
    - if: '$CI_COMMIT_BRANCH == "main"'
      when: always
    - when: never
```

**Pipeline Templates and Inheritance**

Templates allow reuse of pipeline configurations:

```yaml
# In /templates/build.yml
.build_template:
  stage: build
  script:
    - echo "Building application"
  artifacts:
    paths:
      - build/

# In .gitlab-ci.yml
include:
  - local: '/templates/build.yml'

build_job:
  extends: .build_template
  variables:
    BUILD_TYPE: "production"
```

**Variables, Anchors, and Aliases**

YAML anchors and aliases reduce duplication:

```yaml
variables:
  GLOBAL_VAR: "value"

.default_config: &default_config
  image: alpine:latest
  tags:
    - kubernetes

.ruby_config: &ruby_config
  <<: *default_config
  image: ruby:3.0

test:
  <<: *ruby_config
  script:
    - echo "Using $GLOBAL_VAR"
    - ruby -v
```

**Conditional Execution**

Control job execution based on conditions:

```yaml
job:
  script: echo "Running job"
  only:
    variables:
      - $CI_COMMIT_MESSAGE =~ /run-tests/
  except:
    - schedules
```

Or with the more powerful `rules` keyword:

```yaml
job:
  script: echo "Running job"
  rules:
    - if: '$CI_PIPELINE_SOURCE == "schedule"'
      when: never
    - if: '$CI_COMMIT_MESSAGE =~ /skip-tests/'
      when: never
    - if: '$CI_COMMIT_TAG'
      variables:
        DEPLOY_ENVIRONMENT: production
    - if: '$CI_COMMIT_BRANCH == "main"'
      variables:
        DEPLOY_ENVIRONMENT: staging
    - when: manual
```

**Exercise 3.1:** Create a complex pipeline with:

- Environment-specific variables
- Job inheritance
- Advanced conditions
- Modular configuration with includes

<div style="page-break-after: always;"></div>

#### 3.2 Stage Orchestration and Dependency Management

**Pipeline Stages and Job Dependencies**

Stages define the sequence of pipeline execution:

```yaml
stages:
  - build
  - test
  - security
  - deploy

build_job:
  stage: build
  script: echo "Building"

test_job:
  stage: test
  script: echo "Testing"
  needs:
    - build_job

security_job:
  stage: security
  script: echo "Security scanning"
  needs:
    - build_job

deploy_job:
  stage: deploy
  script: echo "Deploying"
  needs:
    - test_job
    - security_job
```

The `needs` keyword allows fine-grained control of job execution order, enabling advanced workflows like directed acyclic graphs (DAGs).

**Artifact Passing Between Stages**

Artifacts allow passing files between jobs:

```yaml
build:
  stage: build
  script:
    - mkdir -p build/
    - echo "Built artifact" > build/artifact.txt
  artifacts:
    paths:
      - build/
    expire_in: 1 week

test:
  stage: test
  script:
    - cat build/artifact.txt
    - echo "Tests passed" > test_results.txt
  artifacts:
    paths:
      - test_results.txt
    reports:
      junit: test_results.xml
```

**Caching Strategies**

Caching speeds up builds by reusing dependencies:

```yaml
cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/
    - .npm/

build:
  script:
    - npm ci
    - npm run build
```

**Cache Key Strategies:**

1. **Per-branch caching**
   
   ```yaml
   cache:
    key: ${CI_COMMIT_REF_SLUG}
   ```

2. **Per-job caching**
   
   ```yaml
   cache:
    key: $CI_JOB_NAME
   ```

3. **Composite keys**
   
   ```yaml
   cache:
    key: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
   ```

4. **Files-based keys**
   
   ```yaml
   cache:
    key:
      files:
        - package-lock.json
   ```

**Parallelization and Distributed Execution**

Run jobs in parallel with the `parallel` keyword:

```yaml
test:
  script:
    - npm test
  parallel: 3
```

For more complex parallelization:

```yaml
tests:
  script:
    - npm test -- --ci --jest-circus --coverage --testPathPattern="/$CI_NODE_INDEX/$CI_NODE_TOTAL"
  parallel:
    matrix:
      - TEST_TYPE:
        - unit
        - integration
        - e2e
```

**Exercise 3.2:** Design a pipeline with:

- Efficient caching strategy
- Artifact passing between jobs
- Parallelized test execution

<div style="page-break-after: always;"></div>

#### 3.3 Zero-trust Container Security Implementation

**Zero-trust Security Model Fundamentals**

Zero-trust security operates on the principle "never trust, always verify":

**Core Principles:**

- Verify every user/service
- Validate every device
- Limit access to resources
- Inspect and log all traffic
- Assume breach at all times

**Zero-trust in Container Environments:**

- Verify container images
- Validate runtime behavior
- Limit container privileges
- Inspect container communication
- Assume container compromise

**Container Security Best Practices**

1. **Build-time Security:**
   
   - Use minimal base images
   - Avoid running as root
   - Scan for vulnerabilities
   - Pin dependencies to specific versions
   - Remove unnecessary tools

2. **Deploy-time Security:**
   
   - Sign and verify images
   - Enforce admission control
   - Apply security policies

3. **Runtime Security:**
   
   - Implement network segmentation
   - Use seccomp and AppArmor profiles
   - Enable audit logging
   - Implement runtime threat detection

**Example: Secure Dockerfile**

```dockerfile
# Use specific version of minimal image
FROM alpine:3.14

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy application files
COPY --chown=appuser:appgroup . /app/

# Install only required dependencies
RUN apk add --no-cache nodejs npm && \
    npm ci --production && \
    npm cache clean --force && \
    rm -rf /tmp/*

# Use non-root user
USER appuser

# Expose only necessary port
EXPOSE 3000

# Run with minimal capabilities
ENTRYPOINT ["node", "app.js"]
```

**Image Signing and Verification**

Image signing ensures container integrity:

1. **Cosign Signing**
   
   ```bash
   # Install cosign
   brew install cosign
   
   # Generate keys
   cosign generate-key-pair
   
   # Sign an image
   cosign sign --key cosign.key my-registry.io/my-app:latest
   
   # Verify an image
   cosign verify --key cosign.pub my-registry.io/my-app:latest
   ```

2. **Integration with GitLab**
   
   ```yaml
   # .gitlab-ci.yml
   sign_image:
    stage: sign
    script:
      - cosign sign --key ${COSIGN_KEY} ${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHA}
    only:
      - main
   ```

**Runtime Security Monitoring**

Tools for container runtime security:

1. **Falco**
   
   - Open-source container runtime security
   - Detects unexpected behavior
   - Creates alerts for security violations

2. **Open Policy Agent (OPA)**
   
   - Policy-based security enforcement
   - Validates against defined rules
   - Integrates with Kubernetes

**Exercise 3.3:** Implement zero-trust security for a containerized application, including:

- Secure Dockerfile
- Image scanning in CI/CD
- Security policies
- Runtime monitoring

<div style="page-break-after: always;"></div>

### Session 4: Afternoon (1:30 PM - 5:00 PM)

#### 4.1 Hands-on: Docker Image Building with Multi-stage Optimization

**Dockerfile Best Practices for Security**

1. **Use Specific Tags**
   
   ```dockerfile
   # Bad: Uses latest tag
   FROM node:latest
   
   # Good: Uses specific version
   FROM node:16.14.2-alpine3.15
   ```

2. **Minimize Image Layers**
   
   ```dockerfile
   # Bad: Multiple RUN commands create many layers
   FROM node:16-alpine
   RUN apk update
   RUN apk add git
   RUN npm install
   
   # Good: Chain commands to reduce layers
   FROM node:16-alpine
   RUN apk update && \
      apk add git && \
      npm install
   ```

3. **Remove Unnecessary Tools**
   
   ```dockerfile
   # Don't install debugging tools in production
   RUN apk add --no-cache curl git # Avoid this
   
   # Install only what's needed
   RUN apk add --no-cache --virtual .build-deps \
      gcc make g++ && \
      npm ci && \
      apk del .build-deps
   ```

4. **Use Non-Root User**
   
   ```dockerfile
   # Create and use non-root user
   RUN adduser -D appuser
   USER appuser
   ```

5. **Set Filesystem Permissions**
   
   ```dockerfile
   COPY --chown=appuser:appuser . /app
   ```

**Multi-stage Builds for Size Optimization**

Multi-stage builds separate build environments from runtime environments:

```dockerfile
# Build stage
FROM node:16-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM nginx:1.21-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Benefits:

- Smaller final image
- No build tools in production
- Reduced attack surface
- Cleaner separation of concerns

**Base Image Selection Criteria**

When selecting base images, consider:

1. **Security**
   
   - Official images with regular updates
   - Minimal distros (Alpine, Distroless)
   - Scanner trusted images

2. **Size**
   
   - Alpine vs. slim vs. distroless
   - Specific language versions
   - Specific distro versions

3. **Compatibility**
   
   - Required system libraries
   - Architecture support
   - Debugging capabilities

**Base Image Comparison:**

| Image Type             | Size    | Security                              | Pros               | Cons                           |
| ---------------------- | ------- | ------------------------------------- | ------------------ | ------------------------------ |
| Full (e.g., ubuntu)    | 300MB+  | More packages = larger attack surface | Complete toolset   | Large size                     |
| Slim (e.g., node:slim) | 150MB+  | Reduced packages                      | Good balance       | Still includes package manager |
| Alpine                 | 5-30MB  | Minimal packages                      | Very small         | Different libc implementation  |
| Distroless             | 20-80MB | No shell, package manager             | Excellent security | Hard to debug                  |

**Exercise 4.1:** Create a multi-stage Dockerfile for a sample application that:

- Uses appropriate base images
- Implements security best practices
- Minimizes final image size
- Runs as non-root user

<div style="page-break-after: always;"></div>

#### 4.2 Vulnerability Scanning Integration (Trivy, Anchore)

**Container Image Vulnerability Scanning**

Vulnerability scanning identifies security issues in container images:

**Key Benefits:**

- Early detection of vulnerabilities
- Prevention of known exploits
- Compliance with security policies
- Documentation of security posture

**Common Vulnerability Sources:**

- OS packages (apt, apk, rpm)
- Language dependencies (npm, pip, gem)
- Application frameworks
- Custom application code

**Setting Security Thresholds and Quality Gates**

Define security thresholds to block risky deployments:

```yaml
container_scanning:
  script:
    # Fail on critical vulnerabilities
    - trivy image --exit-code 1 --severity CRITICAL ${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHA}
    # Generate report for high vulnerabilities but don't fail
    - trivy image --exit-code 0 --severity HIGH ${CI_REGISTRY_IMAGE}:${CI_COMMIT_SHA}
  allow_failure: false  # This makes the pipeline fail if the job fails
```

**Remediation Workflows for Identified Vulnerabilities**

Create effective remediation processes:

1. **Automated Dependency Updates**
   
   ```yaml
   dependency_update:
    stage: build
    script:
      - npm audit fix
      - git config user.name "Dependency Bot"
      - git config user.email "dependencybot@example.com"
      - git add package*.json
      - git commit -m "chore: update dependencies" || true
      - git push origin HEAD:${CI_COMMIT_REF_NAME}
    only:
      - schedules
   ```

2. **Security Issue Tracking**
   
   ```yaml
   create_security_issue:
    stage: report
    script:
      - |
        if [ -f trivy-report.json ]; then
          python3 create_issues.py trivy-report.json
        fi
    when: on_failure
   ```

**Exercise 4.2:** Implement a complete vulnerability scanning pipeline with:

- Multiple scanning tools (Trivy, Grype, etc.)
- Different thresholds for different environments
- Automatic issue creation for vulnerabilities
- Remediation tracking

<div style="page-break-after: always;"></div>

#### 4.3 Artifact Management and Versioning Strategies

**GitLab Package Registry Configuration**

GitLab Package Registry stores build artifacts:

1. **Registry Setup**
   
   ```yaml
   # .gitlab-ci.yml for npm packages
   publish:
    stage: deploy
    script:
      - echo "@${CI_PROJECT_ROOT_NAMESPACE}:registry=${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/npm/" > .npmrc
      - echo "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/npm/:_authToken=${CI_JOB_TOKEN}" >> .npmrc
      - npm publish
    only:
      - tags
   ```

2. **Container Registry**
   
   ```yaml
   # .gitlab-ci.yml for container images
   build_container:
    stage: build
    image: docker:20.10.16
    services:
      - docker:20.10.16-dind
    script:
      - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
      - docker build -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
      - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
      - if [[ "$CI_COMMIT_BRANCH" == "main" ]]; then
      -   docker tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA $CI_REGISTRY_IMAGE:latest
      -   docker push $CI_REGISTRY_IMAGE:latest
      - fi
   ```

**Artifact Retention Policies**

Configure retention to manage storage:

```yaml
artifacts:
  paths:
    - dist/
  expire_in: 1 week  # Options: never, 30 mins, 1 day, 1 week, 1 month
```

For system-wide retention policies:

1. **Project Settings**
   
   - Settings > CI/CD > Artifacts > Expiration time

2. **Instance Settings** (for administrators)
   
   - Admin Area > Settings > CI/CD > Artifacts > Default expiration time

**Artifact Promotion Between Environments**

Promote artifacts through environments:

```yaml
stages:
  - build
  - test
  - staging
  - production

build_artifact:
  stage: build
  script:
    - npm ci
    - npm run build
  artifacts:
    paths:
      - dist/

deploy_staging:
  stage: staging
  script:
    - deploy_script.sh staging dist/
  environment:
    name: staging

deploy_production:
  stage: production
  script:
    - deploy_script.sh production dist/
  environment:
    name: production
  when: manual
  only:
    - main
```

**Dependency Management and Bill of Materials**

Track dependencies for security and compliance:

1. **Using SBOM Tools**
   
   ```yaml
   generate_sbom:
    stage: build
    script:
      - cyclonedx-npm --output bom.xml
    artifacts:
      paths:
        - bom.xml
   ```

2. **Dependency Locking**
   
   ```yaml
   validate_dependencies:
    stage: build
    script:
      - npm ci --package-lock-only
      - git diff --exit-code package-lock.json || (echo "Package lock changed. Please commit the updated lock file." && exit 1)
   ```

**Exercise 4.3:** Implement an artifact management strategy that includes:

- Semantic versioning for releases
- Artifact promotion workflow
- Software Bill of Materials (SBOM) generation
- Dependency locking and verification

<div style="page-break-after: always;"></div>

## Day 3: Advanced Deployment Strategies & Production Readiness

### Session 5: Morning (9:00 AM - 12:30 PM)

#### 5.1 Multi-environment Deployments with GitOps Workflows

**Environment Configuration Management**

Managing multiple environments requires careful configuration:

1. **Environment Definition**
   
   ```yaml
   # .gitlab-ci.yml
   deploy_dev:
    environment:
      name: development
      url: https://dev.example.com
   
   deploy_staging:
    environment:
      name: staging
      url: https://staging.example.com
   
   deploy_production:
    environment:
      name: production
      url: https://example.com
      on_stop: stop_production
   
   stop_production:
    environment:
      name: production
      action: stop
    when: manual
   ```

2. **Environment-specific Configuration**
   
   ```yaml
   # .gitlab-ci.yml
   .deploy_template: &deploy_template
    script:
      - deploy.sh --environment $CI_ENVIRONMENT_NAME
   
   deploy_dev:
    <<: *deploy_template
    environment:
      name: development
   
   deploy_staging:
    <<: *deploy_template
    environment:
      name: staging
   ```

**GitOps Principles and Implementation**

GitOps uses Git as the single source of truth for infrastructure:

**Key Principles:**

- Declarative configuration
- Version-controlled infrastructure
- Automated reconciliation
- Self-healing systems

**Implementation with Flux or ArgoCD:**

1. **ArgoCD Setup**
   
   ```yaml
   # GitLab CI job to install ArgoCD
   install_argocd:
    stage: setup
    script:
      - kubectl create namespace argocd
      - kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```

2. **Application Definition**
   
   ```yaml
   # application.yaml
   apiVersion: argoproj.io/v1alpha1
   kind: Application
   metadata:
    name: my-app
    namespace: argocd
   spec:
    project: default
    source:
      repoURL: ${CI_REPOSITORY_URL}
      targetRevision: HEAD
      path: k8s
    destination:
      server: https://kubernetes.default.svc
      namespace: my-app
    syncPolicy:
      automated:
        prune: true
        selfHeal: true
   ```

3. **GitLab Integration**
   
   ```yaml
   deploy_with_gitops:
    stage: deploy
    script:
      - kubectl apply -f application.yaml
    environment:
      name: production
   ```

**Environment-specific Variables and Secrets**

Manage sensitive data securely:

1. **GitLab CI Variables**
   
   - Project Settings > CI/CD > Variables
   - Mark sensitive variables as "Protected" and "Masked"

2. **Environment Scoping**
   
   ```yaml
   # Set variables for specific environments
   variables:
    GLOBAL_VAR: "value for all environments"
   
   deploy_dev:
    variables:
      ENV_SPECIFIC_VAR: "dev value"
    environment:
      name: development
   
   deploy_prod:
    variables:
      ENV_SPECIFIC_VAR: "prod value"
    environment:
      name: production
   ```

3. **External Secret Management**
   
   ```yaml
   # Using Vault for secrets
   deploy:
    script:
      - vault read -field=api_key secret/my-app | kubectl create secret generic api-key --from-file=api_key=/dev/stdin
   ```

**Configuration Drift Detection and Remediation**

Detect and fix configuration drift:

1. **Drift Detection with ArgoCD**
   
   ```yaml
   check_drift:
    stage: verify
    script:
      - argocd app diff my-app --local k8s/
    allow_failure: true
   ```

2. **Automatic Remediation**
   
   ```yaml
   remediate_drift:
    stage: fix
    script:
      - argocd app sync my-app
    when: on_failure
   ```

**Exercise 5.1:** Set up a GitOps workflow with:

- Multiple environment configurations
- Secure secret management
- Configuration drift detection
- Automated remediation

<div style="page-break-after: always;"></div>

#### 5.2 Kubernetes Manifest Generation and Deployment Strategies

**Dynamic Kubernetes Manifest Generation**

Generate Kubernetes manifests dynamically:

1. **Using Templates**
   
   ```yaml
   # deployment.yaml.template
   apiVersion: apps/v1
   kind: Deployment
   metadata:
    name: ${APP_NAME}
   spec:
    replicas: ${REPLICAS}
    selector:
      matchLabels:
        app: ${APP_NAME}
    template:
      metadata:
        labels:
          app: ${APP_NAME}
      spec:
        containers:
        - name: ${APP_NAME}
          image: ${IMAGE_URL}:${IMAGE_TAG}
          ports:
          - containerPort: 80
   ```

2. **Template Processing in CI/CD**
   
   ```yaml
   generate_manifests:
    stage: prepare
    script:
      - export APP_NAME=my-app
      - export REPLICAS=3
      - export IMAGE_URL=$CI_REGISTRY_IMAGE
      - export IMAGE_TAG=$CI_COMMIT_SHA
      - envsubst < deployment.yaml.template > deployment.yaml
    artifacts:
      paths:
        - deployment.yaml
   ```

**Helm Chart Integration with GitLab**

Helm is a Kubernetes package manager:

1. **Basic Helm Chart Structure**
   
   ```
   mychart/
   ├── Chart.yaml
   ├── values.yaml
   ├── templates/
   │   ├── deployment.yaml
   │   ├── service.yaml
   │   └── ingress.yaml
   └── charts/
   ```

2. **GitLab CI Integration**
   
   ```yaml
   deploy_helm:
    stage: deploy
    image: alpine/helm:3.9.0
    script:
      - helm upgrade --install my-release ./mychart \
          --set image.repository=$CI_REGISTRY_IMAGE \
          --set image.tag=$CI_COMMIT_SHA \
          --namespace $CI_ENVIRONMENT_SLUG
    environment:
      name: production
   ```

**Blue/Green Deployment Implementation**

Blue/green deployment maintains two identical environments:

1. **Kubernetes Implementation**
   
   ```yaml
   # Create new (green) deployment
   deploy_green:
    stage: deploy
    script:
      - kubectl apply -f deployment-green.yaml
      - kubectl wait --for=condition=available deployment/myapp-green --timeout=300s
   
   # Test green deployment
   test_green:
    stage: test
    script:
      - curl -f http://myapp-green.internal/healthz
   
   # Switch traffic to green deployment
   switch_to_green:
    stage: switch
    script:
      - kubectl apply -f service-green.yaml
   
   # Delete old (blue) deployment
   delete_blue:
    stage: cleanup
    script:
      - kubectl delete -f deployment-blue.yaml
    when: manual
   ```

2. **Service Switching**
   
   ```yaml
   # service.yaml
   apiVersion: v1
   kind: Service
   metadata:
    name: myapp
   spec:
    selector:
      app: myapp
      version: green  # Switch between blue/green
    ports:
    - port: 80
      targetPort: 8080
   ```

**Canary Release Strategies**

Canary releases gradually shift traffic to new versions:

1. **Using Kubernetes Service Mesh (Istio)**
   
   ```yaml
   # virtual-service.yaml
   apiVersion: networking.istio.io/v1alpha3
   kind: VirtualService
   metadata:
    name: myapp
   spec:
    hosts:
    - myapp.example.com
    http:
    - route:
      - destination:
          host: myapp-v1
          subset: v1
        weight: 90
      - destination:
          host: myapp-v2
          subset: v2
        weight: 10
   ```

2. **GitLab Progressive Deployment**
   
   ```yaml
   deploy_canary:
    stage: deploy
    script:
      - kubectl apply -f deployment-canary.yaml
      - kubectl scale --replicas=1 deployment/myapp-canary
    environment:
      name: production
      url: https://example.com
   
   incremental_rollout:
    stage: rollout
    script:
      - kubectl scale --replicas=5 deployment/myapp-canary
      - kubectl scale --replicas=15 deployment/myapp-stable
    when: manual
   
   complete_rollout:
    stage: rollout
    script:
      - kubectl scale --replicas=20 deployment/myapp-canary
      - kubectl scale --replicas=0 deployment/myapp-stable
    when: manual
   ```

**Exercise 5.2:** Implement a deployment strategy with:

- Dynamic Kubernetes manifest generation
- Helm chart for application deployment
- Blue/green deployment option
- Canary release capability

<div style="page-break-after: always;"></div>

#### 5.3 Automated Rollback Mechanisms and Canary Deployments

**Automated Health Checks and Monitoring**

Implement health checks to detect deployment issues:

1. **Kubernetes Probes**
   
   ```yaml
   # deployment.yaml
   spec:
    template:
      spec:
        containers:
        - name: myapp
          image: myapp:latest
          livenessProbe:
            httpGet:
              path: /health
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 10
          readinessProbe:
            httpGet:
              path: /ready
              port: 8080
            initialDelaySeconds: 5
            periodSeconds: 5
   ```

2. **CI/CD Integration**
   
   ```yaml
   deploy:
    script:
      - kubectl apply -f deployment.yaml
      - kubectl rollout status deployment/myapp --timeout=300s
   
   verify_health:
    script:
      - for i in {1..12}; do
      -   STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://myapp.example.com/health)
      -   if [ "$STATUS" = "200" ]; then
      -     echo "Health check passed"
      -     exit 0
      -   fi
      -   sleep 10
      - done
      - echo "Health check failed"
      - exit 1
   ```

**Rollback Trigger Criteria and Implementation**

Define when and how to trigger rollbacks:

1. **Automatic Rollback Conditions**
   
   - Health check failure
   - Error rate threshold exceeded
   - Performance degradation
   - Custom metrics thresholds

2. **Kubernetes Rollback Implementation**
   
   ```yaml
   deploy:
    script:
      - kubectl apply -f deployment.yaml
      - kubectl rollout status deployment/myapp --timeout=300s || kubectl rollout undo deployment/myapp
   ```

**Progressive Traffic Shifting Techniques**

Implement gradual traffic shifting:

1. **Using Istio**
   
   ```yaml
   # Initial deployment - 100% to v1
   apiVersion: networking.istio.io/v1alpha3
   kind: VirtualService
   metadata:
    name: myapp
   spec:
    hosts:
    - myapp.example.com
    http:
    - route:
      - destination:
          host: myapp
          subset: v1
        weight: 100
   ```
   
   ```yaml
   # 90/10 split
   apiVersion: networking.istio.io/v1alpha3
   kind: VirtualService
   metadata:
    name: myapp
   spec:
    hosts:
    - myapp.example.com
    http:
    - route:
      - destination:
          host: myapp
          subset: v1
        weight: 90
      - destination:
          host: myapp
          subset: v2
        weight: 10
   ```

**Feature Flags for Risk Mitigation**

Feature flags decouple deployment from feature activation:

1. **Implementation with Feature Flag Service**
   
   ```javascript
   // Application code
   if (featureFlags.isEnabled('new-payment-system')) {
    // New implementation
    processPaymentV2(order);
   } else {
    // Old implementation
    processPaymentV1(order);
   }
   ```

2. **GitLab Integration**
   
   ```yaml
   deploy:
    script:
      - kubectl apply -f deployment.yaml
      # Enable feature flag for internal users
      - curl -X PATCH https://feature-flags-api.example.com/flags/new-payment-system \
          -H "Content-Type: application/json" \
          -d '{"status": "enabled", "percentage": 10, "userGroups": ["internal"]}'
   
   enable_feature_all:
    script:
      - curl -X PATCH https://feature-flags-api.example.com/flags/new-payment-system \
          -H "Content-Type: application/json" \
          -d '{"status": "enabled", "percentage": 100}'
    when: manual
   ```

**Exercise 5.3:** Design a robust deployment system with:

- Comprehensive health checks
- Automated rollback mechanisms
- Progressive traffic shifting
- Feature flag integration

<div style="page-break-after: always;"></div>

### Session 6: Afternoon (1:30 PM - 5:00 PM)

#### 6.1 Hands-on: Complete Pipeline Implementation

**Integration of All Security Scanning Tools**

Combine multiple security tools for comprehensive protection:

```yaml
# Security stage jobs
dependency_scanning:
  stage: security
  script:
    - npm audit --json > npm-audit.json
  artifacts:
    paths:
      - npm-audit.json

container_scanning:
  stage: security
  image:
    name: aquasec/trivy:latest
    entrypoint: [""]
  script:
    - trivy image --format json --output trivy-results.json $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
  artifacts:
    paths:
      - trivy-results.json

sast:
  stage: security
  image: node:16-alpine
  script:
    - npm ci
    - npm install -g njsscan
    - njsscan . --json > njsscan-results.json
  artifacts:
    paths:
      - njsscan-results.json
```

**Multi-environment Deployment Configuration**

Configure environment-specific deployments:

```yaml
.deploy_template: &deploy_template
  extends: .k8s_deploy
  stage: deploy
  script:
    - sed -i "s|__IMAGE__|$CI_REGISTRY_IMAGE:$CI_COMMIT_SHA|g" k8s/$CI_ENVIRONMENT_NAME/deployment.yaml
    - kubectl apply -f k8s/$CI_ENVIRONMENT_NAME/deployment.yaml
    - kubectl rollout status deployment/myapp -n $CI_ENVIRONMENT_NAME --timeout=300s

deploy_dev:
  <<: *deploy_template
  environment:
    name: development
    url: https://dev.example.com
  rules:
    - if: '$CI_COMMIT_BRANCH != "main" && $CI_PIPELINE_SOURCE == "merge_request_event"'

deploy_staging:
  <<: *deploy_template
  environment:
    name: staging
    url: https://staging.example.com
  rules:
    - if: '$CI_COMMIT_BRANCH == "develop"'

deploy_production:
  <<: *deploy_template
  environment:
    name: production
    url: https://example.com
  when: manual
  rules:
    - if: '$CI_COMMIT_BRANCH == "main"'
```

**Pipeline Performance Optimization**

Optimize pipeline execution time:

1. **Efficient Caching**
   
   ```yaml
   # Cache node_modules based on package-lock.json
   cache:
    key:
      files:
        - package-lock.json
    paths:
      - node_modules/
    policy: pull-push
   ```

2. **Parallelizing Jobs**
   
   ```yaml
   test:
    parallel: 4
    script:
      - npm test -- --split=4 --chunk=$CI_NODE_INDEX
   ```

3. **Optimized Docker Builds**
   
   ```yaml
   build:
    script:
      - docker build --cache-from $CI_REGISTRY_IMAGE:latest -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA .
   ```

**Exercise 6.1:** Build a complete CI/CD pipeline for a sample application that includes:

- Build, test, and security stages
- Multi-environment deployment
- Performance optimizations
- Robust error handling

<div style="page-break-after: always;"></div>

#### 6.2 Compliance Automation and Audit Trail Implementation

**Compliance Requirements for Regulated Systems**

Regulated systems must adhere to various standards:

| Regulation | Key Requirements                                                       |
| ---------- | ---------------------------------------------------------------------- |
| ISO 27001  | Information security management                                        |
| SOC 2      | Security, availability, processing integrity, confidentiality, privacy |
| GDPR       | Data protection and privacy                                            |
| HIPAA      | Health information privacy                                             |
| PCI DSS    | Payment card data security                                             |

**Common Compliance Requirements:**

- Access control
- Change management
- Audit trails
- Data protection
- Incident response
- Risk assessment

**Automated Compliance Checking**

Implement automated compliance checks:

```yaml
compliance_check:
  stage: security
  image: compliance-scanner:latest
  script:
    - scan-compliance --standard iso27001 --output compliance-report.json
    - if [ $(jq '.violations | length' compliance-report.json) -gt 0 ]; then
        echo "Compliance violations detected"
        exit 1
      fi
  artifacts:
    paths:
      - compliance-report.json
```

**Policy as Code:**

```yaml
# Using Open Policy Agent (OPA)
opa_check:
  stage: security
  image: openpolicyagent/opa:latest
  script:
    - opa eval --input deployment.yaml --data policy.rego data.kubernetes.admission.deny > violations.json
    - if [ $(jq 'length' violations.json) -gt 0 ]; then
        echo "Policy violations detected"
        exit 1
      fi
  artifacts:
    paths:
      - violations.json
```

**Comprehensive Audit Trail Implementation**

Implement detailed audit trails:

1. **GitLab Audit Events**
   
   - Enable audit logging in GitLab settings
   - Configure log forwarding to SIEM system

2. **Kubernetes Audit Logging**
   
   ```yaml
   # kube-apiserver configuration
   apiVersion: v1
   kind: Pod
   metadata:
    name: kube-apiserver
   spec:
    containers:
    - command:
      - kube-apiserver
      - --audit-log-path=/var/log/kubernetes/audit.log
      - --audit-log-maxage=30
      - --audit-log-maxbackup=10
      - --audit-log-maxsize=100
      - --audit-policy-file=/etc/kubernetes/audit-policy.yaml
      # Other arguments...
   ```

**Evidence Collection and Reporting**

Collect and preserve compliance evidence:

```yaml
collect_evidence:
  stage: compliance
  script:
    - mkdir -p evidence
    - cp build-info.json evidence/
    - cp test-results.xml evidence/
    - cp security-report.html evidence/
    - cp compliance-report.json evidence/
    - cp deployment-logs.txt evidence/
    - tar -czf evidence.tar.gz evidence/
  artifacts:
    paths:
      - evidence.tar.gz
    expire_in: 1 year
```

**Compliance Documentation Automation**

Generate compliance documentation automatically:

```yaml
generate_compliance_docs:
  stage: compliance
  script:
    - compliance-doc-gen --template soc2-template.md --evidence evidence/ --output compliance-report.md
  artifacts:
    paths:
      - compliance-report.md
```

**Exercise 6.2:** Implement a compliance automation system that includes:

- Automated policy checking
- Comprehensive audit trail
- Evidence collection
- Automated documentation generation

<div style="page-break-after: always;"></div>

#### 6.3 Performance Optimization and Observability Integration

**Pipeline Performance Metrics and Benchmarks**

Track and analyze pipeline performance:

1. **Key Metrics**
   
   - Total pipeline duration
   - Stage durations
   - Job durations
   - Queue time
   - Success/failure rates

2. **Benchmark Collection**
   
   ```yaml
   .performance_benchmark:
    before_script:
      - STAGE_START_TIME=$(date +%s)
    after_script:
      - STAGE_END_TIME=$(date +%s)
      - DURATION=$((STAGE_END_TIME - STAGE_START_TIME))
      - echo "Job duration: $DURATION seconds"
      - |
        curl -X POST https://metrics-api.example.com/pipeline-metrics \
          -H "Content-Type: application/json" \
          -d '{
            "pipeline_id": "'"$CI_PIPELINE_ID"'",
            "job_name": "'"$CI_JOB_NAME"'",
            "duration_seconds": '"$DURATION"',
            "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'"
          }'
   ```

**Build Time Optimization Techniques**

Optimize build times with these techniques:

1. **Efficient Docker Builds**
   
   - Use multi-stage builds
   - Optimize layer caching
   - Use .dockerignore file
   
   ```dockerfile
   # Optimized Dockerfile
   FROM node:16-alpine AS builder
   WORKDIR /app
   COPY package*.json ./
   RUN npm ci
   COPY . .
   RUN npm run build
   
   FROM nginx:alpine
   COPY --from=builder /app/dist /usr/share/nginx/html
   EXPOSE 80
   CMD ["nginx", "-g", "daemon off;"]
   ```

2. **Dependency Caching**
   
   ```yaml
   # Optimized dependency caching
   cache:
    key:
      files:
        - package-lock.json
    paths:
      - .npm/
    policy: pull-push
   
   build:
    script:
      - npm ci --cache .npm --prefer-offline
      - npm run build
   ```

3. **Parallel Job Execution**
   
   ```yaml
   test:
    script:
      - npm test
    parallel: 4
    matrix:
      - SUITE: [unit, integration, e2e, security]
   ```

**Integrating Observability Tools**

Integrate monitoring and observability:

1. **Prometheus Integration**
   
   ```yaml
   # prometheus.yml
   scrape_configs:
    - job_name: 'api'
      metrics_path: '/metrics'
      static_configs:
        - targets: ['api:8080']
   ```

2. **Grafana Dashboard Configuration**
   
   ```yaml
   # Grafana dashboard in CI/CD
   update_dashboard:
    stage: monitor
    image: curlimages/curl:latest
    script:
      - |
        curl -X POST https://grafana.example.com/api/dashboards/db \
          -H "Authorization: Bearer $GRAFANA_API_KEY" \
          -H "Content-Type: application/json" \
          -d @monitoring/dashboards/application-dashboard.json
   ```

**Deployment Metrics Collection and Visualization**

Track deployment-specific metrics:

```yaml
deploy:
  script:
    - DEPLOY_START_TIME=$(date +%s)
    - kubectl apply -f deployment.yaml
    - kubectl rollout status deployment/myapp
    - DEPLOY_END_TIME=$(date +%s)
    - DEPLOY_DURATION=$((DEPLOY_END_TIME - DEPLOY_START_TIME))
    - |
      curl -X POST https://metrics-api.example.com/deployment-metrics \
        -H "Content-Type: application/json" \
        -d '{
          "deployment_id": "'"$CI_PIPELINE_ID"'",
          "environment": "'"$CI_ENVIRONMENT_NAME"'",
          "duration_seconds": '"$DEPLOY_DURATION"',
          "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",
          "successful": true
        }'
```

**Alerting and Notification Configuration**

Configure alerting for pipeline and deployment issues:

1. **Prometheus Alerting Rules**
   
   ```yaml
   # alerting_rules.yml
   groups:
   - name: deployment
    rules:
    - alert: HighErrorRate
      expr: sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m])) > 0.05
      for: 2m
      labels:
        severity: critical
      annotations:
        summary: "High error rate detected"
        description: "Error rate is above 5% for the last 2 minutes"
   ```

**Exercise 6.3:** Implement a comprehensive observability solution with:

- Pipeline performance metrics collection
- Application monitoring integration
- Deployment tracking
- Automated alerting system

<div style="page-break-after: always;"></div>

## Appendices

### Appendix A: GitLab CI/CD Variable Reference

| Variable             | Description                      | Example                                  |
| -------------------- | -------------------------------- | ---------------------------------------- |
| CI_COMMIT_SHA        | Full commit SHA                  | 2293ada6b400935a1378653304eaf6221e0fdb8f |
| CI_COMMIT_SHORT_SHA  | First 8 characters of commit SHA | 2293ada6                                 |
| CI_COMMIT_REF_NAME   | Branch or tag name               | main                                     |
| CI_PIPELINE_ID       | Pipeline ID                      | 123456                                   |
| CI_JOB_ID            | Job ID                           | 123456789                                |
| CI_PROJECT_ID        | Project ID                       | 12345                                    |
| CI_PROJECT_NAME      | Project name                     | my-project                               |
| CI_PROJECT_PATH      | Namespace with project name      | group/project                            |
| CI_REGISTRY          | GitLab Container Registry URL    | registry.gitlab.com                      |
| CI_REGISTRY_IMAGE    | Registry image URL for project   | registry.gitlab.com/group/project        |
| CI_ENVIRONMENT_NAME  | Environment name                 | production                               |
| CI_REGISTRY_USER     | Registry username                | gitlab-ci-token                          |
| CI_REGISTRY_PASSWORD | Registry password                | [MASKED]                                 |

<div style="page-break-after: always;"></div>

### Troubleshooting Guide

**Common Pipeline Issues and Solutions**

| Issue                                | Possible Causes                         | Solutions                                               |
| ------------------------------------ | --------------------------------------- | ------------------------------------------------------- |
| Job timeout                          | Resource constraints, infinite loops    | Increase timeout, optimize code, check for logic errors |
| Job failing with "permission denied" | Missing access rights                   | Verify runner permissions, check file permissions       |
| Docker build fails                   | Connectivity issues, registry problems  | Check network connections, verify registry credentials  |
| Kubernetes deployment fails          | Invalid manifests, resource constraints | Validate YAML, check resource quotas                    |
| Pipeline hangs                       | Resource exhaustion, deadlocks          | Monitor runner resources, implement timeouts            |

**Debugging Techniques**

1. **Enable debug logs**
   
   ```yaml
   job:
    variables:
      CI_DEBUG_TRACE: "true"
    script:
      - ./deploy.sh
   ```

2. **Interactive debugging**
   
   ```yaml
   debug:
    script:
      - apk add openssh
      - mkdir -p ~/.ssh
      - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
      - chmod 600 ~/.ssh/id_rsa
      - ssh -p 22 user@debugger
    when: manual
   ```

3. **Artifact inspection**
   
   ```yaml
   job:
    script:
      - ./build.sh
      - ls -la > build_files.txt
    artifacts:
      paths:
        - build_files.txt
   ```

**Recovery Procedures**

1. **Pipeline Rollback**
   
   ```bash
   # Identify last successful commit
   git log --grep="Successful build"
   
   # Revert to previous state
   git revert <bad-commit-sha>
   git push origin HEAD:main
   ```

2. **Emergency Deployment Rollback**
   
   ```bash
   # Kubernetes rollback
   kubectl rollout undo deployment/myapp -n production
   
   # Verify rollback
   kubectl rollout status deployment/myapp -n production
   ```
