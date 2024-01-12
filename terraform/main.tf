provider "github" {
  token = var.github_token
}

resource "github_repository" "todo" {
  name        = "todo"
  description = "Angular App deployed with GitHub Pages"
  visibility  = "public"
}

resource "github_actions_workflow" "deploy" {
  name = "Deploy to GitHub Pages"

  on = {
    push = {}
  }

  resolves = ["Deploy"]

  workflow_content = <<EOF
name: Deploy

on:
  push:
    branches:
      - main


jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2

    - name: Set up Node.js
      uses: actions/setup-node@v3
      with:
        node-version: 14

    - name: Install Dependencies
      run: npm install

    - name: Build Angular App
      run: npm run build --prod

    - name: Deploy to GitHub Pages
      run: |
        git config --global user.email "actions@github.com"
        git config --global user.name "GitHub Actions"
        npx angular-cli-ghpages --dir=dist/todo
EOF
}

output "github_pages_url" {
  value = "https://${github_repository.todo.full_name}.github.io/"
}
