# FullTime Force Test

<p align="center">
  <a href="https://www.fulltimeforce.com/" target="blank"><img src="https://uploads-ssl.webflow.com/643458de4c12c42a070ce23a/64dcc8c9fad4ead0c55b75ed_Vectors-Wrapper.svg" width="200" alt="Full Time force logo" /></a>
</p>

<div align="center">
<table><tr><td align="center" valign="middle">

<a href="http://react.dev/" target="blank">
<img src="https://upload.wikimedia.org/wikipedia/commons/a/a7/React-icon.svg" width="100" valign="middle"  alt="React Logo" />
</a>
</td>
<td align="center" valign="middle">
<a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="100" alt="Nest Logo" valign="middle"  /></a>
</td>

<td align="center" valign="middle">
<a href="https://aws.amazon.com/" target="blank"><img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" valign="middle"  width="100" alt="React Logo" />
</a>
</td>

<td align="center" valign="middle">
<a href="https://www.terraform.io/" target="blank"><img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Terraform_Logo.svg" width="100" valign="middle"  alt="Terraform Logo" />
</a>
</td>

<td align="center" valign="middle">
<a href="https://www.docker.com/" target="blank"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/1920px-Docker_%28container_engine%29_logo.svg.png" width="100" valign="middle"  alt="Dcoker Logo" />
</a>
</td>
</tr>
</table>
</div>

This project was made using typescript and the latest version of ReactJS library and NestJS framework also we used AWS, Terraform for CI/CD

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

Live preview of the test [https://d1lhc9385k8pdp.cloudfront.net/](https://d1lhc9385k8pdp.cloudfront.net/)

# Installation

Use the package manager [npm](https://nodejs.org/en/download/) to install the frontend and the backend.

## frontend

```bash
cd frontend
npm install

cd backend
npm install
```

create .env file in frontend folder:

```bash
REACT_APP_BASE_URL=http://localhost:3001
```

create .env file in backend folder:

```bash
GIT_REPO_URL=https://api.github.com/repos/gustavomorillo/full-time-force-test-fullstack
```

# Installation using Docker

```bash
docker compose up
```

backend will run on port 3001 and front end on port 3000

## Run Project

```bash
cd frontend
npm start

cd backend
npm run start:dev
```

## Run Tests

```bash
cd frontend
npm run test

```

## Deploy CI/CD

This project use Github Actions + AWS (services as S3, Elastic Beanstalk, Cloudfront, Ec2) + Terraform

Every push to main will trigger automatic deploy to AWS and the change will be reflected in [
https://d1lhc9385k8pdp.cloudfront.net/](https://d1lhc9385k8pdp.cloudfront.net/)

## License

[MIT](https://choosealicense.com/licenses/mit/)
