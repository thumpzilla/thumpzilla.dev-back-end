# GCP - thumpzilla.dev - Back-End

![diagram](cloud-diagram.svg)


## Overview

Inspired by the [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/)
, this project introduces a creative twist. Instead of merely showcasing technical skills, the project blends cloud technology with artistic expression.

- View the project website: https://thumpzilla.dev

- Project front-end: https://github.com/thumpzilla/thumpzilla.dev-front-end

## Description

The back-end leverages GitHub for version control, a Cloud Storage bucket, a Python Cloud Function, and a NoSQL database. CI/CD pipelines are set up to automate deployments, maintaining consistent environments for development and production. The front end incorporates HTML, CSS, and a JavaScript file to dynamically fetch and display the visitor count on a static website.


## Technologies Used

- **GitHub Repository**
  - Manages version control.
  - CI/CD Pipeline.
  - **Dev/Prod Branches**
    - Dedicated branches for development and production.
    - Allows testing in a controlled environment before production deployment.
    - Development environment is available at: https://dev.thumpzilla.dev

- **Terraform**
  - **Infrastructure Management**
    - Terraform Resources: Storage Bucket, Cloud Function, and NoSQL database.
  - **Remote State File**
    - Stores Terraform state file remotely for state consistency.
  - **Modules & Environments**
    - Utilizes modules for reusable and modular code.
    - Manages different environments (e.g., dev, prod) efficiently.

- **Cloud Build**
  - CI/CD Pipeline.
  - **Cloud Build Triggers**
    - Automates builds and deployments based on pipeline events.
  - **Substitution Variables**
    - Allows customization of configuration variables based on environments.

- **Cloud Storage**
  - **Static Site Hosting**
    - Hosts static websites directly from a storage bucket. Refer to the [Google documentation](https://cloud.google.com/storage/docs/hosting-static-website) for more details.

- **Cloud Functions**
  - **Python**
    - Utilizes Python for serverless functions.
    - A Python function reads and writes to a NoSQL database for the visitor count.
  - **flake8 for Linting**
    - Ensures code quality and adherence to Python style standards.

- **Firestore**
  - **DB Store**
    - Serves as a NoSQL database for storing and retrieving visitor count.
